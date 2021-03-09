local house = {}

local verses = {}

-- "This is  the house  that Jack built."
--  \_____/  \_/ \___/  \_____________/
--            \______________________/
--                  Noun Phrase:
--  + "the": Determiner > Central Determiner > Article > Definite
--  + "house": Head > Noun
--  + "that Jack built": Postmodifier > Relative Clause

local verses_elems = {
  {['head'] = "house",   ['postmodifier'] = "that Jack built",                                      },
  {['head'] = "malt",                                                  ['rel_verb'] = "lay in"      },
  {['head'] = "rat",                                                   ['rel_verb'] = "ate"         },
  {['head'] = "cat",                                                   ['rel_verb'] = "killed"      },
  {['head'] = "dog",                                                   ['rel_verb'] = "worried"     },
  {['head'] = "cow",     ['postmodifier'] = "with the crumpled horn",  ['rel_verb'] = "tossed"      },
  {['head'] = "maiden",  ['postmodifier'] = "all forlorn",             ['rel_verb'] = "milked"      },
  {['head'] = "man",     ['postmodifier'] = "all tattered and torn",   ['rel_verb'] = "kissed"      },
  {['head'] = "priest",  ['postmodifier'] = "all shaven and shorn",    ['rel_verb'] = "married"     },
  {['head'] = "rooster", ['postmodifier'] = "that crowed in the morn", ['rel_verb'] = "woke"        },
  {['head'] = "farmer",  ['postmodifier'] = "sowing his corn",         ['rel_verb'] = "kept"        },
  {['head'] = "horse and the hound and the horn",                      ['rel_verb'] = "belonged to" },
}

gen_verses = function()
  for i = 1, #verses_elems do
    verses[i] = "This is "
    verses[i] = verses[i] .. "the " .. verses_elems[i]['head']
    if verses_elems[i]['postmodifier'] then
      verses[i] = verses[i] .. " " .. verses_elems[i]['postmodifier']
    end
    if verses_elems[i]['rel_verb'] then
      verses[i] = verses[i] .. "\nthat " .. verses_elems[i]['rel_verb'] .. " "
      verses[i] = verses[i] .. verses[i-1]:sub(9, verses[i-1]:len()-1)
    end
    verses[i] = verses[i] .. "."
  end
end

gen_verses()

house.verse = function(which)
  assert(type(which) == 'number' and (which >= 1 and which <= #verses),
      "index `which` must be a natural number, between 1 and " .. #verses)
  return verses[which]
end

house.recite = function()
  return table.concat(verses, "\n")
end

return house
