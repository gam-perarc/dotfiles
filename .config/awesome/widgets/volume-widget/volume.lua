local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local PATH_TO_ICONS = "/usr/share/icons/Arc/status/symbolic/"
local font = 'Source Code Pro 9'
local margin_left = 0
local margin_right = 0

local icon_widget = wibox.widget {
    {
        id = "icon",
        image = gears.color.recolor_image(PATH_TO_ICONS .. "audio-volume-muted-symbolic.svg", "#65737e"),
        resize = false,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.container.margin(_, _, _, 3),
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
    fg = "#eff1f5",
    widget = wibox.container.background,
    set_text = function(self, text, color)
	self.level.text = text
	self.fg = color
    end
}

local update = function(stdout, _, _, _)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume = string.match(stdout, "(%d?%d?%d)%%")
    local volume_icon_name
    local color
    volume = tonumber(volume)
    if (volume >= 0 and volume < 25) then volume_icon_name="audio-volume-muted-symbolic"
    elseif (volume < 50) then volume_icon_name="audio-volume-low-symbolic"
    elseif (volume < 75) then volume_icon_name="audio-volume-medium-symbolic"
    elseif (volume <= 100) then volume_icon_name="audio-volume-high-symbolic"
    end
    if mute == "on" then color = "#65737e" else color = "#eff1f5" end
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
