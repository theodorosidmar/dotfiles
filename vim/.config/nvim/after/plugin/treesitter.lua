require'nvim-treesitter.configs'.setup {
    ensure_installed = { "help", "kotlin", "java", "python", "json", "json5", "lua", "go", "javascript", "typescript", "tsx" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
