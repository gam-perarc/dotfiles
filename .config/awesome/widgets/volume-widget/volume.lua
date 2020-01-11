-------------------------------------------------
-- Volume Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volume-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gfs = require("gears.filesystem")
local PATH_TO_ICONS = "/usr/share/icons/Arc/status/symbolic/"
local volume_widget = {}

local function worker(args)
    local args = args or {}
    local font = args.font or 'Source Code Pro 9'
    local volume_audio_controller = args.volume_audio_controller or 'pulse'
    local device_arg = ''
    if volume_audio_controller == 'pulse' then
        device_arg = '-D pulse'
    end
    local GET_VOLUME_CMD = 'amixer ' .. device_arg .. ' sget Master'
    local INC_VOLUME_CMD = 'amixer ' .. device_arg .. ' sset Master 5%+'
    local DEC_VOLUME_CMD = 'amixer ' .. device_arg .. ' sset Master 5%-'
    local TOG_VOLUME_CMD = 'amixer ' .. device_arg .. ' sset Master toggle'

    if not gfs.dir_readable(PATH_TO_ICONS) then
        naughty.notify{
            title = "Volume Widget",
            text = "Folder with icons doesn't exist: " .. PATH_TO_ICONS,
            preset = naughty.config.presets.critical
        }
    end

    local icon_widget = wibox.widget {
	{
	    id = "icon",
	    image = PATH_TO_ICONS .. "audio-volume-muted-symbolic.svg",
	    resize = false,
	    widget = wibox.widget.imagebox,
	},
        layout = wibox.container.margin(_, _, _, 3),
        set_image = function(self, path)
            self.icon.image = path
        end
    }
    local level_widget = wibox.widget {
	id = "level",
	font = font,
	widget = wibox.widget.textbox
    }
    volume_widget = wibox.widget {
	icon_widget,
	level_widget,
	layout = wibox.layout.fixed.horizontal
    }

    local volume_icon_name="audio-volume-high-symbolic"

    local update_graphic = function(widget, stdout, _, _, _)
        local mute = string.match(stdout, "%[(o%D%D?)%]")
        local volume = string.match(stdout, "(%d?%d?%d)%%")
        volume = tonumber(string.format("% 3d", volume))
        if mute == "off" then volume_icon_name="audio-volume-muted-symbolic_red"
        elseif (volume >= 0 and volume < 25) then volume_icon_name="audio-volume-muted-symbolic"
        elseif (volume < 50) then volume_icon_name="audio-volume-low-symbolic"
        elseif (volume < 75) then volume_icon_name="audio-volume-medium-symbolic"
        elseif (volume <= 100) then volume_icon_name="audio-volume-high-symbolic"
        end
        icon_widget:set_image(PATH_TO_ICONS .. volume_icon_name .. ".svg")
	--widget.level:set_markup_silently(string.format("%d%%", volume))
	--icon_widget.image = PATH_TO_ICONS .. volume_icon_name .. ".svg"
	level_widget.text = string.format("%d%%", volume)
    end

    watch(GET_VOLUME_CMD, 1, update_graphic, volume_widget)
    return volume_widget
end

return setmetatable(volume_widget, { __call = function(_, ...) return worker(...) end })
