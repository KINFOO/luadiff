#!/usr/bin/env lua
local arguments = {...}
if #arguments ~= 2 then
  print 'Take two strings as parameter.'
  return
end

local diff = require 'diff'
print(string.format('Levenshtein distance: %d.',
  diff.length(arguments[1], arguments[2]))
)
