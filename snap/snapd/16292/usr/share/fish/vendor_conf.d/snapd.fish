# Expand $PATH to include the directory where snappy applications go.
set -ul snap_bin_path "/snap/bin"
if not contains $snap_bin_path $PATH
    set PATH $PATH $snap_bin_path
end

# Desktop files (used by desktop environments within both X11 and Wayland) are
# looked for in XDG_DATA_DIRS; make sure it includes the relevant directory for
# snappy applications' desktop files.
set -ul snap_xdg_path /var/lib/snapd/desktop
# note, snapd supports distros going back as far as Ubuntu 16.04, what means we
# must make sure that this is compatible with old fish shells which do not have
# fish_add_path or set --path

if not set -q XDG_DATA_DIRS
    # XDG_DATA_DIRS is not defined, set it to some reasonable defaults
    set --global --export XDG_DATA_DIRS /usr/local/share:/usr/share
end

if not contains $snap_xdg_path (string split : "$XDG_DATA_DIRS")
    set XDG_DATA_DIRS (string join : -- $XDG_DATA_DIRS $snap_xdg_path)
end
