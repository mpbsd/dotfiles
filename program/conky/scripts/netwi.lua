function nwi()
  CMD_PART = {
    [[ip a]],
    [[sed -n '/inet\s\+[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\/24/p']],
    [[sed 's/^.* \([a-z0-9]\+\)$/\1/']],
    [[head -1]],
  }

  cmd = CMD_PART[1]

  for i = 2, 4 do
    cmd = cmd .. " | " .. CMD_PART[i]
  end

  handle = io.popen(cmd)
  result = nil

  if handle ~= nil then
    result = handle:read("*a"):gsub("\n", "")
    handle:close()
  end

  return result
end

function conky_iname()
  return nwi()
end

function conky_iface()
  return conky_parse("${addr " .. nwi() .. "}")
end

function conky_speed(direction)
  return conky_parse("${" .. direction .. "speed " .. nwi() .. "}")
end

function conky_graph(direction)
  return conky_parse("${" .. direction .. "speedgraph " .. nwi() .. " 14,}")
end
