local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local emoji_db = require("emotive.emoji_db")

local emoji_cache = nil

local function get_formatted_emojis()
    if emoji_cache then
        vim.notify("Using cache, did not generate new table", vim.log.levels.INFO)
        return emoji_cache
    end

    local results = {}
    for _, emoji in ipairs(emoji_db) do
        local emoji_str = emoji.emoji .. " " .. emoji.name
        table.insert(results, emoji_str)
    end
    vim.notify("Emoji table created", vim.log.levels.INFO)
    emoji_cache = results
    return results
end

local emojis = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "search emojis",
    finder = finders.new_table {
      results = get_formatted_emojis()
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      local emoji = selection[1]:match("^%S*")
      vim.api.nvim_put({ emoji }, "", false, true)
      end)
      return true
    end,
  }):find()
  end

return { emojis = emojis }
