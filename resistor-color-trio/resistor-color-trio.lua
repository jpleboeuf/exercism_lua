 local ResistorColorTrio = {}
 
 ResistorColorTrio.cv = {
      ['black' ] = 0,
      ['brown' ] = 1,
      ['red'   ] = 2,
      ['orange'] = 3,
      ['yellow'] = 4,
      ['green' ] = 5,
      ['blue'  ] = 6,
      ['violet'] = 7,
      ['grey'  ] = 8,
      ['white' ] = 9,
    }

ResistorColorTrio.decode = function(c1, c2, c3)
  local lst_colors = ""
  for k, v in pairs(ResistorColorTrio.cv) do
    lst_colors = lst_colors .. k .. " "
  end
  assert(type(c1) == 'string' and ResistorColorTrio.cv[c1] ~= nil, "color `c1` must be a string, among: " .. lst_colors)
  assert(type(c2) == 'string' and ResistorColorTrio.cv[c2] ~= nil, "color `c2` must be a string, among: " .. lst_colors)
  assert(type(c3) == 'string' and ResistorColorTrio.cv[c3] ~= nil, "color `c3` must be a string, among: " .. lst_colors)
  local value = 0
  local unit = "ohms"
  value = (
                   (ResistorColorTrio.cv[c1] * 10)
            +      (ResistorColorTrio.cv[c2])
           )
          *   (10 ^ ResistorColorTrio.cv[c3])
  if value >= 1000 then
    value = value / 1000
    unit = "kiloohms"
  end
  return math.floor(value), unit
end

return {
    decode = ResistorColorTrio.decode
  }
