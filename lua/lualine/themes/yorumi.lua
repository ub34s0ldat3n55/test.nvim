local theme = require("yorumi.colors").setup().theme

local yorumi = {}

yorumi.normal = {
  a = { bg = theme.syn.fun, fg = theme.ui.bg_p2 },
  b = { bg = theme.diff.change, fg = theme.syn.fun },
  c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

yorumi.insert = {
  a = { bg = theme.diag.ok, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

yorumi.command = {
  a = { bg = theme.syn.operator, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

yorumi.visual = {
  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

yorumi.replace = {
  a = { bg = theme.syn.constant, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

yorumi.inactive = {
  a = { bg = theme.ui.bg_p2, fg = theme.ui.fg_dim },
  b = { bg = theme.ui.bg_p2, fg = theme.ui.fg_dim, gui = "bold" },
  c = { bg = theme.ui.bg_p2, fg = theme.ui.fg_dim },
}

if vim.g.yorumi_lualine_bold then
  for _, mode in pairs(yorumi) do
    mode.a.gui = "bold"
  end
end

return yorumi
