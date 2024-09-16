local c = require("yorumi.lib.color")

-- TODO: add mist, the light colorscheme
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
  ---@param palette PaletteColors
  ---@return ThemeColors
  abyss = function(palette)
    return {
      ui = {
        fg         = palette.moonBeam,
        fg_dim     = palette.moonShadow,
        fg_reverse = palette.starLight,

        bg_dim     = palette.deepShadow,
        bg_gutter  = palette.abyssBlack,

        bg         = palette.abyssBlack,
        bg_p1      = palette.midnightBlue,
        bg_p2      = palette.deepShadow,

        special    = palette.coralBlush,
        nontext    = palette.duskySky,
        whitespace = palette.duskySky,

        bg_search  = palette.duskySky,
        bg_visual  = palette.moonShadow,

        pmenu      = {
          fg       = palette.moonBeam,
          fg_sel   = "none",
          bg       = palette.deepShadow,
          bg_sel   = palette.duskySky,
          bg_sbar  = palette.abyssBlack,
          bg_thumb = palette.deepSea,
        },
        float      = {
          fg        = palette.moonBeam,
          bg        = palette.deepShadow,
          fg_border = palette.starLight,
          bg_border = "none",
        },
      },
      syn = {
        string     = palette.coralBlush,
        variable   = "none",
        number     = palette.coralBlush,
        constant   = palette.amberWave,
        identifier = palette.sandyShore,
        parameter  = palette.lavenderPink,
        fun        = palette.starLight,
        statement  = "none",
        keyword    = palette.coralBlush,
        operator   = palette.sandyShore,
        preproc    = palette.fireCoral,
        type       = palette.tidePool,
        regex      = palette.sandyShore,
        deprecated = palette.duskySky,
        comment    = palette.moonShadow,
        punct      = palette.coralBlush,
        special1   = palette.lagoonCyan,
        special2   = palette.fireCoral,
        special3   = palette.coralRed,
      },
      vcs = {
        added   = palette.marineBloom,
        removed = palette.shellBlush,
        changed = palette.sandyShore,
      },
      diff = {
        add    = palette.marineBloom,
        delete = palette.shellBlush,
        change = palette.sandyShore,
        text   = palette.lunarSilver,
      },
      diag = {
        ok      = palette.marineBloom,
        error   = palette.fireCoral,
        warning = palette.sandyShore,
        info    = palette.crystalWave,
        hint    = palette.lunarSilver,
      },
      term = {
        palette.abyssBlack, -- black
        palette.fireCoral, -- red
        palette.seaGrass, -- green
        palette.sandyShore, -- yellow
        palette.tidePool, -- blue
        palette.seaAnemone, -- magenta
        palette.seaFoam, -- cyan
        palette.lunarSilver, -- white
        palette.deepShadow, -- bright black
        palette.shellBlush, -- bright red
        palette.marineBloom, -- bright green
        palette.beachSand, -- bright yellow
        palette.seaMist, -- bright blue
        palette.lavenderPink, -- bright magenta
        palette.crystalWave, -- bright cyan
        palette.moonBeam, -- bright white
        palette.amberWave, -- extended color 1
        palette.peachSurf, -- extended color 2
      },
    }
  end,
}
