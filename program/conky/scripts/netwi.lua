function nwiface()
	local CMD_PART = {
		[[ip a]],
		[[sed -n '/inet\s\+[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\/24/p']],
		[[sed 's/^.* \([a-z0-9]\+\)$/\1/']],
		[[head -1]],
	}

	local cmd = CMD_PART[1]

	for i = 2, 4 do
		cmd = cmd .. " | " .. CMD_PART[i]
	end

	local handle = io.popen(cmd)
	local result = nil

	if handle ~= nil then
		result = handle:read("*a"):gsub("\n", "")
		handle:close()
	end

	return result
end
