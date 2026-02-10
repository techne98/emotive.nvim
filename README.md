# Emotive 😎

Emotive is an emoji picker extension for [Telescope](https://github.com/nvim-telescope/telescope.nvim).

Users can use Telescope's UI to find emojis by name and copy them into their
current buffer.

# Installation

This plugin requires you to have [Telescope] and its required dependencies installed. 

Add the following code to your [Lazy](https://github.com/folke/lazy.nvim) plugin spec table: 

```lua
{
  "techne98/emotive.nvim",
  config = false
}
```

# Using Emotive

You can open the emoji picker in command-line mode, for example with `:Telescope emotive emojis`. 

You can create a keybind for this too. 

# Contributing

If you notice that an emoji is missing, please consider adding it to the [emoji_db.lua](https://github.com/techne98/emotive/blob/main/lua/emotive/emoji_db.lua) file.
