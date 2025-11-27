-- nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile', 'NvimTreeFindFileToggle' },
  keys = {
    { '<leader>pv', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file tree' },
    { '<leader>pf', '<cmd>NvimTreeFindFile<CR>', desc = 'Find file in tree' },
  },
  config = function()
    -- Disable netrw (nvim-tree's recommendation)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup({
      -- Disable netrw completely
      disable_netrw = true,
      hijack_netrw = true,
      
      -- View options
      view = {
        width = 30,
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
        float = {
          enable = false,
        },
      },
      
      -- Renderer options
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = 'name',
        root_folder_label = ':~:s?$?/..?',
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = '└',
            edge = '│',
            item = '│',
            bottom = '─',
            none = ' ',
          },
        },
        icons = {
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = true,
              color = true,
            },
          },
          git_placement = 'before',
          modified_placement = 'after',
          padding = ' ',
          symlink_arrow = ' ➛ ',
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = '󰈚',
            symlink = '󰌷',
            bookmark = '󰆤',
            modified = '●',
            folder = {
              arrow_closed = '󰅇',
              arrow_open = '󰅀',
              default = '󰉋',
              open = '󰝰',
              empty = '󰉖',
              empty_open = '󰷏',
              symlink = '󰉒',
              symlink_open = '󰉒',
            },
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '󰄬',
              renamed = '➜',
              untracked = '★',
              deleted = '󰛌',
              ignored = '◌',
            },
          },
        },
        special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
        symlink_destination = true,
      },
      
      -- Update options
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
      },
      
      -- System open
      system_open = {
        cmd = nil,
        args = {},
      },
      
      -- Git integration
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      
      -- Filters
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
      },
      
      -- Trash
      trash = {
        cmd = 'trash',
        require_confirm = true,
      },
      
      -- Live filter
      live_filter = {
        prefix = '[FILTER]: ',
        always_show_folders = true,
      },
      
      -- Tab options
      tab = {
        sync = {
          open = false,
          close = false,
          ignore = {},
        },
      },
      
      -- Notify
      notify = {
        threshold = vim.log.levels.INFO,
      },
      
      -- Log
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
    })
  end,
}





