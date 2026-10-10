local host = require("conf.host").load()

require("conf.general").setup(host)
require("conf.monitors").setup(host)
require("conf.windowrules").setup(host)
require("conf.autostart").setup(host)
require("conf.binds").setup(host)
