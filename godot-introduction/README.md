# Notes for Zenva Godot 101 course

[link](https://academy.zenva.com/course/godot-4-101-game-engine-foundations/)

node is building block of game, what everything is made up of (player, terrain, weapon etc)
screnese are collection of nodes (think of a level, player, end goal, doorway etc)
scenes can work as nodes

we can create a scene of nodes just for the player
then we can reuse this scene that encapulates all the player nodes

every scene as a root node

blue nodes = 2d
red nodes = 3d
green = ui
white/other = use whereever

you can scenes inside scenes

if we want to edit all coins in our level, we can set the coin node up as a scene and then edit the coin scene and change all coin nodes within our main scene


## useful hotkeys
- Q = select tool
- W = move tool
- E = Rotate tool
- R = Scale tool
- Ctrl + D = Duplicate node
- Ctrl + N = New scene
- Ctrl + A = New child node


## Parenting
create a child node of a node
now when we move the parent node, the child node will now move, scale, rotate with the parent
this realtionship is very important in game dev
the primary benefit of creating a parent-child relationship between nodes is to allow child nodes to inherit properties like position, rotation, and scale from the parent

## GD Script

### Variables

```
var score : int = 0
var move_speed : float = 2.5
var game_over : bool = false
var ability : String = "slash"
```

### Functions

private functions start with underscore
public dont
use lowercase snakecase

func is the keyword for functions
```
func _process(detla):
	pass
```

is the function that is called every frame

```
func _ready():
	pass
```
is called when the node is first created

It's good practise to statically type variables and functions
example of stating the types when creating a function
```
func _has_won(score : int) -> bool:
	if score >= 100:
		return true
	else:
		return false
```

Here, the function `_has_won` takes in type `int` and returns type `bool`


### Vectors

are used for the position of our sprites etc.
vector3 is for 3d
vector2 is for 2d

we can create a custom move script for our spirte and access their postion vector to move them.
If we do this inside the `_process` function then we can move them every frame
ex:
```
var speed : float = 100.0

func _process(delta: float) -> void:
	var direction = Vector2(1, 1)
	position += direction * delta * speed
```
_note:_ that we multiplied by `delta` this is the framerate so that the sprite will move at the same speed if you are running at 30fps and 60fps
