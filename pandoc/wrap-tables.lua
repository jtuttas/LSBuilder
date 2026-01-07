-- Pandoc Lua filter: enforce column widths so LaTeX tables wrap instead of overflowing.
-- Works with Pandoc 2.x (legacy Table) and 3.x (new Table with colspecs).

local function even_widths(n)
  if n <= 0 then
    return {}
  end
  local w = 1.0 / n
  local widths = {}
  for i = 1, n do
    widths[i] = w
  end
  return widths
end

local function set_new_table_colspecs(colspecs)
  local n = #colspecs
  if n == 0 then
    return colspecs
  end
  local w = 1.0 / n
  local out = {}
  for i, cs in ipairs(colspecs) do
    local align = cs[1]
    out[i] = { align, w }
  end
  return out
end

function Table(el)
  -- Pandoc 3.x: el.colspecs = list of { alignment, width }
  if type(el) == 'table' and type(el.colspecs) == 'table' then
    el.colspecs = set_new_table_colspecs(el.colspecs)
    return el
  end

  -- Pandoc 2.x (legacy): el.widths = list of numbers
  if type(el) == 'table' and type(el.widths) == 'table' then
    el.widths = even_widths(#el.widths)
    return el
  end

  return nil
end
