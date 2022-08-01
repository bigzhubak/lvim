package.path = os.getenv("HOME") .. "/.config/lvim/?.lua;" .. package.path
require("vim_config")
require("lvim_config")
require("builtin_config")
require("plugin")
require("formatters")
require("linters")
require("actions")
