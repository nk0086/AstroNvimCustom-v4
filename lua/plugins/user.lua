-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  },

  -- {
  --   "CopilotC-Nvim/Copilotchat.nvim",
  --   version = "*",
  --   opts = {
  --     show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  --     debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  --     disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
  --     language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
  --     -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
  --     -- temperature = 0.1,
  --   },
  --   build = function()
  --     vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  --   end,
  --   event = "VeryLazy",
  -- },

  {
    "machakann/vim-sandwich",
    version = "*",
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    versiont = "*",
    event = "VeryLazy",
  },

  {
    -- Denoでvimプラグインが動作するようになるやつ
    "vim-denops/denops.vim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  {
    "vim-skk/eskk.vim",
    lazy = false,
    init = function()
      vim.api.nvim_command("let g:eskk#directory = '~/.config/eskk'")
      vim.api.nvim_command("let g:eskk#egglike_newline = 1")
      vim.api.nvim_command("let g:eskk#large_dictionary = '~/.config/eskk/SKK-JISYO.L'")
      vim.api.nvim_command(
        "let g:eskk#dictionary = { 'path': g:eskk#directory.'/my_jisyo', 'sorted': 1, 'encoding': 'utf-8',}")
    end,
  },

  {
    "nk0086/judge-helper",
    version = "*",
    event = "VeryLazy",
  },

  {
    "rhysd/clever-f.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "rhysd/git-messenger.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "ktakayama/gpt-commit-msg.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "simeji/winresizer",
    version = "*",
    event = "VeryLazy",
  },

  {
    "mg979/vim-visual-multi",
    version = "*",
    event = "VeryLazy",
  },

  {
    "kkoomen/vim-doge",
    version = "*",
    event = "VeryLazy",
  },

  {
    "mattn/emmet-vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "mattn/vim-maketable",
    version = "*",
    event = "VeryLazy",
  },

  {
    "ToruNiina/satysfi.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "fatih/vim-go",
    version = "*",
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "nvim-lua/popup.nvim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "iberianpig/tig-explorer.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = 0
    end,
    ft = { "markdown" },
  },

  -- {
  --   "xavierchow/vim-swagger-preview",
  --   version = "*",
  --   event = "VeryLazy",
  -- },

  {
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- set this if you want to always pull the latest change
      opts = {
        -- add any opts here
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          kt = { "markdown", "Avante" },
        },
      },
    }}
}
