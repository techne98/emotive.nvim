local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local emoji_db = require("emojis")

local function get_formatted_emojis()
    local results = {}
    for _, emoji in ipairs(emoji_db) do
        local emoji_str = emoji.emoji .. " " .. emoji.name
        table.insert(results, emoji_str)
    end
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
      -- print(vim.inspect(selection))
      vim.api.nvim_put({ emoji }, "", false, true)
      end)
      return true
    end,
  }):find()

  end

emojis()
