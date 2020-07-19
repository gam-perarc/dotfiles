local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local PATH_TO_ICONS = "/usr/share/icons/Arc/status/symbolic/"
local font = beautiful.volume_font
local margin_left = beautiful.volume_margin_left
local margin_right = beautiful.volume_margin_right

local icon_widget = wibox.widget {
    {
        id = "icon",
        image = gears.color.recolor_image(PATH_TO_ICONS .. "audio-volume-muted-symbolic.svg", beautiful.volume_muted_color),
        resize = false,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.container.margin(_, _, 3, 5),
    set_image = function(self, path)
        self.icon.image = path
    end
}

local level_widget = wibox.widget {
    {
	id = "level",
	text = "0%",
	font = font,
	widget = wibox.widget.textbox
    },
    fg = beautiful.volume_color,
    widget = wibox.container.background,
    set_text = function(self, text, color)
	self.level.text = text
	self.fg = color
    end
}

local update = function(stdout, _, _, _)
    local toggle = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    local volume_icon_name
    local color
    volume = tonumber(volume)
    if (volume >= 0 and volume < 25) then volume_icon_name="audio-volume-muted-symbolic"
    elseif (volume < 50) then volume_icon_name="audio-volume-low-symbolic"
    elseif (volume < 75) then volume_icon_name="audio-volume-medium-symbolic"
    elseif (volume <= 100) then volume_icon_name="audio-volume-high-symbolic"
    end
    if toggle == "on" then color = beautiful.volume_color else color = beautiful.volume_muted_color end
    level_widget:set_text(string.format("%d%%", volume), color)
    icon_widget:set_image(gears.color.recolor_image(PATH_TO_ICONS .. volume_icon_name .. ".svg", color))
end

volume_widget = wibox.widget {
    {
        icon_widget,
        level_widget,
        layout = wibox.layout.fixed.horizontal
    },
    left = margin_left,
    right = margin_right,
    widget = wibox.container.margin,
    volume_inc = function()
        awful.spawn.easy_async("amixer sset Master 5%+", update)
    end,
    volume_dec = function()
        awful.spawn.easy_async("amixer sset Master 5%-", update)
    end,
    volume_toggle = function()
        awful.spawn.easy_async("amixer set Master toggle", update)
    end,
}

awful.spawn.easy_async("amixer sget Master", update)

return volume_widget
