local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme = {}

theme.wallpaper = "~/.config/awesome/theme/wallpaper.jpg"
theme.font          = "Source Code Pro 9"
theme.bg_normal     = "#2b303b"
theme.bg_focus      = "#65737e"
theme.bg_urgent     = "#bf616a"
theme.bg_minimize   = "#2b303b"
theme.fg_normal     = "#eff1f5"
theme.fg_focus      = "#eff1f5"
theme.fg_urgent     = "#2b303b"
theme.fg_minimize   = "#65737e"
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
theme.battery_font = "Source Code Pro 9"
theme.battery_text_fg = "#eff1f5"
theme.battery_icon_color = "#eff1f5" 
theme.battery_warning_bg = "bf616a"
theme.battery_warning_fg = "eff1f5"
theme.battery_margin_left = 11
theme.battery_margin_right = 7

-- Volume
theme.volume_font = "Source Code Pro 9"
theme.volume_color = "#eff1f5"
theme.volume_muted_color = "#65737e"
theme.volume_margin_left = 7
theme.volume_margin_right = 7

-- Textclock
theme.textclock_margin_left = 0
theme.textclock_margin_right = 5

-- Menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- Layout
theme.layout_floating  = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft   = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gears.color.recolor_image("/home/gam/.config/awesome/theme/layouts/tiletopw.png", theme.fg_normal)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
