#! /usr/bin/perl -wT
#
# Require the debian package libchart-perl.

use Encode qw(decode encode);
use Chart::LinesPoints;
use Chart::Composite;

$ENV{PATH}="/usr/bin:/bin";
$dirpng = shift @ARGV;
$dirpng =~ m/(.*)/ and $dirpng=$1;
$oneyearago = `date +"%Y-%m-%d" -d "1 year ago"`;

while (<>)
{
   my ($file);
   m/^(.*\/popcon-([0-9-]+)(\.stable)?\.gz)$/ or next;
   $file=$1;
   $f=$2;
   push @date,$f;
   open FILE,"-|:utf8","zcat $file";
   while(<FILE>)
   {
     my @line=split(/ +/);
     if ($line[0] eq "Submissions:")
     {
       $subt{$f}=$line[1];
     }
     elsif ($line[0] eq "Vendor:")
     {
       my $ve=$line[1];
       $ven{$f}->{$ve}=$line[2];
     }
     elsif ($line[0] eq "Architecture:")
     {
       $sub{$f}->{$line[1]}=$line[2];
       $arch{$line[1]}++;
     }
     elsif ($line[0] eq "Release:")
     {
       if (defined($line[2]))
       {
         if ($line[1] =~ m/^([0-9]+(?:\.[0-9]+)?)$/)
         {
           $rel{$f}->{"$1"}+=$line[2];
         } else {
           $rel{$f}->{"unknown"}+=$line[2];
         }
       } else {
         $rel{$f}->{"unknown"}+=$line[1];
       }
     }
     elsif ($line[0] eq "Package:")
     {
       last;
     }
   }
   close FILE;
}

sub ytick
{
  my ($x)=$_[0];
  $x < 1 and return 0;
  return int 2**($x-1);
}

sub getsub
{
  my ($day,$r)=@_;
  return defined($sub{$day}->{$r})?$sub{$day}->{$r}:0;
}

sub submission_chart
{
  my ($pngname,$startdate,$ticks,$title)=@_;
  my (@days) = sort grep { defined($sub{$_}->{'i386'}) } @date;
  @days = sort grep { $_ ge $startdate } @days;
  my (@data) = (\@days);
  my ($today)=$days[-1];
  my (@arch)= sort {getsub($today,$b) <=> getsub($today,$a)} (keys %arch);
  $maxv = -10;
  for $arch (@arch)
  {
	  my @res=();
	  for (@days)
	  {
		  my $data=defined($sub{$_}->{$arch})?log($sub{$_}->{$arch})/log(2)+1:0;
		  push @res,$data;
		  $maxv=$data if ($data > $maxv);
	  }
	  push @data,\@res;
  }

  $obj=Chart::LinesPoints->new (600,500);
  $obj->set ('title' => "Number of submissions per architectures $title");
  $obj->set ('legend_labels' => [@arch]);
  $obj->set ('f_y_tick' => \&ytick);
  $obj->set ('brush_size' => 1);
  $obj->set ('pt_size' => 1);
  $obj->set ('max_val' => $maxv+1);
  $obj->set ('max_y_ticks' => 30);
  $obj->set ('y_ticks' => int $maxv +1);
  $obj->set ('x_ticks' => 'vertical');
  $obj->set ('skip_x_ticks' => $ticks);
  $obj->png ("$dirpng/submission$pngname.png", \@data);
  open LIST,">:utf8","$dirpng/architectures$pngname.txt";
  print LIST "$_\n" for (@arch);
  close LIST;
}

submission_chart ("","0000-00-00",105,"");
submission_chart ("-1year",$oneyearago,14,"(last 12 months)");

my (@days) = sort grep { defined($sub{$_}->{'i386'}) } @date;
my (@arch)= sort (keys %arch);
for $arch (@arch)
{
  my @data;
  my @res=();
  my @tot=();
  for (@days)
  {
    push @res,defined($sub{$_}->{$arch})?$sub{$_}->{$arch}:0;
    push @tot,defined($subt{$_})?$subt{$_}:0;
  }
  @data=(\@days,\@res,\@tot);
  @labels=($arch, 'all submissions');
  $obj=Chart::Composite->new (700,400);
  $obj->set ('title' => "Number of submissions for $arch");
  $obj->set ('legend_labels' => \@labels);
  $obj->set ('brush_size' => 1);
  $obj->set ('pt_size' => 1);
  $obj->set ('x_ticks' => 'vertical');
  $obj->set ('skip_x_ticks' => 105);
  $obj->set ('composite_info' => [ ['LinesPoints', [1]], ['LinesPoints', [2] ] ]);
  $obj->png ("$dirpng/sub-$arch.png", \@data);
}

sub getrel
{
  my ($day,$r)=@_;
  return defined($rel{$day}->{$r})?$rel{$day}->{$r}:0;
}

sub release_chart
{
  my ($pngname,$startdate,$ticks,$title)=@_;
  my (@days) = sort grep { $_ ge $startdate } @date;
  my (%release) = map { map { $_ => 1 } keys %{$rel{$_}}  } @days;
  my (@data) = (\@days);
  my ($today)=$days[-1];
  my (@release)= sort {getrel($today,$b) <=> getrel($today,$a)} (keys %release);
  for $release (@release)
  {
    my @res=();
    for (@days)
    {
      my $data=getrel($_,$release);
      push @res,$data;
    }
    push @data,\@res;
  }
  $obj=Chart::LinesPoints->new (600,500);
  $obj->set ('title' => "popularity-contest versions in use $title");
  $obj->set ('legend_labels' => [@release]);
  $obj->set ('brush_size' => 1);
  $obj->set ('pt_size' => 1);
  $obj->set ('x_ticks' => 'vertical');
  $obj->set ('skip_x_ticks' => $ticks);
  $obj->png ("$dirpng/release$pngname.png", \@data);
}
release_chart ("","2004-05-14",105,"");
release_chart ("-1year",$oneyearago,14,"(last 12 months)");

sub getven
{
  my ($day,$r)=@_;
  return defined($ven{$day}->{$r})?$ven{$day}->{$r}:0;
}

sub vendor_chart
{
  my ($pngname,$startdate,$ticks,$title)=@_;
  my (@days) = sort grep { $_ ge $startdate } @date;
  my (%vendor) = map { map { $_ => 1 } keys %{$ven{$_}}  } @days;
  my (@data) = (\@days);
  my ($today)=$days[-1];
  my (@vendor)= sort {getven($today,$b) <=> getven($today,$a)} (keys %vendor);
  $maxv = -10;
  for $vendor (@vendor)
  {
	  my @res=();
	  for (@days)
	  {
		  my $data=defined($ven{$_}->{$vendor})?log($ven{$_}->{$vendor})/log(2)+1:0;
		  push @res,$data;
		  $maxv=$data if ($data > $maxv);
	  }
	  push @data,\@res;
  }
  $obj=Chart::LinesPoints->new (600,500);
  $obj->set ('title' => "Submissions by distributions $title");
  $obj->set ('legend_labels' => [map {encode("iso-8859-1",$_);} @vendor]);
  $obj->set ('f_y_tick' => \&ytick);
  $obj->set ('brush_size' => 1);
  $obj->set ('pt_size' => 1);
  $obj->set ('max_val' => $maxv+1);
  $obj->set ('max_y_ticks' => 30);
  $obj->set ('y_ticks' => int $maxv+1);
  $obj->set ('x_ticks' => 'vertical');
  $obj->set ('skip_x_ticks' => $ticks);
  $obj->png ("$dirpng/vendors$pngname.png", \@data);
  open LIST,">:utf8","$dirpng/vendors$pngname.txt";
  print LIST "$_\n" for (@vendor);
  close LIST;
}
vendor_chart ("","2013-06-20",105,"");
vendor_chart ("-1year",$oneyearago,14,"(last 12 months)");
