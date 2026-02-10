return require("telescope").register_extension {
  setup = function(ext_config, config)
  end,
  exports = {
    emojis = require("emotive").emojis
  },
}
