default:
    @just --list

format:
    stylua .

update-plugins:
    git subtree pull --prefix pack/plugins/start/everforest-nvim git@github.com:neanias/everforest-nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/rcd.nvim git@github.com:alven-shin/rcd.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/which-key.nvim git@github.com:folke/which-key.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/gitsigns.nvim git@github.com:lewis6991/gitsigns.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/mason.nvim git@github.com:mason-org/mason.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/conform.nvim git@github.com:stevearc/conform.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/undotree git@github.com:mbbill/undotree.git master --squash
    git subtree pull --prefix pack/plugins/start/oil.nvim git@github.com:stevearc/oil.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/plenary.nvim git@github.com:nvim-lua/plenary.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/telescope.nvim git@github.com:nvim-telescope/telescope.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/nvim-treesitter git@github.com:nvim-treesitter/nvim-treesitter.git main --squash
    git subtree pull --prefix pack/plugins/start/snacks.nvim git@github.com:folke/snacks.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/todo-comments.nvim git@github.com:folke/todo-comments.nvim.git main --squash
