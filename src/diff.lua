local M = {}
local math = require 'math'

---
-- Computing Levenshtein distance.
--
-- Useful to detect differences between strings.
-- Strongly inspired from https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows
-- @return #number Levenshtein distance
function M.length(ref, str)

  -- Trivial cases
  if ref == str then return 0 end
  if #ref == 0 then return #str end
  if #str == 0 then return #ref end

  -- Initializing first line, the distance is character count
  local previous = {}
  for i=0, #str do
    previous[i] = i
  end

  -- Compute following lines
  local current = {}
  for i=1, #ref do
    current = { [0] = i }
    for j=1, #str do
    -- Computing cost
      local cost = ref:byte(i) == str:byte(j) and 0 or 1
      current[ j ] = math.min(
        previous[j] + 1,     -- Deletion
        current[j-1] + 1,    -- Insertion
        previous[j-1] + cost -- Substitution
      )
    end
    previous = current
  end
  return current[ #str ]
end

return M
