I want to have a system that drains sanity.
I plan to have sanity drain if the player is in darkness for too long.

For Light Detection, I am learning from [this Youtube Video by GameDev Compass](https://www.youtube.com/watch?v=3Z8hTdD79To)


# Notes:

## Preference

The author based the light detection of the original Thief Games and TheDarkMod, as he is programming light detection for stealth purposes.

Thief uses baked static lighting and checks the brightness of the light map texture of the floor beneath the player. However, this doenst work if no light map textures are used and all lighting is dynamic.

For TheDarkMod, it used fully dynamic lighting. In order for this to work, the game uses a seperate camera that captures am image of an octahedron at the player's position from above and below and calcualtes the brightness levels of the player.
This means no matter how the light changes, it will capture the brightness of player as it matches what the player sees and uses the same rendering pipeline.
This can be more performance taxing as you are rendering multiple camera views.

A third approach, is using raycasts from the light souce to detect if the light reaches the player. It can make it more difficult to match the brightness levels of in-game.

In this tutorial, the author is going o recreate a similiar approach to the one in TheDarkMod.

> For myself, since I want light detection for sanity and not stealth, I may try recreate a more simplified approach.

## Light Detection

### Node Setup

Inside the player node, there is a `SubViewport` Node, inside that node again is a `Node3D` containing the light detection - which is a camera and what ever meshes you want to detect light (simple square under player checking the floor, or the octahedron approach for more complex light detection).

### Logic

Inside the player script's process function contains the main light detection logic, so it is checked every frame.

- First update the light detection `Node3D` to match the player's position.
- Get viewport texture: `sub_viewport.get_texture`
- Display texture on `texture.rect`
- Calculate the average colour of the viewport texture by:
    - changing the texture to an image
    - `image.resize` to a 1 x 1 pixel
    - get the colour of the pixel
- Apply this colour to the `colour.rect` and `get_luminance()` value
- The other final thing is to have the `sub_viewport` render light in debug mode using: `sub_viewport.debug_draw = 2` in the `_ready` function

### Optimise 

- You can have the light check periodically using a `Timer` Node instead of every frame
- You can interpolate the periodic results over time to have a smooth animation in your light level meter.
- You can lower the resolution and quality settings of the `sub_viewport`
