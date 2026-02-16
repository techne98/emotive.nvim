local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local emoji_db = require("emotive.emoji_db")

local emojis = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "search emojis",
    finder = finders.new_table {
      results = emoji_db,
      entry_maker = function(entry)
        local emoji_str = entry.emoji .. " " .. entry.name
        return {
          value = entry,
          display = emoji_str,
          ordinal = emoji_str
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      vim.api.nvim_put({ selection.value.emoji }, "", false, true)
      end)
      return true
    end,
  }):find()
end

return { emojis = emojis }
