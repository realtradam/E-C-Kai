# E-C-Kai

A neato platformer that is WIP

## Game Design Document

Here we should write ideas and stuff we want to implement. Should add some drawings, pictures, and stuff. This will help when working on this project asyncroniously to kinda code in the same direction.  
This document isnt supposed to be a strict thing to follow but instead something that evolves overtime as we get new ideas and change old ones.

---

### Puzzle Platformer

Solve puzzles using common mechanics of platforming
- collecting keys
- pressing buttons
- dodging enemies

Player controls:
- Left/right walking and jumping
- pick up and use

### Player Life History

A players characters life is recorded from start to end. When they die and then restart the level, their previous life is replayed as a ghost. However this ghost can still interact with the game world(i.e pressing buttons, pushing objects, etc) Player use this to solve puzzles

Potential Ideas for Implementation:
    
    1. A limit on how many ghosts can exist at once, when the limit is reached the oldest ghosts stops existing
    2. Progression increases how many ghosts appear at once
