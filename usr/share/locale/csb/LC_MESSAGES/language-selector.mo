��    0      �  C         (  -   )  )   W     �     �  �   �  8        V     h     }  =   �  +   �  /   �  	   -     7     =  D   E     �     �  	   �     �  �   �     �     �     �     �  !   �                    7  }   S  0   �  D   	  �   G	  �   �	  �  U
  N  O  X   �     �                  E   -  '   s     �  /   �     �    �  Y   �  M   N     �     �  �   �  Q   c  &   �     �     �  ;     6   B  =   y     �     �     �  C   �  '     #   9     ]     k  �   �  #   Q     u  	   }     �  !   �  	   �     �  !   �     
  �   %  H   �  C   �     7  �   �  �  S  .  I  v   x     �     �  
           R   >  ;   �     �  3   �     	                    -      
   	   $       .                *                          %         )       '                        (           0                !         &       ,                   #          "       +              /          %(INSTALL)d to install %(INSTALL)d to install %(REMOVE)d to remove %(REMOVE)d to remove %s, %s <b>Example</b> <big><b>Checking available language support</b></big>

The availability of translations or writing aids can differ between languages. <small>Changes take effect next time you log in.</small> Apply System-Wide Chinese (simplified) Chinese (traditional) Configure multiple and native language support on your system Could not install the full language support Could not install the selected language support Currency: Date: Details Display numbers, dates and currency amounts in the usual format for: Incomplete Language Support Install / Remove Languages... Installed Installed Languages It is impossible to install or remove any software. Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first. Keyboard input method system: Language Language Support Language for menus and windows: No language information available Number: Regional Formats Session Restart Required Software database is broken Some translations or writing aids available for your chosen languages are not installed yet. Do you want to install them now? The language support is not installed completely The new language settings will take effect once you have logged out. The system does not have information about the available languages yet. Do you want to perform a network update to get them now?  This is perhaps a bug of this application. Please file a bug report at https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug This setting only affects the language your desktop and applications are displayed in. It does not set the system environment, like currency or date format settings. For that, use the settings in the Regional Formats tab.
The order of the values displayed here decides which translations to use for your desktop. If translations for the first language are not available, the next one in this list will be tried. The last entry of this list is always "English".
Every entry below "English" will be ignored. This will set the system environment like shown below and will also affect the preferred paper format and other region specific settings.
If you want to display the desktop in a different language than this, please select it in the "Language" tab.
Hence you should set this to a sensible value for the region in which you are located. When a language is installed, individual users can choose it in their Language settings. _Install _Remind Me Later _Update alternative datadir check for the given package(s) only -- separate packagenames by comma don't verify installed language support none show installed packages as well as missing ones target language code Project-Id-Version: language-selector
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-11-04 06:30+0000
Last-Translator: Launchpad Translations Administrators <Unknown>
Language-Team: Kashubian <csb@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2;
X-Launchpad-Export-Date: 2020-04-12 23:08+0000
X-Generator: Launchpad (build 2e26c9bbd21cdca248baaea29aeffb920afcc32a)
Language: csb
 %(INSTALL)d do winstalowaniô %(INSTALL)d do winstalowaniô %(INSTALL)d do winstalowaniô %(REMOVE)d do rëmniãcô %(REMOVE)d do rëmniãcô %(REMOVE)d do rëmniãcô %s, %s <b>Przëmiôr</b> <big><b>Sprôwdzanié przëstãpnotë wspiarcô jãzëków</b></big>

Przëstãpnosc dolmaczënków abò dodôłny softwôrë mòże bëc wszelejakô w różnych jãzëkach. <small>Zmianë bãdą aktiwné przë nôslédnym wlogòwaniu do systemë.</small> Zastosùjë dlô człownégò systemù chińsczi (prosti) chińsczi (tradicjowi) Kònfigùracëjô wielojãzëkòwégò wspiarcô w systemie Nie dało sã winstalowac fùl òbsłëdżi jãzëków Nie dało sã winstalowac òbsłëdżi wëbrónëgò jãzëka Dëtczi Datum: Detale Wëskrzënianié wielënów, datumów ë dëtkół w fòrmace dlô: Niefùlwôrtné wspiarcé dlô jãzëka Winstalëjë / Rëmôj jãzëczi... Winstalowóny Winstalowóné jãzëczi Instalacëjô ë rëmanié softwôrë nie je mòżlëwé. Proszã do tegò brëkòwac menadżera paczétów  "Synaptic" abò wpisac w terminalu pòlét  "sudo apt-get install -f" bë naprawic nen problem. Metoda wprowôdzaniu z klawiaturë: Jãzëk Jãzëczi Jãzëk dlô menu ë òczén: Felëje wëdowiédza ò jãzëkù Wielëna: Òbéńdowé nastôwë Nót je zrëszëc kòmpùtr znowa Załamónô baza paczetów Ni wszëtczé dolmaczënczi ë pòmòcné dodôwczi  dlô twòjegò jãzëka są terô winstalowóné. Chcesz je terô doinstalowac? Òbsłużënk przistãpnych jãzëków nie òsta całowno winstalowónô Nowé jãzëkòwé nastôwë bãdą aktiwné pò nowim wlogòwaniu. Systema ni zamëkô jesz w se wëdowiédzë ò przistãpnëch jãzëkach. Zrëszëc sécową aktualizacëjã, abë jã dobëc?  Mòżlëwé, że je to fela ti programë. Proszã wësłac rapòrt ò felë ze starnë https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug To ustawienie ma wpływ na środowisko pulpitu oraz uruchamiane programy. Nie zmienia ono systemu pod kątem preferowanych walut czy formatu daty. Aby zmienić te parametry, użyj zakładki "Ustawienia regionalne".
Wyświetlana kolejność, decyduje o preferencjach języków. Jeżeli pierwsza wersja językowa dla danego programu nie jest dostępna, użyty zostanie następny język z listy. Ostatnią pozycją musi być zawsze język angielski.
Każdy inny poniżej angielskiego, będzie ignorowany. To ustawienie będzie miało taki wpływ na system, jak przedstawiono poniżej. Zmiany dotkną domyślnych rozmiarów papieru oraz innych ustawień regionalnych.
Chcąc zmienić język pulpitu, wybierz właściwy z zakładki "Języki".
Pamiętaj o wymienionych wyżej konsekwencjach wprowadzania zmian. Jak jãzëk bãdze ju winstalowóny to brëkòwnicë bãdą mòglë gò wëbierac w swòjich jãzëkòwich nastôwach. _Instalëjë _Przëbôczë pòzdze Zakt_ualni alternatiwny katalog pòdôwków sprôwdzë blós dóné paczétë -- rozparłãczë miona paczétów rozczidnikama bez sprôwdzaniô winstalowónegò wspiarca dlô jãzëków felënk wëskrzëni winstalowóné ë felëjącé paczétë Docélowi kòd jãzëka 