local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local PATH_TO_ICONS = "/usr/share/icons/Arc/status/symbolic/"
local font = 'Source Code Pro 9'
local margin_left = beautiful.battery_margin_left
local margin_right = beautiful.battery_margin_right
local warning_msg_title = 'Battery is dying!'
local warning_msg_text = 'Good'
local warning_msg_position = 'bottom_right'
local warning_msg_icon = '/home/gam/.config/awesome/widgets/battery-widget/warning_message_icon.png'

local icon_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = false
    },
    layout = wibox.container.margin(_, 0, 0, 5),
}

local level_widget = wibox.widget {
    {
        id = "level",
        font = font,
        widget = wibox.widget.textbox
    },
    fg = beautiful.battery_text_fg,
    widget = wibox.container.background,
    set_text = function (self, text)
	self.level.text = text
    end
}

battery_widget = wibox.widget {
    {
	icon_widget,
	level_widget,
	layout = wibox.layout.fixed.horizontal,
    },
    left = margin_left,
    right = margin_right,
    widget = wibox.container.margin
}

local function show_battery_warning()
    naughty.notify {
        icon = warning_msg_icon,
        icon_size = 100,
        text = warning_msg_text,
        title = warning_msg_title,
        timeout = 25,
        hover_timeout = 0.5,
        position = warning_msg_position,
        bg = beautiful.battery_warning_bg,
        fg = beautiful.battery_warning_fg,
        width = 300,
    }
end

local last_battery_check = os.time()
local batteryType = "battery-good-symbolic"
watch("acpi", 10,
    function(widget, stdout, stderr, exitreason, exitcode)
        local status, charge_str
	status, charge_str = string.match(stdout, '.+: (%a+%s?%a*), (%d?%d?%d)%%')
        local charge = tonumber(charge_str)
        level_widget:set_text(string.format('%d%%', charge))

        if (charge >= 0 and charge < 15) then
            batteryType = "battery-empty%s-symbolic"
            if status ~= 'Charging' and os.difftime(os.time(), last_battery_check) > 300 then
	        -- if 5 minutes have elapsed since the last warning
	        last_battery_check = os.time()
	        show_battery_warning()
            end
        elseif (charge >= 15 and charge < 40) then batteryType = "battery-caution%s-symbolic"
        elseif (charge >= 40 and charge < 60) then batteryType = "battery-low%s-symbolic"
        elseif (charge >= 60 and charge < 80) then batteryType = "battery-good%s-symbolic"
        elseif (charge >= 80 and charge <= 100) then batteryType = "battery-full%s-symbolic"
        end

        if status == 'Charging' then
            batteryType = string.format(batteryType, '-charging')
        else
            batteryType = string.format(batteryType, '')
        end

        widget.icon:set_image(gears.color.recolor_image(PATH_TO_ICONS .. batteryType .. ".svg", beautiful.battery_icon_color))

        end,
    icon_widget)

return battery_widget
