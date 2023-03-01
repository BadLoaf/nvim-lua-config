# Easy Neovim with Lua

A basic Neovim setup to start with. All the features that you would expect in a modern code editor have been set up, including:

- Autocomplete using Neovim's built in LSP for fast completion.
- Syntax highlighting using Treesitter.
- Default Tokyonight theme for a pretty editing experience.
- A filetree for project navigation.
- Telescope plugin for faster file navigation.
- Fast and easily extensible plugin management using Lazy.nvim.
- Cleaner and more modern interface using noice.nvim. (experimental)
- A few of my own shortcuts to make editing more fun and efficient.

## Screenshots

![nvim_screenshot_1](https://user-images.githubusercontent.com/98209679/222123905-da7b944a-7d32-400e-9579-db31de5b9ca6.png)

## Installation

Clone the repo with:

    git clone https://github.com/BadLoaf/nvim-lua-config.git

And copy the contents of the folder to your config folder. For Linux, this is usually ~/.config/nvim

## Usage

### First Time Users
If this is your first time using vim/neovim, it is highly recommended to learn basic vim usage with `:Tutor`.

### Installing Language Support

To install syntax highlighting for a language, use

    :TSInstall <language>

and to install autocompletion, use

    :MasonInstall <language>
    
Use tab while writing the language name to see all the available options.

### Basic keybindings

`Ctrl-N` Toggle filetree  
`Leader-ff` Search project files quickly with Telescope  
`Leader-fg` Perform live grep on project files (requires ripgrep)  
