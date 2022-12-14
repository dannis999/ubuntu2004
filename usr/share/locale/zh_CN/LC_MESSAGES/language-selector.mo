??    ;      ?  O   ?        -   	  )   7     a     h  ?   w  v   ?  8   t  K   ?  N   ?     H     Z     o  =   ?  +   ?  /   ?  	        )     /  D   7  k   |  (   ?  ?  	     ?
     ?
  	   ?
        ?        ?     ?     ?     ?  !        7     ?     P     i     ?  }   ?  0     ?  P  0   ?  D     ?   `  ?   ?  ?  n  N  h  ?   ?  X   ?     ?     ?            E   *  '   p     ?  @   ?  /   ?       ?  #     	     #     <     D  q   R  h   ?  9   -  9   g  9   ?     ?     ?        0     !   @  !   b  	   ?  	   ?     ?  0   ?  i   ?     @  w  Y     ?     ?  	          ?        ?     ?     ?     ?     ?  	             *     C     \  c   r  '   ?  N  ?     M   0   l   j   ?   ?   !  ?  ?!  ?   ;#  ?   $  Q   ?$  
   '%     2%  
   C%     N%  :   g%  !   ?%     ?%  3   ?%  -   ?%     *&           *                  2   .         !   +           7   &                1       -       '   ,          )       ;   5      6       $          	                         0                           8               9      3       
   4      (   %          /         #   :         "    %(INSTALL)d to install %(INSTALL)d to install %(REMOVE)d to remove %(REMOVE)d to remove %s, %s <b>Example</b> <big><b>Checking available language support</b></big>

The availability of translations or writing aids can differ between languages. <small><b>Drag languages to arrange them in order of preference.</b>
Changes take effect next time you log in.</small> <small>Changes take effect next time you log in.</small> <small>Use the same format choice for startup and the login screen.</small> <small>Use the same language choices for startup and the login screen.</small> Apply System-Wide Chinese (simplified) Chinese (traditional) Configure multiple and native language support on your system Could not install the full language support Could not install the selected language support Currency: Date: Details Display numbers, dates and currency amounts in the usual format for: Failed to apply the '%s' format
choice. The examples may show up if you
close and re-open Language Support. Failed to authorize to install packages. If you need to type in languages, which require more complex input methods than just a simple key to letter mapping, you may want to enable this function.
For example, you will need this function for typing Chinese, Japanese, Korean or Vietnamese.
The recommended value for Ubuntu is "IBus".
If you want to use alternative input method systems, install the corresponding packages first and then choose the desired system here. Incomplete Language Support Install / Remove Languages... Installed Installed Languages It is impossible to install or remove any software. Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first. Keyboard input method system: Language Language Support Language for menus and windows: No language information available Number: Regional Formats Session Restart Required Set system default language Software database is broken Some translations or writing aids available for your chosen languages are not installed yet. Do you want to install them now? System policy prevented setting default language The language support files for your selected language seem to be incomplete. You can install the missing components by clicking on "Run this action now" and follow the instructions. An active internet connection is required. If you would like to do this at a later time, please use Language Support instead (click the icon at the very right of the top bar and select "System Settings... -> Language Support"). The language support is not installed completely The new language settings will take effect once you have logged out. The system does not have information about the available languages yet. Do you want to perform a network update to get them now?  This is perhaps a bug of this application. Please file a bug report at https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug This setting only affects the language your desktop and applications are displayed in. It does not set the system environment, like currency or date format settings. For that, use the settings in the Regional Formats tab.
The order of the values displayed here decides which translations to use for your desktop. If translations for the first language are not available, the next one in this list will be tried. The last entry of this list is always "English".
Every entry below "English" will be ignored. This will set the system environment like shown below and will also affect the preferred paper format and other region specific settings.
If you want to display the desktop in a different language than this, please select it in the "Language" tab.
Hence you should set this to a sensible value for the region in which you are located. Usually this is related to an error in your software archive or software manager. Check your preferences in Software Sources (click the icon at the very right of the top bar and select "System Settings... -> Software Sources"). When a language is installed, individual users can choose it in their Language settings. _Install _Remind Me Later _Update alternative datadir check for the given package(s) only -- separate packagenames by comma don't verify installed language support none output all available language support packages for all languages show installed packages as well as missing ones target language code Project-Id-Version: language-selector
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-11-04 06:30+0000
Last-Translator: Launchpad Translations Administrators <Unknown>
Language-Team: Chinese (China) <i18n-zh@googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Launchpad-Export-Date: 2020-04-12 23:08+0000
X-Generator: Launchpad (build 2e26c9bbd21cdca248baaea29aeffb920afcc32a)
Language: zh_CN
 将安装 %(INSTALL)d 个 将移除 %(REMOVE)d 个 %s，%s <b>范例</b> <big><b>检查可用的语言支持</b></big>

不同语言的翻译和写作助手的支持程度可能不同。 <small><b>拖动语言来安排他们的优先顺序。</b>
在您下次登录时修改生效。</small> <small>更改将会在您下次登录时生效。</small> <small>启动和登录界面使用相同样式。</small> <small>启动和登录界面使用同一语言。</small> 应用到整个系统 中文(简体) 中文(繁体) 配置您系统的多语言和本地语言支持 无法安装完整的语言支持 无法安装选定的语言支持 货币： 日期： 详细信息 显示数字，日期和货币数额的格式： 无法使用选择的 %s 格式。
当您关闭并重新打开语言
支持程序时将会看到样例。 安装包验证失败。 如果您需要输入某种语言，需要更复杂的输入方法，不仅仅是一个简单的按键字母映射，可能需要您启用此功能。
例如，您将需要此功能用于输入中文，日语，韩语和越南语。
Ubuntu 建议使用"IBus"。如果您想使用其他输入法系统，首先安装相应的软件包，然后选择所需的输入法系统。 不完整的语言支持 添加或删除语言... 已安装 已安装语言 无法安装或删除任何软件。请先使用新立得软件包管理器或在终端运行 "sudo apt-get install -f" 来修正这个问题。 键盘输入法系统： 语言 语言支持 菜单和窗口的语言： 没有可用的语言信息 数字： 地区格式 需要重新启动会话 设置系统默认语言 软件数据库损坏 您选择的语言的部分可用翻译或写作帮助还没有安装。您希望现在安装吗？ 系统策略阻止了设置默认语言 您所选择的语言的支持文件可能不完整。要安装缺失的组件，您可以点击“现在执行此操作”并按照指示进行。此过程需要一个可用的网络连接。如果您需要稍后再进行，请使用“语言支持” (点击顶栏最右边的图标并选择“系统设置... -> 语言支持”)。 语言支持没有安装完整 当您注销后新的语言设置才会生效。 此系统没有任何有关可用语言的信息，您希望现在执行网络更新来获取它们吗？  这也许是该应用程序的一个问题。 请在 https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug?no-redirect 上报告这个问题。 这些设置只会影响您的桌面和应用程序显示的语言，不会影响系统环境的货币和日期格式。如需要设置，请切换到“地区格式”标签。
这里显示的顺序决定了您的桌面使用的翻译。如果第一个语言的翻译不可用，将会尝试下一个。最后一个条目始终是“English”。
所有在“English”之下的条目都将被忽略。 这里按照下面的显示设置系统，同时影响纸张尺寸等地区设置。
如果您希望桌面显示不同的语言，请点击“语言”标签。
因此，您应该按照您的地区设置一个合理的值。 这通常与软件存档或软件管理器中的错误有关。请检查您在“软件源”中的设置 (点击顶栏最右边的图标并选择“系统设置... -> 软件源”)。 当某个语言安装后，用户可以在他们的语言设置里进行选择。 安装(_I) 稍后提醒(_R) 更新(_U) 可选的数据文件夹 仅检查给定的软件包 -- 用英文逗号分隔包名 不验证已安装的语言支持 无 为所有语言输出所有可用的语言支持包 同时显示已安装的和缺失的软件包 目标语言代号 