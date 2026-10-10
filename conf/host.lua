local M = {}

function M.name()
	local f = io.open("/etc/hostname", "r")
	if f then
		local h = f:read("*l")
		f:close()
		if h and h ~= "" then
			return (h:gsub("%s+$", ""))
		end
	end
	local p = io.popen("hostname")
	if p then
		local h = p:read("*l")
		p:close()
		if h and h ~= "" then
			return h
		end
	end
	return os.getenv("HOSTNAME") or "unknown"
end

function M.load()
	local name = M.name()
	-- exact match first, then family match, then fallback
	local candidates = { "conf.hosts." .. name:lower() }
	if name:find("Desktop") then
		candidates[#candidates + 1] = "conf.hosts.desktop"
	end
	if name:find("Laptop") then
		candidates[#candidates + 1] = "conf.hosts.laptop"
	end
	candidates[#candidates + 1] = "conf.hosts.default"
	for _, mod in ipairs(candidates) do
		local ok, profile = pcall(require, mod)
		if ok and type(profile) == "table" then
			profile.hostname = name
			return profile
		end
	end
	error("no host profile found for " .. name)
end

return M
