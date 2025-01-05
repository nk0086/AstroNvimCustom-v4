-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
              require("astronvim.utils.buffer").close(
                bufnr)
            end)
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        [";"] = { ":" },

        -- resize
        ["<C-r>"] = { ":WinResizerStartResize<cr>" },

        -- split
        ["<C-s>"] = { "<C-w>v", desc = "Split window vertically" },
        -- ["<C-t>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },

        ["<leader>t"] = { "<cmd>ToggleTerm float<cr>", desc = "ToggleTerm float"},

        -- vim-visual-multi
        ["<A-k>"] = { "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>" },
        ["<A-j>"] = { "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>" },

        -- telescope
        ["<leader>gg"] = { "<cmd>Telescope git_commits<cr>", desc = "Find a commit history in current file" },
        ["<leader>gG"] = { "<cmd>Telescope git_bcommits<cr>", desc = "Find commit history in all files" },
        ["<leader>gn"] = { "<cmd>Neogit<cr>", desc = "Neogit" },
        ["<leader>gt"] = { "<cmd>TigOpenProjectRootDir<cr>", desc = "Open tig with Project root path"},
        ["<leader>gT"] = { "<cmd>TigOpenCurrentFile<cr>", desc = "Open tig with current file"},

        -- markdown-preview
        ["<leader>mp"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
        -- vim swagger
        ["<leader>sp"] = { "<Plug>GenerateDiagram", desc = "Generate Swagger Diagram"},
        -- Copilot Chat
        ["<leader>a"] = { name = "Copilot Chat"},

      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      i = {
        ["<C-f>"] = { "<C-g>U<ESC><S-a>" },
      },
      v = {
        -- visual mode key mapping
        ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
        ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
      }
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
