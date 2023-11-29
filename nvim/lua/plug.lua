local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

    "nvim-lualine/lualine.nvim",
    "itchyny/lightline.vim",
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
        },
    },
    "folke/which-key.nvim",
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
    },
    "folke/neodev.nvim",
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            -- Adds LSP completion capabilities
            "hrsh7th/cmp-nvim-lsp",

            -- Adds a number of user-friendly snippets
            "rafamadriz/friendly-snippets",
        },
    },
    -- Useful plugin to show you pending keybinds.
    { "folke/which-key.nvim", opts = {} },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                vim.keymap.set(
                    "n",
                    "<leader>hp",
                    require("gitsigns").preview_hunk,
                    { buffer = bufnr, desc = "Preview git hunk" }
                )

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set(
                    { "n", "v" },
                    "]c",
                    function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end,
                    { expr = true, buffer = bufnr, desc = "Jump to next hunk" }
                )
                vim.keymap.set({ "n", "v" }, "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, {
                    expr = true,
                    buffer = bufnr,
                    desc = "Jump to previous hunk",
                })
            end,
        },
    },
    -- tokyonight [theme]
    -- https://github.com/folke/tokyonight.nvim
    {
        "folke/tokyonight.nvim",
        event = "User LoadColorSchemes",
        opts = {
            plugins = { ["dashboard-nvim"] = true },
            dim_inactive = true, -- dims inactive windows
            transparent = true,

            -- Colors can be overrided
            on_highlights = function(hl, _)
                hl.Function = { fg = "#4278e3", bold = true }
                hl.SpecialChar = { fg = "#b4be82" }
                hl.Variable = { fg = "#84a0c6" }
                hl["@keyword"] = { fg = "#84a0c6" }
                hl["@keyword.function"] = { fg = "#84a0c6" }
                hl["@parameter"] = { fg = "#D9D7D6" }
                hl["@variable"] = { fg = "#D9D7D6" }
                hl["@constructor"] = { fg = "#eb8d1a" }
                hl["@conditional"] = { fg = "#7aa2f7" }
                hl["@namespace"] = { fg = "#8a9099" }
                hl["@comment"] = { fg = "#495154", italic = true }
            end,
            styles = {
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            on_colors = function(c)
                c.bg_sidebar = "#15191c"
                c.StatusLine = { bg = "#15191c" }
            end,
        },
    },
    --  Code identation [guides]
    --  https://github.com/lukas-reineke/indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User BaseFile",
        opts = {
            buftype_exclude = {
                "nofile",
                "terminal",
            },
            filetype_exclude = {
                "help",
                "startify",
                "aerial",
                "alpha",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "neo-tree",
                "Trouble",
                "ranger",
                "rnvimr",
            },
            context_patterns = {
                "class",
                "return",
                "function",
                "method",
                "^if",
                "^while",
                "jsx_element",
                "^for",
                "^object",
                "^table",
                "block",
                "arguments",
                "if_statement",
                "else_clause",
                "jsx_element",
                "jsx_self_closing_element",
                "try_statement",
                "catch_clause",
                "import_statement",
                "operation_type",
            },
            show_trailing_blankline_indent = false,
            use_treesitter = true,
            char = "▏",
            context_char = "▏",
            show_current_context = true,
        },
    },

    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = "ibl",
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim", opts = {} },
    "dense-analysis/ale",
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        build = "./install --all",
    },
    "editorconfig/editorconfig-vim",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {},
    },
    "vim-scripts/BufOnly.vim",
    "github/copilot.vim",
})
