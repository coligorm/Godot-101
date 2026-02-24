# Notes from Blackjack Tutorial from Lukky [Making a Game from Start to Finish (Tutorial)](https://www.youtube.com/watch?v=bP9zQyoYP28&list=PLrT2fbyJrAIctd7zNUsdPakIllX2lhrzo&index=2)

Following Godot University found [here](https://github.com/coligorm/Godot-101#intro-to-game-development)

## Preface

The video for this tutorial is very bare bones. It is basically a speedrun of Lukky making a simple blackjack game in Godot. There is no hand holding here. So, I am playing the video, pausing, and trying to figure out what he is doing myself.

It has been awhile since I have done Brackey's Godot video, and I havent used Godot since the Gamejam in November, so I am rusty. Lukky is not explaining much in the video, instead he is making a simple game and I am trying to follow along. I feel this will be good for me. It will be slower than your typical "tutorial" which features a lot of hand-holding and explaining. I don't need that right now. 

> I need more exposure to game dev and the Godot environment.

## Day 1 (2hrs):

### Getting and Handling Assets

- [Sketchfab](https://sketchfab.com/) for many free 3D assets
	- Download as `.glb` files for Godot
	- In **Blender**, import `.glb` to open (the files do not appear when you try to open regularly from Blender)
	- You can save individual **objects**, if the blender asset downloaded contains multiple obejcts. *ex: the poker chips asset had all chip colours and mulitple stacks of chips to create a pocker scene, however, I wanted the chips saved seperately so I can use them individually as scenes in my Godot project*
	- And export when finished (make sure **Include** is set to **Selected Objects** to save each object individually)

### Setting the Scene

- **Made seperate scenes for each poker chip asset.** <br>I remembered this from Brackey's 3d game tutorial. Godot likes to use things as scenes. So instead of using the `.glb` file directly from my assets folder (which Godot turns into a scene anyway), I created a new directory for scenes>models and stored the chips there as scenes. This keeps things neat and easy to find each chip when needed, rather than searching through all the assets.
- I like this way of working. Get assets sorted. Set up project. Create scenes for each asset. Then start the process. It means that I can just look within my scenes folder for eveything I need.
- When importing in the assets as scenes. I went for the **nested** approach.
    - Created the scenes for each `.glb` asset
    - Naming convention as `chip_<colour>`, to group together models
    - Centered to `(0,0,0)`, so that when added into the main scene, they will be position correctly
        - > Some of the chips were not exported from blender at `(0,0,0)`, so spending the extra couple on minutes is worth the bother in the long run
    - Some chips did not extract their child nodes. To fix this, select the root node and click **Editable Children**

Not much actual development, but I am very bad at starting, so this is progress. With time, I will be quicker at getting projects initlaised better and quicker

## Day 2 (2hrs):

### Menus

- Created a main menu with poker chips on a table.
- Attached a simple script to the chips to rotate them:
    ```
    @export var turn_speed = 4;

    func _process(delta: float) -> void:
    	rotation.y += deg_to_rad(turn_speed) * delta;
    ```
- Added a control node for the UI Menu
    - A `VBoxContainer` node with a series of `Button` nodes: New Game, Continue, About, Settings and Exit
- Added the `pressed()` signal to each menu button
- `get_tree().quit()` to exit the game
- Added About and Settings Menu
- Settings has Sound and Fullscreen
    - Sound settings are buttons that do nothing (there is no sound in the game to turn on/off)
    - Fullscreen:
        ```
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
        ```

In previous game dev projects, i neglected any UI and got straight into the development, so this was not my usual approach.
I am not very familar with the `Control` Nodes and how to set them up with buttons and signals so this was good practise

> *Note*: I have to fix the allignment of the boxes and texts. They look fine on the windowed view of the screen but not the fullscreen view

## Day 3 (2hrs):

### Cards

- It took me 2 hours to get one single card created as a scene...
- Most of the time was spent scouring the reddit, youtube and godot forms for answers on how to make a 3D card with no hope... this [video](https://www.youtube.com/watch?v=lnQMKkN-4Ys) gave me some hope. It was more indept on waht i needed but i managed to firgure it out, steps below
- It is still slightly blurry and not at the resolution that I got from Kenny's Assets...
- But i have a card...

#### Process

- Node3D with two child `MeshInstance3D` nodes, one for the front and one for the back
- Attach a `QuadMesh` and change size to `x=1, y=1.6` for a playing-card ratio
- Created a new `StandardMaterial3D` for the material
	- Set the `Albedo` texture to the `card.png` and turn on **Texture Force** (This sharpened the image colour)
	- Set `Transparency` to `Alpha`
- Still in the **Inspector** tab, under **Node3D**, Transform the x-rotation (front 90-degrees, back -90-degrees)

> *TODO:* I have to figure out a way for a script to generate each card based on the pngs inside the assets/cards folder instead of manually doing each card as a scene 
