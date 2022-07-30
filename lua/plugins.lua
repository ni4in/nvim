--[[ plugins.lua]]
--these will load the plugin manager and plugins 
--
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use {'wbthomason/packer.nvim'}

    use {'kyazdani42/nvim-tree.lua',requires='kyazdani42/nvim-web-devicons'}

    use {'mhinz/vim-startify'}

    use {'DanilaMihailov/beacon.nvim'}

    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt=true}}

    use {'Mofiqul/dracula.nvim', as = 'dracula'}

    use {'majutsushi/tagbar'}

    use {"Yggdroot/indentLine"}

    use {"tpope/vim-fugitive"}

    use{"junegunn/gv.vim"}

    use {"windwp/nvim-autopairs"}

    use{"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
    
    use("nvim-treesitter/nvim-treesitter")

    use("neovim/nvim-lspconfig")

    use("williamboman/nvim-lsp-installer")

    use {"romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}}


    use {'hrsh7th/cmp-nvim-lsp'}

    use {'hrsh7th/cmp-buffer'}
    
    use {'hrsh7th/cmp-path'}
    
    use {'hrsh7th/cmp-cmdline'}
    
    use {'hrsh7th/nvim-cmp'}    
    
    use {'phaazon/hop.nvim',branch = 'v2'}

    --use {"folke/which-key.nvim"}

end)

