---@class PaletteColors
local palette = {
  -- yoru (night)
  abyssBlack    = "#060914",
  midnightBlue  = "#121210",
  deepShadow    = "#1D2132",
  duskySky      = "#343A4F",

  -- tsukiakari (moonlight)
  moonShadow    = "#4F5464",
  lunarSilver   = "#A6A8BA",
  moonBeam      = "#BDBFCB",
  starLight     = "#C6DFEC",

  -- umi (sea)
  coralRed      = "#9A3225",
  sunsetOrange  = "#A04E1D",
  kelpGreen     = "#1C4642",
  deepSea       = "#153F56",
  sunkenGold    = "#A66A15",
  seaAnemone    = "#6D2975",
  lagoonCyan    = "#007B8B",

  -- sango (corals)
  fireCoral     = "#CB3F2A",
  amberWave     = "#CE6428",
  seaGrass      = "#15724E",
  tidePool      = "#27879C",
  sandyShore    = "#D18926",
  coralBlush    = "#AB46B9",
  seaFoam       = "#2DA3AD",

  -- shio (tide)
  shellBlush    = "#D07676",
  peachSurf     = "#D0927A",
  marineBloom   = "#7DC893",
  seaMist       = "#94D6D8",
  beachSand     = "#D0AD7D",
  lavenderPink  = "#D897DF",
  crystalWave   = "#99FAFF",
}

local M = {}

--- generate colors table:
--- * opts:
---   - colors: table of personalized colors and/or overrides of existing ones
---     defaults to yorumiconfig.colors
---   - theme: use selected theme. defaults to yorumiconfig.theme
---     based on the value of the `background` option
--- @params opts? { colosr?: table, theme?: string }
--- @return { theme: ThemeColors, palette: PaletteColors }
function M.setup(opts)
  opts = opts or {}
  local override_colors = opts.colors or require("yorumi").config.colors
  local theme = opts.theme or require("yorumi")._CURRENT_THEME

  if not theme then
    error("yorumi.colors.setup(): unable to infer `theme`. either specify a theme or call this function after `:colorscheme yorumi`")
  end

  -- add to and/or override palette_colors
  local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

  -- generate the theme according to the updated palette colors
  local theme_colors = require("yorumi.themes")[theme](updated_palette_colors)

  -- add to and/or override theme_colors
  local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
  local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)

  return {
    theme = updated_theme_colors,
    palette = updated_palette_colors,
  }
end

return M
