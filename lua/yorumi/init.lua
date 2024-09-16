local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias YorumiColorSpec { palette: ColorTable, theme: ColorTable }
---@alias YorumiColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class YorumiConfig
M.config = {
  undercurl = true,
  commentStyle = {},
  functionStyle = {},
  keywordStyle = { bold = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,
  dimInactive = false,
  terminalColors = true,
  colors = {
    theme = {
      abyss = {},
      mist = {},
      all = {}
    },
    palette = {}
  },
  ---@type fun(colors: YorumiColorSpec): table<string, table>
  overrides = function ()
    return {}
  end,
  ---@type { dark: string, light: string }
  background = { dark = "abyss", light = "mist" },
  theme = "abyss",
  compile = false,
}

local function check_config(config)
  local err
  return not err
end

--- update global config with user settings
---@param config? YorumiConfig user configuration
function M.setup(config)
  if check_config(config) then
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
  else
    vim.notify("yorumi: errors found while loading config. using defaults...", vim.log.levels.ERROR)
  end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
  local utils = require("yorumi.utils")

  theme = theme or M.config.background[vim.o.background] or M.config.theme
  M._CURRENT_THEME = theme

  vim.g.colors_name = "yorumi"
  vim.o.termguicolors = true

  if M.config.compile then
    if utils.load_compiled(theme) then
      return
    end

    M.compile()
    utils.load_compiled(theme)
  else
    local colors = require("yorumi.colors").setup({ theme = theme, colors = M.config.colors })
    local highlights = require("yorumi.highlights").setup(colors, M.config)
    require("yorumi.utils").compile(theme, highlights, M.config.terminalColors and colors.theme.term or {})
  end
end

vim.api.nvim_create_user_command("YorumiCompile", function()
  for mod, _ in pairs(package.loaded) do
    if mod:match("^yorumi%.") then
      package.loaded[mod] = nil
    end
  end
  M.compile()
  vim.notify("yorumi: compiled successfully", vim.log.levels.INFO)
  M.load(M._CURRENT_THEME)
  vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return M
