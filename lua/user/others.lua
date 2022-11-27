require("bufferline").setup{
    options = {
        offsets = {
          {
            filetype = "NvimTree",
            text="File Explorer",
            text_align = "left",
            separator = false,
          }
        },

        diagnostics = "nvim_lsp",
        separator_style = {"", ""},
        modified_icon = '●',
        show_close_icon = false,
        show_buffer_close_icons = false,
    },
  -- highlights = {
  --   offset_separator = {
  --     bg = '#'..string.format("%06x", vim.api.nvim_get_hl_by_name("Normal", true).background),
  --   }
  -- }
  
}

require("lualine").setup {
    options = {
        -- component_separators = { left = '', right = '/'},
        section_separators = '',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = '',
        -- section_separators = { left = '', right = '' },

        globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
          separator = { left = '', right = '' },
          fmt = function(str) return ' ' end,
          padding = { left = 0, right = 0 },
        },
      },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
        'diagnostics',
        {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'location'},
      lualine_z = { },
  }
}

require("nvim-treesitter.configs").setup {
  ensure_installed = { "javascript", "typescript", "python" },
  sync_install = false,
  indent = {
    enable = true,
    disable = { 'python', 'c'} -- these and some other langs don't work well
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', ']', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
