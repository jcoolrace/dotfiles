# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}

c.colors.statusbar.command.bg = "white"
c.colors.statusbar.command.fg = "black"
c.colors.statusbar.insert.bg = "#59bdf7"
c.colors.statusbar.insert.fg = "black"
c.colors.statusbar.normal.fg = "black"
c.colors.statusbar.normal.bg = "white"
c.colors.statusbar.url.fg = "black"
c.colors.statusbar.url.success.https.fg = "black"

# The editor (and arguments) to use for the `open-editor` command. `{}`
# gets replaced by the filename of the file to be edited.
# Type: ShellCommand
c.editor.command = ['urxvt', '-e', 'vim', '-f', '{}']

# Default monospace fonts. Whenever "monospace" is used ina font setting,
# it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = "PragmataProMono Nerd Font Mono"

helvetica = "9pt Helvetica Neue"

c.fonts.completion.category = "bold " + helvetica
c.fonts.completion.entry = c.fonts.downloads = c.fonts.hints = c.fonts.keyhint = c.fonts.messages.error = c.fonts.messages.info = c.fonts.messages.warning = c.fonts.prompts = c.fonts.statusbar = c.fonts.tabs = helvetica

c.hints.uppercase = True

# Additional arguments to pass to Qt, without leading `--`. With
# QtWebEngine, some Chromium arguments (see
# https://peter.sh/experiments/chromium-command-line-switches/ for a
# list) will work. This setting requires a restart.
# Type: List of String
c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']

# Show a scrollbar.
# Type: Bool
c.scrolling.bar = True

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

c.tabs.background = False

c.tabs.show = 'multiple'

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://start.duckduckgo.com/?kae=t&kaj=u&k5=2&kp=-2&kk=1&kak=-1&kaq=-1&kd=1&kc=-1&k1=-1&kap=-1&kao=-1&kax=-1&kf=fw&kt=u&kaa=50f148&k9=afffaf&ka=u'

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}&kae=t&kaj=u&k5=2&kp=-2&kk=1&kak=-1&kaq=-1&kd=1&kc=-1&k1=-1&kap=-1&kao=-1&kax=-1&kf=fw&kt=u&kaa=50f148&k9=afffaf&ka=u',
        'g': 'https://google.com/search?q={}',
        'aur': 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K={}&outdated=&SB=n&SO=a&PP=50&do_Search=Go',
        'arch': 'https://wiki.archlinux.org/index.php?search={}&title=Special%3ASearch&go=Go',
        'gs': 'https://google.com/search?q={} site:.edu OR site:.org OR site:.net OR site:.gov -site:wikipedia'}

# The page(s) to open at the start.
# Type: FuzzyUrl
c.url.start_pages = 'https://start.duckduckgo.com/?kae=t&kaj=u&k5=2&kp=-2&kk=1&kak=-1&kaq=-1&kd=1&kc=-1&k1=-1&kap=-1&kao=-1&kax=-1&kf=fw&kt=u&kaa=50f148&k9=afffaf&ka=u'



# List of URLs of lists which contain hosts to block.
# The file can be in one of the following formats:
#  - An /etc/hosts-like file
#  - One host per line
#  - A zip-file of any of the above, with either only one file, or a file named hosts (with any extension).
#  Type: List of Url

c.content.host_blocking.lists = ["https://www.malwaredomainlist.com/hostslist/hosts.txt",
        "http://someonewhocares.org/hosts/hosts",
        "http://winhelp2002.mvps.org/hosts.zip",
        "http://malwaredomains.lehigh.edu/files/justdomains.zip",
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext",
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
        ]

# DO NOT DELETE LMAO
config.bind(';doc', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind(';dow', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind(';dotf', 'set downloads.location.directory ~/dotfiles ;; hint links download')
config.bind(';www', 'set downloads.location.directory /srv/http ;; hint links download')
config.bind(';tv', 'set downloads.location.directory /media/usb0/Files/Documents/tv ;; hint links download')
config.bind(';movies', 'set downloads.location.directory /media/usb0/Files/Documents/movies ;; hint links download')
config.bind(';usb0', 'set downloads.location.directory /media/usb0 ;; hint links download')
config.bind(';usb1', 'set downloads.location.directory /media/usb1 ;; hint links download')
config.bind(';d', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind(';D', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind(';m', 'set downloads.location.directory ~/Music ;; hint links download')
config.bind(';pp', 'set downloads.location.directory ~/Pictures ;; hint links download')
config.bind(';vv', 'set downloads.location.directory ~/Videos ;; hint links download')
config.bind(';sch', 'set downloads.location.directory ~/Documents/school ;; hint links download')
# DO NOT DELETE LMAO

config.bind('m', 'spawn mpv {url}')
config.bind('M', 'hint links spawn mpv {hint-url}')
