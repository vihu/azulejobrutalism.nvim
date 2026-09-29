<p align="center">
  <h2 align="center">Azulejo Brutalism.nvim</h2>
</p>

<p align="center">Neovim colorscheme built from Portuguese tiles used as structure, not decoration: Cobalt, Ink, Glaze and Ochre.</p>

## Features

- Light, Dark and true-black OLED variants that follow `'background'`
- Extensive support for `TreeSitter`, LSP semantic tokens and many popular plugins
- Few colours: keywords carry the primary, weight carries structure, pigments mark literals and types
- Extras for Ghostty, WezTerm, tmux, fzf and bat

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "vihu/azulejobrutalism.nvim",
    lazy = false,
    priority = 1000,
    main = "azulejo-brutalism",
    opts = {},
}
```

## Requirements

- neovim latest
- truecolor terminal support
- undercurl terminal support (optional)

## Usage

```vim
colorscheme azulejo-brutalism
```

```lua
vim.cmd("colorscheme azulejo-brutalism")
```

LazyVim:

```lua
{ "LazyVim/LazyVim", opts = { colorscheme = "azulejo-brutalism" } }
```

## Configuration

There is no need to call setup if you are ok with the defaults.

```lua
-- Default options:
require("azulejo-brutalism").setup({
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,15}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { light = {}, dark = {}, oled = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dark",              -- fallback when 'background' has no mapping
    background = {               -- map the value of 'background' option to a theme
        dark = "dark",           -- try "oled" !
        light = "light",
    },
})

-- setup must be called before loading
vim.cmd("colorscheme azulejo-brutalism")
```

**_NOTE:_** Azulejo Brutalism adjusts to the value of `'cmdheight'`. Set it **_before_** loading the colorscheme.

## Themes

Azulejo Brutalism comes in three variants:

- `light`: Ink on Glaze, Cobalt primary.
- `dark`: Glaze on Ink, Wash as primary (Cobalt vanishes on Ink).
- `oled`: Dark on true black; surfaces sink one step toward black.

Ochre is the one highlight in every variant: cursor, current line number, search.

Themes can be changed in three ways:

- Using the `background` option: any change to `vim.o.background` selects the theme mapped by `config.background`. Set `background = { dark = "oled" }` to make OLED your dark theme.
- Setting `config.theme`, used when `'background'` has no mapping.
- Loading the colorscheme directly:

  ```lua
  vim.cmd("colorscheme azulejo-brutalism-light")
  vim.cmd("colorscheme azulejo-brutalism-dark")
  vim.cmd("colorscheme azulejo-brutalism-oled")
  ```

  or

  ```lua
  require("azulejo-brutalism").load("oled")
  ```

## Customization

There are _two_ kinds of colors: `PaletteColors` and `ThemeColors`.
`PaletteColors` are RGB hex strings named after what they are (`cobalt`, `glaze0`, `ironRed`).
`ThemeColors` are named and grouped by what they do (`ui.primary`, `syn.keyword`, `diag.error`).
A theme maps palette colors to theme colors, and one palette color may fill several theme colors.

Palette names are in [colors.lua](lua/azulejo-brutalism/colors.lua); how each theme uses them is in [themes.lua](lua/azulejo-brutalism/themes.lua).

```lua
require("azulejo-brutalism").setup({
    colors = {
        palette = {
            -- change all usages of these colors
            ochre = "#E0A020",
        },
        theme = {
            -- change specific usages for one theme, or for all of them
            dark = { ui = { float = { bg = "none" } } },
            all = { ui = { bg_gutter = "none" } },
        },
    },
})
```

Add or modify any highlight group with `overrides`. Supported keys are the same as the `{val}` parameter of `:h nvim_set_hl`.

```lua
require("azulejo-brutalism").setup({
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- a static palette color
            String = { fg = colors.palette.teal, italic = true },
            -- theme colors follow the active variant
            SomePluginHl = { fg = theme.syn.type, bold = true },
        }
    end,
})
```

### Tile-like floats

Borderless floats, each a solid tile:

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        NormalFloat = { bg = theme.ui.bg_m3 },
        FloatBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
        FloatTitle = { fg = theme.ui.fg_reverse, bg = theme.ui.primary, bold = true },
    }
end,
```

## Integration

### Get palette and theme colors

```lua
-- Colors for the current theme
local colors = require("azulejo-brutalism.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme

-- Colors for a specific theme
local oled_colors = require("azulejo-brutalism.colors").setup({ theme = "oled" })
```

### Lualine

```lua
require("lualine").setup({ options = { theme = "azulejo-brutalism" } })
```

<details>
<summary><h2>Color palette</h2></summary>

| Name        |    Hex    | Usage                                                     |
| :---------- | :-------: | :-------------------------------------------------------- |
| glaze0      | `#F3F0E8` | Glaze. Light background, dark foreground                  |
| glaze1      | `#E8E4D9` | Light floats, statusline, cursorline                      |
| glaze2      | `#DEDAD0` | Light whitespace, scrollbar                               |
| glaze3      | `#D8D4C8` | ANSI white                                                |
| black       | `#000000` | OLED background                                           |
| ink0        | `#07091F` | OLED floats, statusline, cursorline                       |
| ink1        | `#0C1030` | Ink. Dark background, light foreground                    |
| ink2        | `#10154A` | Dark floats, statusline, cursorline                       |
| ink3        | `#1A2150` | Dark whitespace, scrollbar                                |
| ink4        | `#141B6B` | Dark ANSI black                                           |
| slate0      | `#3D4163` | Light dimmed foreground, parameters, operators            |
| slate1      | `#5A5E78` | Light comments, punctuation                               |
| slate2      | `#8A8DA3` | Light line numbers, non-text                              |
| mist0       | `#C9CBE0` | Dark dimmed foreground, parameters, operators             |
| mist1       | `#8A8FB5` | Dark comments, punctuation                                |
| mist2       | `#6E7399` | Dark ANSI bright black                                    |
| mist3       | `#5A5F88` | Dark line numbers, non-text                               |
| cobalt      | `#1E2A9E` | Cobalt. Light keywords and primary, dark selection, grout |
| cobalt2     | `#3A48C4` | Light ANSI bright blue                                    |
| wash        | `#9FB2E4` | Wash. Dark keywords and primary, light selection          |
| wash2       | `#C3CFF2` | Dark ANSI bright blue                                     |
| washTile    | `#D6DAE7` | Light references, quickfix line, picker selection         |
| ochre       | `#D49A1A` | Ochre. Cursor, current line number, search; dark numbers  |
| ochre2      | `#E8B84A` | Dark ANSI bright yellow                                   |
| ochreDark   | `#B07A0C` | Light ANSI bright yellow                                  |
| ochreDeep   | `#8F6200` | Light numbers, constants, warnings                        |
| ironRed     | `#B03A2E` | Light errors, deletions                                   |
| copperGreen | `#2F6B3A` | Light strings, additions                                  |
| manganese   | `#6B2E80` | Light types, preprocessor                                 |
| teal        | `#1D6E7E` | Light specials, builtins, regex                           |
| terracotta  | `#E0705A` | Dark errors, deletions                                    |
| verdigris   | `#7CBF7A` | Dark strings, additions                                   |
| lilac       | `#C08AD6` | Dark types, preprocessor                                  |
| aqua        | `#6FC3CF` | Dark specials, builtins, regex                            |
| mossTile    | `#DCE6D6` | Light diff add                                            |
| roseTile    | `#F0D6CF` | Light diff delete                                         |
| skyTile     | `#DDE2EF` | Light diff change                                         |
| mossInk     | `#16304A` | Dark diff add                                             |
| plumInk     | `#3A1A3A` | Dark diff delete                                          |
| cobaltInk   | `#1A2466` | Dark diff change                                          |

Each pigment also has a brighter `*2` shade (`ironRed2`, `verdigris2`, ...) used for the bright ANSI colors.

</details>

## Extras

Every extra comes in `light`, `dark` and `oled`.

### [Ghostty](extras/ghostty/)

Copy the files to `~/.config/ghostty/themes/`, then:

```
theme = light:azulejo-brutalism-light,dark:azulejo-brutalism-dark
```

### [WezTerm](extras/wezterm/)

Copy the files to `~/.config/wezterm/colors/`, then:

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()

local dark = (wezterm.gui and wezterm.gui.get_appearance() or "Dark"):find("Dark")
config.color_scheme = dark and "Azulejo Brutalism Dark" or "Azulejo Brutalism Light"

return config
```

To skip the copy, point WezTerm at this repo instead: `config.color_scheme_dirs = { "/path/to/azulejobrutalism.nvim/extras/wezterm" }`. The scheme names are `Azulejo Brutalism Light`, `Azulejo Brutalism Dark` and `Azulejo Brutalism OLED`.

With the default fancy tab bar, the strip behind the tabs comes from `config.window_frame.active_titlebar_bg`, not from the scheme.

### [tmux](extras/tmux/)

Only styles are set, so your own `status-left`, `status-right` and window formats are kept.

```tmux
source-file /path/to/azulejobrutalism.nvim/extras/tmux/azulejo-brutalism-dark.tmux
```

### [fzf](extras/fzf/)

Appends `--color` to `FZF_DEFAULT_OPTS`. Source it from `~/.zshrc` or `~/.bashrc`:

```sh
source /path/to/azulejobrutalism.nvim/extras/fzf/azulejo-brutalism-dark.sh
```

### [bat](extras/bat/)

```sh
mkdir -p "$(bat --config-dir)/themes"
cp extras/bat/*.tmTheme "$(bat --config-dir)/themes/"
bat cache --build
```

bat picks light or dark from the terminal's colors. Set which ones in `~/.zshrc` or `~/.bashrc`:

```sh
export BAT_THEME_LIGHT=azulejo-brutalism-light
export BAT_THEME_DARK=azulejo-brutalism-dark
```

The same `.tmTheme` files work as a `syntax-theme` in [delta](https://github.com/dandavison/delta) and in Sublime Text.

## Acknowledgements

- [AzulejoBrutalism](https://github.com/VerticalHeretic/AzulejoBrutalism), the original work
- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim), whose structure and plugin coverage this follows
