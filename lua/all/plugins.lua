-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
        function(use)
        use 'wbthomason/packer.nvim' 
        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------
        use 'glepnir/dashboard-nvim'
        use 'ellisonleao/gruvbox.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        require('lualine').setup()
        -------------
        -- Editing --
        -------------
        use 'tpope/vim-surround'
	    use 'jiangmiao/auto-pairs'
        use 'norcalli/nvim-colorizer.lua'
        require'colorizer'.setup ({
             '*';
        }, { names = false; })

        use {
          'numToStr/Comment.nvim',
          config = function()
          require('Comment').setup()
        end
}

     end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
