vim.opt.background = "dark"
vim.g.colors_name = "darcula-solid-custom"

local lush = require("lush")
local darcula_solid = require("lush_theme.darcula-solid")

local theme = lush.extends({darcula_solid}).with(function(injected_functions)
    local sym = injected_functions.sym
    local hsl = lush.hsl

    local black   = hsl("#1c2022")
    local orange  = hsl("#cc7832")
    local purple  = hsl("#9876aa")

    return {

        --- Highlight groups

        Normal                      { bg = black },


        --- Treesitter

        sym("@variable")            { fg = purple },
        sym("@variable.builtin")    { fg = orange },
    }

end)

lush(theme)
