local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
    handle = {
        color = colors.dark3,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    },
    excluded_filetypes = {
        "",
        "prompt",
        "TelescopePrompt",
        "startify"
    },
})
