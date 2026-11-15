# raumeinrichtung

Room model of the flat's living/bedroom plus three furniture layout variants, built in FreeCAD 1.1.

- `raum.FCStd` — the model: room template, the current arrangement, and three layouts.
- `raum.20261115-010959.FCBak` — FreeCAD's automatic backup from the last save.

The document was saved on 2026-11-15 01:20 with 70 objects. Everything below was read from
that file, not assumed.

## Coordinate system

Origin at the inner south-west corner. X points east, Y north, Z up, all in centimetres.
Interior bounds: x 0–485, y 0–447.25, z 0–291.

## Room (fixed geometry, `RoomTemplate`, 23 objects)

| Element | Position |
|---|---|
| North wall inner face | y = 447.2 |
| South wall inner face | y = 0 |
| West wall inner face | x = 0 |
| East wall inner face | x = 485 |
| Room height | 291 |
| Window opening (west wall) | y 145–315 (170 wide), z 71–246 (175 tall) |
| Window frame / glass | frame x −8..−2, glass x −5..−4 |
| Window sill | y 137.5–322.5 (185 wide), x −40..3, z 67–71 |
| Radiator | x 0–10, y 160–300 (140 wide), z 0–66, top at sill height |
| Chimney (defunct) | x 477–485, y 0–61, full height |
| Door opening (east wall) | y 340.8–435.8 (95 wide), z 0–198 |
| Door frame | 1.5 cm deep jambs at y 329.8–340.8 and 435.8–446.8, lintel z 198–209 |
| Door leaf | x 481–485, closed, flush with the wall face |
| Door swing | quarter disc, radius 95, hinge at (485, 435.75) |
| Skirting | 6 high × 2 deep, all walls except the door gap, wrapped around the chimney |

Input measurements: room 485 (north) × 446.5 (east) / 448 (west) → the model uses 485 × 447.25;
height 291; door 95 wide, 198 high, hinges 11.5 cm from the north corner, opens inward, frame
11 cm with 1.5 cm inset; chimney 61 × 8; window 170 × 175, bottom-left 145 cm from the south at
71 cm height; radiator 140 wide, 10 deep; sill 185 wide, 3 cm into the room.

## Furniture (input dimensions, W × D × H)

| Piece | Dimensions | Notes |
|---|---|---|
| Bed | 205 × 145.5 × 71 | may ignore the skirting |
| HOPEN wardrobe | 202 × 61 × 235 | on a stand, may ignore the skirting |
| Ivar shelving | 178.5 × 30 × 230 | open shelf, needs a wall or fixing |
| Chesterfield couch | 198 × 75 | height not measured, 75 assumed |
| Chesterfield armchair | 69 × 75 | height not measured, 75 assumed |
| Workdesk | 100 × 60 × 75 | open underside in reality |
| Office chair | ≈60 × 60 | height not measured, 90 assumed; movable object |
| White bookshelf | 94 × 32.5 × 180 | |
| Drawer cabinet | 36.5 × 58.5 × 70 | |
| Clothes horse | 175 × 60 | only in `CurrentRoom` |
| Tinker surface | 110 × 55 | potential work surface, modelled as a plain box |
| Pane (custom, black wood) | A: 8 × 84.5 × 90 · C: 9 × 144.5 × 71 | bedside console, drinks and USB outlet |

The dimensions in this table are absolute constraints. Do not adjust them to make a placement fit.

## Document structure

| Group | Members | Visible |
|---|---|---|
| `RoomTemplate` | 23 (walls, window, radiator, chimney, door, skirting, floor) | yes |
| `CurrentRoom` | 10 (the room as it is today, frozen) | no |
| `Layout_A` | 11 (includes `Pane`, `Ivar`) | no |
| `Layout_B` | 10 (no pane) | no |
| `Layout_C` | 11 (includes `Pane`) | yes |

Object naming: `Layout_<X>_<Piece>`. Shapes: `Part::Box` for rectangular pieces, `Part::Feature`
for the fused chesterfield and office-chair shapes.

`CurrentRoom` arrangement: bed x 0–205 / y 301.8–447.2 (headboard west), couch x 0–75 /
y 103.8–301.8 along the west wall, HOPEN x 275–477 / y 0–61, desk x 175–275 / y 0–60, drawer
x 138.5–175 / y 0–58.5, bookshelf x 0–32.5 / y 0–94, Ivar x 205–383.5 / y 417.2–447.2,
armchair x 130–205 / y 210–279, office chair x 149.7–205.5 / y 60.8–119.2, clothes horse
x 397.8–450.2 / y 73.8–251.2.

`CurrentRoom` still carries the first-pass shapes: couch and armchair 79 cm high, office chair
100 cm. The layouts use the assumed heights of 75 and 90 cm.

## Layout A

Manually arranged. Rendered hidden.

| Piece | x | y | note |
|---|---|---|---|
| Bed | 272–477 | 0–145.5 | long side south wall, short side east |
| Pane | 477–485 | 61–145.5 | h 90, between bed and east wall, above the chimney |
| HOPEN | 280.5–482.5 | 146–207 | 0.5 cm off the bed, doors must face north |
| Couch | 4.5–202.5 | 369.2–444.2 | north wall, back to the wall, faces south |
| Armchair | rotated 60°, pos (81.4, 249.8) | bbox 25.1–118.9 / 251.8–349.2 | faces the couch, 19.9 cm from it |
| Bookshelf | 176–270 | 1.5–34 | south wall, 2 cm off the bed |
| Desk | 140.5–240.5 | 153–213 | mid-room |
| Office chair | rotated 180°, pos (200, 157.5) | bbox 171.5–224 / 130.2–184.8 | tucked at the desk, seated from the south |
| Drawer cabinet | 241–277.5 | 153–211.5 | 0.5 cm from the desk, 3 cm from the wardrobe |
| Tinker | 5.5–60.5 | 5.5–115.5 | rotated 270°, along the west wall |
| Ivar | 206–384.5 | 414.5–444.5 | north wall |

Free floor at the bed foot: x 60.5–272 × y 34–153, i.e. 211.5 × 119 cm. The bed's west face is
111.5 cm clear (the bookshelf takes the first 34 cm). Bed access is from the foot only: south
wall on one long side, wardrobe 0.5 cm from the other.

## Layout B

Script-generated, never adjusted by hand. Couch stands against the bed's west face facing west;
desk in the south-east corner; HOPEN and Ivar line the north wall.

| Piece | x | y |
|---|---|---|
| HOPEN | 0–202 | 386–447.2 |
| Ivar | 205–383.5 | 417–447.2 |
| Bed | 272–477 | 0–145.5 |
| Couch | 195–270 | 0–198 |
| Armchair | 115–190 | 60–129 |
| Drawer cabinet | 115–151.5 | 140–198.5 |
| Bookshelf | 0–32.5 | 0–94 |
| Tinker | 82–192 | 0–55 |
| Desk | 425–485 | 240–340 |
| Office chair | pos (393, 285) | 369–421.5 / 257.7–312.3 |

## Layout C

Manually arranged. Currently visible.

| Piece | x | y | note |
|---|---|---|---|
| Bed | 330.5–476 | 0.5–205.5 | long side parallel to the east wall |
| Pane | 476–485 | 61–205.5 | h 71, flush with the mattress |
| HOPEN | 282–484 | 206.5–267.5 | 1 cm from the bed's north end |
| Ivar | 196.5–375 | 417–447.2 | north wall |
| Bookshelf | 151.5–184 | 350.5–444.5 | free-standing, 2.75 cm off the north wall |
| Desk | 7–107 | 382.5–442.5 | north-west corner |
| Office chair | rotated 165°, pos (58.1, 378.3) | bbox 28.7–87.5 / 348.9–407.7 | tucked at the desk |
| Drawer cabinet | 109–145.5 | 384–442.5 | |
| Couch | 121–319 | 4.5–79.5 | south wall, faces north |
| Armchair | rotated 60°, pos (153.4, 223.7) | bbox 156.9–250.6 / 158.8–256.2 | free-standing, 79.3 cm from the couch |
| Tinker | 7.8–117.8 | 2.3–57.5 | rotated 270°, south-west corner |

Bed access: the west long side is open over y 79.5–205.5 (126 cm), reached through a 79.3 cm band
that runs the room's width. The bed's south end is 0.5 cm off the south wall, the north end 1 cm
off the wardrobe.

## Measured clearances

Solid-to-solid distances (`Shape.distToShape`), not bounding-box projections.

| Pair | Layout A | Layout C |
|---|---|---|
| Armchair ↔ desk | 72.5 | 160.7 |
| Armchair ↔ drawer cabinet | 157.4 | 143.0 |
| Armchair ↔ bed | 217.6 | 79.8 |
| Armchair ↔ HOPEN | 193.8 | 34.0 |
| Armchair ↔ couch | 19.9 | 79.3 |
| Desk ↔ bed | 32.4 | 285.1 |
| HOPEN ↔ bed | 0.5 | 1.0 |
| Couch ↔ bed | 234.3 | 11.5 |
| Couch ↔ tinker | 253.7 | 3.2 |
| Bookshelf ↔ bed | 2.0 | 206.1 |
| Bookshelf ↔ Ivar | 380.5 | 12.5 |
| Bookshelf ↔ desk | 119.0 | 44.5 |
| Office chair ↔ bed | 48.0 | 292.9 |

Sun geometry: the window occupies y 145–315. In both A and C the couch lies outside that band
(A: y 369–444, C: y 4.5–79.5); the armchair is the piece inside it.

## Checks in use

Only measured constraints, no invented clearance zones:

- piece dimensions against the input table;
- all pieces inside the room bounds;
- chimney footprint not intersected;
- door swing disc (radius 95 from the measured hinge) respected;
- pairwise overlap, with the desk/office-chair pair exempt as an intentional tuck;
- bed not in the west/sun bay (x ≥ 100).

Earlier "radiator zone", "window bay" and "doorway front" rules were dropped: they were invented
limits, not measurements, and they flagged legal placements.

## Working notes

- The layouts were arranged by hand in the GUI. A rebuild script that regenerates all pieces from
  stored coordinates overwrote Layout A's manual arrangement once. Do not run bulk rebuilds; read
  the current positions first and move only the named object.
- `Floor` migrated into `Layout_B` with visibility off once and disappeared from the view. It was
  restored to `RoomTemplate`. If the floor is missing, check group membership first.
- The build scripts are not part of the repository.
- Backups: `raum.20261115-010959.FCBak` is the only `.FCBak` in the collection and it is staged in
  git. FreeCAD writes a new timestamped backup on every save, so tracking them means one new file
  per save. The root README puts backups outside the repo.

## Open points

- Choice between Layout A and Layout C is undecided. A gives the largest contiguous free floor
  (211.5 × 119 cm at the bed foot) and the widest wardrobe approach, but the bed is reachable only
  from its foot and the armchair blocks 94 cm of the couch front. C gives normal side access to the
  bed and an open north hall, at the cost of several 1–12 cm dead slots between pieces and two
  pieces standing free in the floor.
- In both layouts one face of the HOPEN is 0.5–1 cm from the bed, so its doors can only face away
  from the bed. Whether that matches the real door side is unverified.
- Layout C's bookshelf stands free 2.75 cm off the north wall and needs wall fixing.
- All three layouts place the office chair at the desk; it is movable and was excluded from the
  free-floor calculations.
