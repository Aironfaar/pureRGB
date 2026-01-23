# Pokémon PureRGB (PureRed, PureGreen, PureBlue)

A purist's enhancement of Pokémon Red, Green, and Blue based on the pokered disassembly, created by Vortyne. Please see the [original github page](https://github.com/Vortyne/pureRGB) for information about this hack. My own modifications are documented in this readme.

I don't provide ips files for patching, but you can build this modified version the same way you can build [the disassembly of Pokémon RGB](https://github.com/pret/pokered) using make.

## Fork Changes
First, a bit of a disclaimer: If you play my modded version of pureRGB, create a new save file for it. I didn't update the save import feature to my particular changes, so something might break if you try anyway. Also, as long as I play pureRGB myself, I'll try to keep things updated in a way that will avoid issues, but I started this project mostly to satisfy my curiosity whether I could learn to make the changes I wanted, so keeping it up-to-date isn't a high priority for me. With that out of the way…

Some of the modifications are supposed to make certain mono type runs go a bit more smoothly:
- Arcanine, Parasect and Venusaur can now learn Surf. With this change, it is possible to cover all of Flash, Cut, Strength, Fly or Dig, and Surf with mono type teams.
- You can now find at least one pokémon of each type before reaching Pewter City. One of them requires interaction with a new NPC, the others are out there in the wild.
- Seel is now Water/Ice instead of Ice. This was the only somewhat reasonable way to provide a proper Ice type pokémon before reaching Pewter City. You can disable this change at the usual Type Changer NPC.
- Three new Dragon types have been added as variants of existing pokémon. There are new texts in the game that hint at them, but they are:
  - Using a Moon Stone, Pikachu can now be evolved into a Raichu variant of Electric/Dragon type.
  - Using a Moon Stone, Nidoran F and Nidoran M can now be evolved into Nidorina and Nidorino variants with different base stats and learnsets. These variants evolve into Nidoqueen and Nidoking variants at level 36, which, instead of Poison/Ground types, are Poison/Dragon types.

Others are simply modifications to my personal taste:
- The Pokédex now uses meters and kilograms instead of feet and pounds.
- Gyarados can now learn Fly.
- Splash is now a signature move for Magikarps of level 20 or higher, as well as for Gyarados. The Move Mystic will tell you more. To make sure that Gyarados can be encountered in the wild with Splash, they now know Splash at level 1.
- Cursed Gengar now has different stats. The Dark and Light Channeler that inflict and remove the curse will inform you of the exact stat changes. To emphasize the new stat spread of Cursed Gengar, Gastly, Haunter and Gengar now learn Poison Gas instead of Filthy Slam at level 41. They can still learn Filthy Slam via TM.
- Wild Missingno. are diversified. Before the change, catching one of them felt like a cheat since they were all already at level 120. Now, they appear at levels 1 to 120, and due to additions of TM moves (which it could learn already anyway) to its natural learnset, every level of wild Missingno. has a different moveset.
- Some encounter tables have been touched upon for nitpicky reasons, like wondering how a horse, flaming or not, could live in the rugged terrain of a volcanic mountain.
- All unevolved and non-evolving pokémon except Zapdos, Articuno, Moltres, Mewtwo, Mew and the fossil pokémon can now be encountered in the wild in either palette somewhere in the world. This means you can catch them all in whichever palette you like best. To facilitate this, some encounter tables have been changed, in particular the entire Safari Zone.
- Fossil pokémon are now revived with their normal or alternate palette, chosen at random.
- Team Rocket now offers fossils and ambers as Game Corner prizes. So that's what they were in Mt. Moon for! Since the fossils and amber can now be replaced, they are no longer key items. However, like the Master Ball, they are invaluable, so they sell for nothing. The TMs that would normally be offered as prizes are now sold in the Celadon Department Store.
- The Fossil Guy in Saffron will now offer that you can pay for the repairs of his broken experimental teleporter after you gave him your Mt. Moon fossil and the Old Amber. This means he'll still get those fossils to Cinnabar Lab for you so they can be revived, allowing you to revive those fossils from Game Corner before reaching Cinnabar Island. However, those repairs aren't cheap!
- In-game trades have been completely redone:
  - A bit of unique dialogue has been added to each trade to give the NPCs some personality and their pokémon a bit of background.
  - Existing trade NPCs may ask for different pokémon and give you a different one in return.
  - The trades on Cinnabar Island are now only accessible once you become the champion of the Pokémon League. In turn, the pokémon you receive in these trades are much more interesting.
  - Six new trades have been introduced to the game, two of which require you to be the champion.
- There is now a Move Reminder in the Daycare.
- Learnsets have been touched: Except for the new variants of Nidorina, Nidoqueen, Nidorino and Nidoking, which forget moves that are no longer part of their learnset upon evolving from Nidoran F/M and learn the moves that replaced them, all evolved pokémon can learn their previous forms' moves either by level or TM/HM. If you evolve your pokémon the moment it becomes possible, you will neither miss a move nor lose out entirely on something that the previous form could learn. If all else fails, the Move Reminder can help.
- Some moves have been changed:
  - Cut: BP 70 -> 60, gives +1 Attack
  - Dig: BP 80 -> 130, ACC 100 -> 95, PP 10 -> 5
  - Doubleslap: ACC 85 -> 100
  - Dragon Rage: 10% chance to make target flinch
  - Filthy Slam: 20% chance to badly poison the target
  - Fly: BP 90 -> 130, ACC 100 -> 95, PP 15 -> 5
  - Guillotine: Type BUG -> NORMAL
  - Horn Drill: Type NORMAL -> FIGHTING
  - Pin Missile: BP 18 -> 20
  - Psybeam: BP 65 -> 75, confusion chance 10% -> 30%
  - Splash: Type NORMAL -> FLYING, signature move of Gyarados and Level 20+ Magikarp (refer to Move Mystic in Saffron City for details)
  - Stomp: Type NORMAL -> GROUND
  - Strength: 33% chance for -1 Defense
- 20 TMs have been added, most to reintroduce previously available TMs, some to add new moves to the TM pool.
  - TM 51: Teleport
  - TM 52: Softboiled
  - TM 53: Recover
  - TM 54: Rest (new)
  - TM 55: Mimic
  - TM 56: Metronome
  - TM 57: Fissure
  - TM 58: Guillotine (new)
  - TM 59: Selfdestruct
  - TM 60: Explosion
  - TM 61: Whirlwind
  - TM 62: Tri Attack
  - TM 63: Headbutt (new)
  - TM 64: Pay Day
  - TM 65: Egg Bomb
  - TM 66: Rage
  - TM 67: Submission
  - TM 68: Dream Eater
  - TM 69: Leech Life (new)
  - TM 70: Drain Punch (new)
- Copycat now gives you Mimic again. Just felt too iconic to change that.
- Caterpie, Metapod, Weedle, Kakuna and Magikarp are back to being unable to learn any TMs and HMs.

## Credits
Vortyne - Creator of pureRGB, which this is a modification of

Helix Chamber - [Published their fan-made sprite reconstructions](https://x.com/helixchamber/status/1158772044533813250), some of which I used in this project (more specific credits below)

@catstorm26 - Creator of the [variant Nidorina](https://github.com/Aironfaar/pureRGB/tree/main/gfx/pokemon/front_alt/kaiju_nidorina.png) and [variant Nidoqueen](https://github.com/Aironfaar/pureRGB/tree/main/gfx/pokemon/front_alt/kaiju_nidoqueen.png) sprites; these sprites were originally intended as a reconstruction of a Nidoran or Nidorino/Nidorina protoype, and a reconstruction of the scrapped "Gyaōn", respectively

@RacieBeep - Creator of the [variant Nidorino](https://github.com/Aironfaar/pureRGB/tree/main/gfx/pokemon/front_alt/kaiju_nidorino.png), [variant Nidoking](https://github.com/Aironfaar/pureRGB/tree/main/gfx/pokemon/front_alt/kaiju_nidoking.png) and [variant Raichu](https://github.com/Aironfaar/pureRGB/tree/main/gfx/pokemon/front_alt/goro_raichu.png) sprites; these sprites were originally intended as a reconstruction of a Nidoran or Nidorino/Nidorina protoype, a reconstruction of the scrapped "Gyaōn", and a reconstruction of the scrapped "Gorochu", respectively

Of course, Vortyne's original credits are relevant to this project as well, although these are not written from my own perspective:

Jojobear13 - Tons of code snippets and help via the shinpokered romhack codebase, direct support regarding the pokemon yellow gbc enhancements porting

Danny-E 33 - Larger back sprites code snippets, EXP Bar code snippets, various support regarding game audio and questions about rgbasm/gbz80 answered

Mechanicalpen - enhanced menu icons code

LJSTAR - Most of the work creating the type icons used in the movedex

Mord - Most of the work creating LT.Surge and Erika overworld sprites

pret discord and pret in general for their original disassembly work on Red / Blue