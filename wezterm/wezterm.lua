local wezterm = require('wezterm')

-- local default_prog = { 'C:\\Windows\\System32\\cmd.exe' }
-- local default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' }
-- local default_prog = { 'C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.3.3.0_x64__8wekyb3d8bbwe\\pwsh.exe' }
-- local default_prog = { 'C:\\Users\\hp\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe' }
local default_prog = { 'C:\\Users\\hp\\scoop\\apps\\pwsh\\current\\pwsh.exe' }

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

return {
  default_prog = default_prog,
  -- use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  tab_bar_style = {
    active_tab_left = wezterm.format {
      { Text = SOLID_RIGHT_ARROW },
    },
    active_tab_right = wezterm.format {
      { Text = SOLID_RIGHT_ARROW },
    },
    inactive_tab_left = wezterm.format {
      { Text = SOLID_RIGHT_ARROW },
    },
    inactive_tab_right = wezterm.format {
      { Text = SOLID_RIGHT_ARROW },
    },
  },
  window_decorations = 'RESIZE',
  window_background_opacity = 0.9,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  color_scheme = 'Material Darker (base16)',
  win32_system_backdrop = "Acrylic",

  -- font = wezterm.font('Fira Code', { weight = 'Regular' }),
  -- font = wezterm.font('Operator Mono Lig Book', { weight = 'Regular' }),
  -- font = wezterm.font('Hurmit Nerd Font Mono', { weight = 'Regular' }),
  -- font = wezterm.font('Monocraft', { weight = 'Regular' }),
  font = wezterm.font('ComicShannsMono Nerd Font Mono', { weight = 'Regular' }),
  font_size = 9,

  -- text_blink_ease_in = "Linear",
  -- text_blink_ease_out = "Linear",

  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    { key = 'f', mods = 'LEADER',       action = wezterm.action.ToggleFullScreen },

    -- font size
    { key = '-', mods = 'CTRL',         action = wezterm.action.DecreaseFontSize },
    { key = '+', mods = 'CTRL',         action = wezterm.action.IncreaseFontSize },

    -- tab actions
    { key = 'c', mods = 'LEADER',       action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'c', mods = 'LEADER|CTRL',  action = wezterm.action.SpawnWindow },
    { key = 'h', mods = 'LEADER|SHIFT', action = wezterm.action.MoveTabRelative(-1) },
    { key = 'l', mods = 'LEADER|SHIFT', action = wezterm.action.MoveTabRelative(1) },

    -- tab navigation
    { key = 'l', mods = 'LEADER|CTRL',  action = wezterm.action.ActivateTabRelative(1) },
    { key = 'h', mods = 'LEADER|CTRL',  action = wezterm.action.ActivateTabRelative(-1) },

    -- pane splitting
    { key = '_', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '-', mods = 'LEADER',       action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- pane navigation
    { key = 'h', mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'l', mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'k', mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'j', mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Down' } },

    -- pane actions
    { key = 'z', mods = 'LEADER',       action = wezterm.action.TogglePaneZoomState },
    { key = 'x', mods = 'LEADER',       action = wezterm.action.CloseCurrentPane { confirm = true } },

    -- search actions
    { key = '/', mods = 'LEADER',       action = wezterm.action.Search { Regex = "" } }
  },
}
