-- ~/.config/hypr/hyprland.lua

-- =====================
-- Variables
-- =====================

local mod = "SUPER"
local terminal = "ghostty"
local browser = "zen-browser"
local menu = "wofi --show drun"


-- =====================
-- Startup
-- =====================

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
end)


-- =====================
-- Monitor
-- =====================

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})


-- =====================
-- Input / General
-- =====================

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true,
            middle_button_emulation = true,
        },
    },

    general = {
        gaps_in = 7,
        gaps_out = 7,
        border_size = 3,
        layout = "dwindle",

        col = {
            active_border = "rgb(77dd77)",
            inactive_border = "rgb(2e3440)",
        },
    },

    decoration = {
        rounding = 0,
        inactive_opacity = 0.9,
        active_opacity = 1.0,

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
})


-- =====================
-- Apps / system
-- =====================

hl.bind(
    mod .. " + RETURN",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    mod .. " + APOSTROPHE",
    hl.dsp.exec_cmd(browser)
)

hl.bind(
    mod .. " + D",
    hl.dsp.exec_cmd(menu)
)

hl.bind(
    mod .. " + Q",
    hl.dsp.window.close({})
)

hl.bind(
    mod .. " + SHIFT + C",
    hl.dsp.exec_cmd("hyprctl reload")
)

hl.bind(
    mod .. " + SHIFT + E",
    hl.dsp.exec_cmd("wlogout")
)

hl.bind(
    mod .. " + SHIFT + PERIOD",
    hl.dsp.exec_cmd("hyprlock")
)


-- =====================
-- Screenshot
-- region/full -> save + clipboard
-- =====================

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd(
        [[mkdir -p "$HOME/Pictures" && grim -g "$(slurp)" - | tee "$HOME/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy]]
    )
)

hl.bind(
    "SHIFT + PRINT",
    hl.dsp.exec_cmd(
        [[mkdir -p "$HOME/Pictures" && grim - | tee "$HOME/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy]]
    )
)


-- =====================
-- Media / brightness
-- =====================

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    ),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    ),
    {
        repeating = true,
        locked = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    ),
    {
        repeating = true,
        locked = true,
    }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl pause"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -q set +5%"
    ),
    {
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -q --min-value=5 set 5%-"
    ),
    {
        repeating = true,
    }
)


-- =====================
-- Focus
-- =====================

hl.bind(
    mod .. " + H",
    hl.dsp.focus({
        direction = "l",
    })
)

hl.bind(
    mod .. " + J",
    hl.dsp.focus({
        direction = "d",
    })
)

hl.bind(
    mod .. " + K",
    hl.dsp.focus({
        direction = "u",
    })
)

hl.bind(
    mod .. " + L",
    hl.dsp.focus({
        direction = "r",
    })
)


-- =====================
-- Move windows
-- =====================

hl.bind(
    mod .. " + SHIFT + H",
    hl.dsp.window.move({
        direction = "l",
    })
)

hl.bind(
    mod .. " + SHIFT + J",
    hl.dsp.window.move({
        direction = "d",
    })
)

hl.bind(
    mod .. " + SHIFT + K",
    hl.dsp.window.move({
        direction = "u",
    })
)

hl.bind(
    mod .. " + SHIFT + L",
    hl.dsp.window.move({
        direction = "r",
    })
)


-- =====================
-- Workspace cycling
-- =====================

hl.bind(
    mod .. " + TAB",
    hl.dsp.focus({
        workspace = "e+1",
    })
)

hl.bind(
    mod .. " + GRAVE",
    hl.dsp.focus({
        workspace = "e-1",
    })
)


-- =====================
-- Workspaces 1-10
-- =====================

for i = 1, 10 do
    local key

    if i == 10 then
        key = "0"
    else
        key = tostring(i)
    end

    hl.bind(
        mod .. " + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    hl.bind(
        mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
            follow = true,
        })
    )
end


-- =====================
-- Layout controls
-- =====================

hl.bind(
    mod .. " + F",
    hl.dsp.window.fullscreen({
        mode = "fullscreen",
        action = "toggle",
    })
)

hl.bind(
    mod .. " + SHIFT + SPACE",
    hl.dsp.window.float({
        action = "toggle",
    })
)

hl.bind(
    mod .. " + SPACE",
    hl.dsp.window.cycle_next({})
)


-- =====================
-- Scratchpad
-- =====================

hl.bind(
    mod .. " + SHIFT + MINUS",
    hl.dsp.window.move({
        workspace = "special",
    })
)

hl.bind(
    mod .. " + MINUS",
    hl.dsp.workspace.toggle_special("")
)


-- =====================
-- Resize mode
-- =====================

hl.bind(
    mod .. " + R",
    hl.dsp.submap("resize")
)

hl.define_submap("resize", function()

    hl.bind(
        "H",
        hl.dsp.window.resize({
            x = -10,
            y = 0,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "J",
        hl.dsp.window.resize({
            x = 0,
            y = 10,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "K",
        hl.dsp.window.resize({
            x = 0,
            y = -10,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "L",
        hl.dsp.window.resize({
            x = 10,
            y = 0,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "LEFT",
        hl.dsp.window.resize({
            x = -10,
            y = 0,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "DOWN",
        hl.dsp.window.resize({
            x = 0,
            y = 10,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "UP",
        hl.dsp.window.resize({
            x = 0,
            y = -10,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "RIGHT",
        hl.dsp.window.resize({
            x = 10,
            y = 0,
            relative = true,
        }),
        {
            repeating = true,
        }
    )

    hl.bind(
        "RETURN",
        hl.dsp.submap("reset")
    )

    hl.bind(
        "ESCAPE",
        hl.dsp.submap("reset")
    )
end)
