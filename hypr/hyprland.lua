-- MONITOR
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

-- STARTUP / CAELESTIA
hl.on("hyprland.start", function()
    hl.exec_cmd(
        "setsid -f env " ..
        "CAELESTIA_WALLPAPERS_DIR=$HOME/Pictures/Wallpapers " ..
        "PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia -n"
        )
    end
)

-- UKURAN WINDOW APLIKASI
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        -- Ukuran border window
        -- border_size = 1,

        -- Layout utama
        -- layout = "dwindle",

        -- Biar border lebih gampang di-drag
        -- extend_border_grab_area = 15,
    },
})

-- DECORATION
hl.config({
    decoration = {

        -- Sudut window
        rounding = 16,

        -- OPACITY
        -- Transparansi window aktif
        -- active_opacity = 10.95,

        -- Transparansi window tidak aktif
        -- inactive_opacity = 0.90,

        -- Transparansi fullscreen
        -- fullscreen_opacity = 1.0,
        -- SHADOW
        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,

            -- Bisa dicoba nanti
            -- sharp = false,
            -- offset = "0 0",
            -- scale = 1.0,
        },


        -- BLUR
        blur = {
            enabled = true,

            -- Ukuran blur
            size = 3,

            -- Jumlah proses blur
            passes = 3,

            -- Optimasi blur
            new_optimizations = true,

            -- Bisa dicoba nanti
            xray = false,
        },

        -- DIM INACTIVE WINDOW

        -- Kalau diaktifkan, window yang tidak fokus
        -- akan sedikit digelapkan.

        -- dim_inactive = true,
        -- dim_strength = 0.15,
    },
})

-- INPUT & TOUCHPAD
hl.config({
    input = {

        -- Window mengikuti posisi mouse
        follow_mouse = 1,

        -- MOUSE
        -- Sensitivitas mouse
        sensitivity = 0.20,

        -- Profil akselerasi mouse
        -- "adaptive" / "flat"
        -- accel_profile = "adaptive",
        -- TOUCHPAD
        touchpad = {
            -- Natural scrolling
            -- Finger turun -> halaman naik
            -- Finger naik -> halaman turun
            natural_scroll = true,
            -- Kecepatan scrolling touchpad
            -- scroll_factor = 1.0,
            -- Matikan touchpad ketika sedang mengetik
            -- disable_while_typing = true,
            -- Tap touchpad = klik kiri
            -- tap_to_click = true,
            -- Drag menggunakan touchpad
            -- tap_and_drag = true,
            -- Three-finger drag
            -- 0 = off
            -- 1 / 2 = mode drag
            -- drag_3fg = 1,
        },
    },
})

-- ANIMATIONS
hl.config({
    animations = {
        enabled = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- ANIMATION CURVES
-- Linear
hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1},
    },
})

-- Ease Out
hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1},
    },
})

-- Quick
hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1},
    },
})

-- Spring
hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 238.1191,
    dampening = 24.21279333,
})

-- WINDOW ANIMATION
hl.animation({
    leaf = "windows",
    enabled = true,

    -- Gerakan dasar window
    speed = 14,

    -- Spring smooth dan natural
    spring = "easy",

    -- Pop kecil, tidak terlalu zoom
    style = "popin 50%",
})

-- WINDOW OPEN ANIMATION
hl.animation({
    leaf = "windowsIn",
    enabled = true,

    -- Open lebih smooth
    speed = 14,

    spring = "easy",

    -- Mulai dari 85% -> 100%
    style = "popin 50%",
})

-- WINDOW CLOSE ANIMATION
hl.animation({
    leaf = "windowsOut",
    enabled = true,

    -- Close dibuat sama smooth dengan open
    speed = 14,

    spring = "easy",

    -- Mengecil sedikit sebelum hilang
    style = "popin 85%",
})

-- WINDOW MOVE / RESIZE
hl.animation({
    leaf = "windowsMove",
    enabled = true,

    -- Tetap responsif saat window dipindah / resize
    speed = 8,

    spring = "easy",
})

-- FADE ANIMATION
hl.animation({
    leaf = "fade",
    enabled = true,

    speed = 5,
    bezier = "quick",
})

-- WINDOW FADE IN
hl.animation({
    leaf = "fadeIn",
    enabled = true,

    speed = 5,
    bezier = "quick",
})

-- WINDOW FADE OUT
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    
    speed = 5,
    bezier = "quick",
})

-- WORKSPACE ANIMATION
hl.animation({
    leaf = "workspaces",
    enabled = true,
    --transisi antar window
    speed = 8,  
    -- Gerakan smooth
    bezier = "easeOutQuint",
    -- Workspace bergeser + fade
    style = "slidefade 45%",
})

-- KEYBINDS --
local mod = "SUPER"

-- Terminal
hl.bind(
    mod .. " + RETURN",
    hl.dsp.exec_cmd("kitty")
)

-- Open Caelestia Settings
hl.bind(
    mod .. " + Q",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call nexus open"
    )
)

-- Application menu
hl.bind(
    mod .. " + M",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call drawers toggle launcher"
    )
)

-- Close window
hl.bind(
    mod .. " + I",
    hl.dsp.window.close()
)

-- Exit Hyprland
hl.bind(
    mod .. " + SHIFT + M",
    hl.dsp.exit()
)

-- Fullscreen
hl.bind(
    mod .. " + F",
    hl.dsp.window.fullscreen()
)

-- File manager
hl.bind(
    mod .. " + E",
    hl.dsp.exec_cmd("thunar")
)

-- Lock screen
hl.bind(
    mod .. " + L",
    hl.dsp.exec_cmd("loginctl lock-session")
)

-- Cycle window
hl.bind(
    mod .. " + Tab",
        hl.dsp.window.cycle_next()
)

-- FOCUS WINDOW
hl.bind(
    mod .. " + left",
    hl.dsp.focus({
        direction = "left"
    })
)

hl.bind(
    mod .. " + right",
    hl.dsp.focus({
        direction = "right"
    })
)

hl.bind(
    mod .. " + up",
    hl.dsp.focus({
        direction = "up"
    })
)

hl.bind(
    mod .. " + down",
    hl.dsp.focus({
        direction = "down"
    })
)

-- BROWSER
hl.bind(
    mod .. " + B",
    hl.dsp.exec_cmd("vivaldi")
)

-- DISCORD
hl.bind(
    mod .. " + D",
    hl.dsp.exec_cmd("flatpak run com.discordapp.Discord")
)

-- Obsidian
hl.bind(
    mod .. " + O",
    hl.dsp.exec_cmd("flatpak run md.obsidian.Obsidian")
)

--Spotify
hl.bind(
    mod .. " + A ",
    hl.dsp.exec_cmd("flatpak run com.spotify.Client")
)

-- WORKSPACES
for i = 1, 10 do

    local key = i % 10
    -- Pindah workspace
    hl.bind(
        mod .. " + " .. key,
        hl.dsp.focus({
            workspace = i
        })
    )

    -- Pindahkan window ke workspace
    hl.bind(
        mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i
        })
    )
end

--Transisi Window ke WorkSpace
hl.bind(
    mod .. " + SHIFT + left",
    hl.dsp.window.move({
        direction = "left"
    })
)

hl.bind(
    mod .. " + SHIFT + right",
    hl.dsp.window.move({
        direction = "right"
    })
)

hl.bind(
    mod .. " + SHIFT + up",
    hl.dsp.window.move({
        direction = "up"
    })
)

hl.bind(
    mod .. " + SHIFT + down",
    hl.dsp.window.move({
        direction = "down"
    })
)

--Kill hyprland
hl.bind(
    mod .. " + SHIFT + K",
    hl.dsp.exec_cmd("hyprctl dispatch killactive")
    )

-- Reload config
hl.bind(
    mod .. " + R",
    hl.dsp.exec_cmd("hyprctl reload")
)

-- Toggle floating window
hl.bind(
    mod .. " + V", function()
    hl.dispatch(
        hl.dsp.window.float({
            action = "toggle"
        })
    )
end)

-- Volume --
-- Tambah Volume
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))

-- Kurang Volume
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

-- Mute / Unmute Volume
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Mute / Unmute Microphone
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- Brightness --
-- Tambah Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call brightness set +5%"
    )
)

-- Kurang Brightness
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call brightness set 5%-"
    )
)

-- Dashboard Caelestia
hl.bind(
    mod .. " + J ",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call drawers toggle dashboard"
    )
)

-- Power Off Caelestia
hl.bind(
    mod .. " + SHIFT + P",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call drawers toggle session"
    )
)

-- Notification Cealestia
hl.bind(
    mod .. " + N",
    hl.dsp.exec_cmd(
        "env PATH=$HOME/.local/bin:$PATH " ..
        "QML2_IMPORT_PATH=$HOME/.local/lib64/qt6/qml " ..
        "XDG_CONFIG_DIRS=$HOME/.local/etc/xdg:/etc/xdg " ..
        "qs -c caelestia ipc call drawers toggle sidebar"
    )
)

-- SCREENSHOT
-- Hold Fn untuk menjalankan PRINT
hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("hyprshot -m output")
)

hl.bind(
    mod .. " + PRINT",
    hl.dsp.exec_cmd("hyprshot -m window")
)

hl.bind(
    mod .. " + SHIFT + PRINT",
    hl.dsp.exec_cmd("hyprshot -m region")
)

-- CURSOR
hl.env("XCURSOR_THEME", "Lilith_XCursor")
hl.env("XCURSOR_SIZE", "24")

-- DWINDLE
hl.config({
    dwindle = {

        -- Arah split window tidak gampang berubah
        preserve_split = true,
        -- OPTIONAL
        -- Split mengikuti posisi mouse dengan lebih pintar
        -- smart_split = true,
        -- 0 = normal
        -- 1 = selalu kiri / atas
        -- 2 = selalu kanan / bawah
        -- force_split = 0,
    },
})

-- OPTIONAL: GESTURES
-- Swipe 3/4 jari untuk pindah workspace.
-- Uncomment kalau nanti mau gesture touchpad.
-- hl.config({
--     gestures = {
--         workspace_swipe = true,
--         workspace_swipe_distance = 300,
--         workspace_swipe_forever = false,
--         workspace_swipe_cancel_ratio = 0.5,
--     },
-- })

-- OPTIONAL: GROUP WINDOWS
-- Tab-style window grouping.
--
-- Belum diaktifkan karena kita cek dulu apakah
-- grouping memang kamu butuhkan.
--
-- hl.config({
--     group = {
--         auto_group = true,
--         drag_into_group = 1,
--     },
-- })


-- OPTIONAL: MISC
-- Berbagai kosmetik Hyprland.
--
-- Bisa kita aktifkan nanti setelah konfigurasi utama stabil.
--
-- hl.config({
--     misc = {
--
--         -- Jangan tampilkan logo Hyprland
--         -- disable_hyprland_logo = true,
--
--         -- Jangan tampilkan splash screen
--         -- disable_splash_rendering = true,
--
--         -- Jangan munculkan notifikasi update Hyprland
--         -- disable_hyprland_logo = true,
--     },
-- })

-- WINDOW RULES
-- Spotify sedikit transparan.
-- hl.window_rule({
--     name = "spotify-opacity",

--     match = {
--         class = "^(spotify)$",
--     },
--     opacity = "0.90 0.90",
-- })


-- OPTIONAL WINDOW RULES
-- GLOBAL TRANSPARENCY
-- JANGAN aktifkan dulu.
--
-- 1.0 = tidak transparan.
-- Jadi konfigurasi lama kamu:
--
-- opacity = "1.0 override 1.0 override"
--
-- sebenarnya TIDAK membuat window transparan.
--
-- Kalau nanti kita mau global transparency,
-- kita tentukan nilainya dengan benar.
--
-- hl.window_rule({
--     name = "global-transparency",
--
--     match = {
--         class = ".*",
--     },
--
--     opacity = "0.95 0.90",
-- })
-- NO BLUR UNTUK APLIKASI TERTENTU
-- Contoh:
-- Kalau nanti ada aplikasi yang blur-nya rusak,
-- kita bisa matikan blur khusus aplikasi tersebut.
--
-- hl.window_rule({
--     name = "no-blur-example",
--
--     match = {
--         class = "^(nama_aplikasi)$",
--     },
--
--     no_blur = true,
-- })


-- NO SHADOW UNTUK APLIKASI TERTENTU

-- hl.window_rule({
--     name = "no-shadow-example",
--
--     match = {
--         class = "^(nama_aplikasi)$",
--     },
--
--     no_shadow = true,
-- })


-- NO ANIMATION UNTUK APLIKASI TERTENTU
-- hl.window_rule({
--     name = "no-animation-example",
--
--     match = {
--         class = "^(nama_aplikasi)$",
--     },
--
--     no_anim = true,
-- })


-- OPTIONAL: MINIMIZE WINDOW
-- Hyprland tidak punya minimize tradisional seperti Windows.
--
-- Tapi bisa dibuat menggunakan special workspace.
--
-- Contoh konsepnya:
--
-- SUPER + X
--     ↓
-- Window dipindah ke special:minimized
--
-- SUPER + X lagi
--     ↓
-- Window dikembalikan
--
-- Kita JANGAN aktifkan dulu.
-- Nanti kita bikin khusus setelah config utama stabil.


-- OPTIONAL: SMART GAPS
-- Kalau cuma ada 1 window,
-- gap bisa dibuat lebih kecil / hilang.
--
-- Belum diaktifkan karena kita perlu menentukan
-- apakah kamu suka style ini atau tidak.


-- END OF CONFIG
