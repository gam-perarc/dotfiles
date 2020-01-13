local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme = {}

theme.wallpaper = "~/.config/awesome/theme/wallpaper.jpg"
theme.font          = "Source Code Pro 9"
theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.useless_gap   = 10
theme.border_width  = 3
theme.border_normal = "#2b303b"
theme.border_focus  = "#eff1f5"
theme.border_marked = "#91231c"

-- Wibar
theme.wibar_height = 26
theme.wibar_bg = "#2b303b"

-- Taglist
theme.taglist_fg_focus = "#eff1f5"
theme.taglist_bg_focus = "#65737e"
theme.taglist_fg_urgent = "#2b303b"
theme.taglist_bg_urgent = "#bf616a"
theme.taglist_fg_occupied = "#eff1f5"
theme.taglist_bg_occupied = "#2b303b"
theme.taglist_fg_empty = "#65737e"
theme.taglist_bg_empty = "#2b303b"
theme.taglist_fg_volatile = "#65737e"
theme.taglist_bg_volatile = "#2b303b"

-- Tasklist
theme.tasklist_fg_normal = "#eff1f5"
theme.tasklist_bg_normal = "#2b303b"
theme.tasklist_fg_focus = "#eff1f5"
theme.tasklist_bg_focus = "#65737e"
theme.tasklist_fg_urgent = "#2b303b"
theme.tasklist_bg_urgent = "#bf616a"
theme.tasklist_fg_minimize = "#65737e"
theme.tasklist_bg_minimize = "#2b303b"

-- Promptbox
theme.prompt_fg = "#eff1f5"
theme.prompt_bg = "#2b303b"

-- Battery
theme.battery_text_fg = "#eff1f5"
theme.battery_icon_color = "#eff1f5" 
theme.battery_warning_bg = "bf616a"
theme.battery_warning_fg = "eff1f5"
theme.battery_margin_left = 10
theme.battery_margin_right = 10

-- Menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- Layout
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = 'Papirus-Dark'

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
