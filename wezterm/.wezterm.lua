-- WezTerm configuration
-- Replicates tmux workflow with C-e as leader key

local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- =============================================================================
-- Appearance
-- =============================================================================

-- Doom One color scheme (ported from kitty + windowsterminal configs)
config.colors = {
  foreground = '#bbc2cf',
  background = '#282c34',
  cursor_bg = '#bbc2cf',
  cursor_fg = '#282c34',
  cursor_border = '#bbc2cf',
  selection_fg = '#bbc2cf',
  selection_bg = '#3f444a',
  split = '#3f444a',

  ansi = {
    '#2a2e38', -- black
    '#ff6c6b', -- red
    '#98be65', -- green
    '#ECBE7B', -- yellow
    '#51afef', -- blue
    '#c678dd', -- purple
    '#46D9FF', -- cyan
    '#DFDFDF', -- white
  },
  brights = {
    '#3f444a', -- bright black
    '#ff6655', -- bright red
    '#99bb66', -- bright green
    '#ECBE7B', -- bright yellow
    '#51afef', -- bright blue
    '#c678dd', -- bright purple
    '#46D9FF', -- bright cyan
    '#bbc2cf', -- bright white
  },

  -- Tab bar (Doom One style)
  tab_bar = {
    background = '#21242b',
    active_tab = {
      bg_color = '#282c34',
      fg_color = '#bbc2cf',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#21242b',
      fg_color = '#5b6268',
    },
    inactive_tab_hover = {
      bg_color = '#3f444a',
      fg_color = '#bbc2cf',
    },
    new_tab = {
      bg_color = '#21242b',
      fg_color = '#5b6268',
    },
    new_tab_hover = {
      bg_color = '#3f444a',
      fg_color = '#bbc2cf',
    },
  },
}

-- Font
config.font = wezterm.font 'JetBrainsMonoNL Nerd Font'
config.font_size = 12

-- Window
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32

-- Scrollback (matches tmux history-limit 1000000)
config.scrollback_lines = 100000

-- Cursor
config.default_cursor_style = 'SteadyBar'

-- =============================================================================
-- Shell
-- =============================================================================

-- PowerShell 7 portable as default shell
config.default_prog = { os.getenv('USERPROFILE') .. '\\tools\\pwsh\\pwsh.exe' }

-- =============================================================================
-- Keybindings
-- =============================================================================

-- Leader key: Ctrl-e (matches tmux prefix `set -g prefix C-e`)
config.leader = { key = 'e', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- ---------------------------------------------------------------------------
  -- Pane splits (matches tmux: bind '"' split-window -v / bind % split-window -h)
  -- ---------------------------------------------------------------------------

  -- Leader + " = split vertical (new pane below)
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Leader + % = split horizontal (new pane right)
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- ---------------------------------------------------------------------------
  -- Pane navigation: Ctrl+hjkl — no leader required
  -- (matches tmux vim-tmux-navigator: C-h/j/k/l)
  -- ---------------------------------------------------------------------------
  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },

  -- ---------------------------------------------------------------------------
  -- Pane management
  -- ---------------------------------------------------------------------------

  -- Leader + z = toggle pane zoom (matches tmux prefix + z)
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

  -- Leader + x = close pane (matches tmux prefix + x)
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

  -- ---------------------------------------------------------------------------
  -- Tab management (tabs = tmux windows)
  -- ---------------------------------------------------------------------------

  -- Leader + c = new tab (matches tmux: bind c new-window)
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },

  -- Leader + < = move tab left (matches tmux: bind "<" swap-window -d -t -1)
  { key = '<', mods = 'LEADER|SHIFT', action = act.MoveTabRelative(-1) },

  -- Leader + > = move tab right (matches tmux: bind ">" swap-window -d -t +1)
  { key = '>', mods = 'LEADER|SHIFT', action = act.MoveTabRelative(1) },

  -- Leader + 1-9 = activate tab by number (matches tmux window selection)
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },

  -- ---------------------------------------------------------------------------
  -- Copy / selection
  -- ---------------------------------------------------------------------------

  -- Leader + [ = enter copy mode (matches tmux prefix + [)
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

  -- Leader + Space = quick select (replaces tmux-thumbs + tmux-fzf-url)
  { key = 'Space', mods = 'LEADER', action = act.QuickSelect },

  -- ---------------------------------------------------------------------------
  -- Misc
  -- ---------------------------------------------------------------------------

  -- Leader + r = reload config (matches tmux: bind r source-file ~/.tmux.conf)
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },

  -- Send Ctrl-e to terminal by pressing leader twice
  {
    key = 'e',
    mods = 'LEADER|CTRL',
    action = act.SendKey { key = 'e', mods = 'CTRL' },
  },

  -- Scrolling
  { key = 'PageUp',   mods = 'SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
}

-- =============================================================================
-- Copy mode keybindings (vi-style, mirrors tmux copy-mode-vi bindings)
-- =============================================================================

config.key_tables = {
  copy_mode = {
    -- Exit
    { key = 'Escape', action = act.CopyMode 'Close' },
    { key = 'q',      action = act.CopyMode 'Close' },

    -- Movement
    { key = 'h', action = act.CopyMode 'MoveLeft' },
    { key = 'j', action = act.CopyMode 'MoveDown' },
    { key = 'k', action = act.CopyMode 'MoveUp' },
    { key = 'l', action = act.CopyMode 'MoveRight' },

    { key = 'w', action = act.CopyMode 'MoveForwardWord' },
    { key = 'b', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'e', action = act.CopyMode 'MoveForwardWordEnd' },

    { key = '0',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },

    { key = 'g',         action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },

    { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
    { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },

    -- Selection (matches tmux: bind-key -T copy-mode-vi v / C-v / Escape)
    { key = 'v',         action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Block' } },

    -- Copy and exit
    {
      key = 'y',
      action = act.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'Close' },
      },
    },
    {
      key = 'Enter',
      action = act.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'Close' },
      },
    },
  },
}

-- =============================================================================
-- Mouse
-- =============================================================================

config.mouse_bindings = {
  -- Right-click pastes from clipboard
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },
}

return config
