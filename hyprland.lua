local hostname = io.popen("hostname"):read("*l")

local monitor = require("modules.monitor")
local programs = require("modules.programs")
local autostart = require("modules.autostart")
local lookandfeel = require("modules.lookandfeel")
local workspaces = require("modules.workspaces")
local windowrules = require("modules.windowrules")
local input = require("modules.input")
local bindings = require("modules.bindings")

monitor.setup(hostname)

programs.setup()

lookandfeel.setup()

input.setup()

autostart.setup(hostname)

workspaces.setup(hostname)

windowrules.setup(hostname)

bindings.setup(hostname, programs.state)
