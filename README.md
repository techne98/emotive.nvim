# Emotive 😎

Emotive is an emoji picker extension for [Telescope](https://github.com/nvim-telescope/telescope.nvim).

Users can use the Telescope UI to find emojis by name and copy them into their
current buffer.

https://github.com/user-attachments/assets/b5ef4112-19d5-4fc4-a3c7-6f1bb85be67a

# Installation

This plugin requires you to have Telescope and its required dependencies installed.

Add the following code to your [Lazy](https://github.com/folke/lazy.nvim) plugin spec table:

```lua
{
  "jackwsmth/emotive.nvim",
  config = false
}
```

# Using Emotive

You can open the emoji picker in command-line mode, for example with `:Telescope emotive emojis`. 

Example custom keybind:

```lua
vim.keymap.set('n', '<leader>fe', require('telescope').extensions.emotive.emojis)
```

# Contributing

If you notice that an emoji is missing, please consider adding it to the [emoji_db.lua](https://github.com/techne98/emotive.nvim/blob/main/lua/emotive/emoji_db.lua) file.

Please do the following:

1. Fork the project
2. Create a branch, e.g. git checkout -b my-new-feature
3. Commit some changes
4. Open a pull request

Thanks!
