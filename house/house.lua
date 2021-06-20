local house = {}

-- "This is  the house  that Jack built."
--  \_____/  \_/ \___/  \_____________/
--            \______________________/
--                  Noun Phrase:
--  + "the": Determiner > Central Determiner > Article > Definite
--  + "house": Head > Noun
--  + "that Jack built": Postmodifier > Relative Clause

local phrases_elems = {
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

local phrases = {}

local gen_phrases = function()
  -- assembles all the phrases from their elements
  for pe_i = 1, #phrases_elems do
    phrases[pe_i] = "the " .. phrases_elems[pe_i]['head']
    if phrases_elems[pe_i]['postmodifier'] then
      phrases[pe_i] = phrases[pe_i] .. " " .. phrases_elems[pe_i]['postmodifier']
    end
    if phrases_elems[pe_i]['rel_verb'] then
      phrases[pe_i] = phrases[pe_i] .. "\nthat " .. phrases_elems[pe_i]['rel_verb']
    end
  end
end

gen_phrases()

local verses = {}

local verse = function(which)
  -- returns the verse number 'which' of the nursery rhyme,
  --  which cumulates previous verses
  assert(type(which) == 'number' and (which >= 1 and which <= #phrases),
      "index `which` must be a natural number, between 1 and " .. #phrases)
  if not verses[which] then
    verses[which] = "This is"
    for i = which, 1, -1 do
      verses[which] = verses[which] .. " " .. phrases[i]
    end
    verses[which] = verses[which] .. "."
  end
  return verses[which]
end

local tale = function()
  -- returns the last verse of the nursery rhyme,
  --  which narrates the tale
  return verse(#phrases)
end

local recite = function()
  -- returns the whole nursery rhyme
  local whole_nr = {}
  for i = 1, #phrases do
    table.insert(whole_nr, verse(i))
  end
  return table.concat(whole_nr, "\n")
end

house.verse = verse
house.tale = tale
house.recite = recite
return house
