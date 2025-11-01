# Notes for Brackey's Tutorial [How to make 3D Games in Godot](https://www.youtube.com/watch?v=ke5KpqcoiIU)

## Rough notes from this tutorial

Greyboxing - Level box out
here you use simple shapes to see if your level works and flows well before getting bogged down in the details

CSG
Constructive Solid Geometry

allows you to build levels and props by constructive your game out of simple geomtry shapes

use jolt for physics in settings

## Graphics

The 3 D's of 3D graphics
- (D) Assests
- (D) Lighting
- (D) Environment

Shaders and Effects also help for more advance graphics

### 3D Assests term

- mesh = shape/poloygons of our model
- UV Map = 2D representation of our mesh for creating graphics
- Texture = common to paint directly onto the mesh. The 3d program then the UV map to applies this texture to the mesh
- Materails = to simulate the surface properties. rough like wood or smooth like metal
- Rig = use to bend and animate. representation of the bones. Each bone is mapped to the mesh, so when the bone moves, the mesh comes with it
- Animation = animations to move the bones

Most common form of assets is the open-source `.gltf` format

## Standard Material 3D

is useful, powerful and flexiable

Here are some of the common properties:

- Albedo = base colour of the material
- Mateallic = How reflective the surafce is (1 is complatelt relactive)
- Roughness = how smooth or rough a surface. A mat with a low rouhgness value, results in sharper reflections, as the rouhgness increases the reflec
- Normal = add a normal am to simulate depth. It changes the way lghit interacts with the surface to display smaller details (Godot uses noraml maps in OPenGL style)
- Ambient Occlusion = here you can add an AO map to see how muhc lihg reaches the surface. It can darken the parts of the model that light has a hard time reaching
- Emission = does the surface emiit light

... and many more

However, most game assets dont require all or many of the different channels.
A common model is to use the ORM model, as it combines 
- Ambient **O**cclusion
- **R**oughness
- **M**eallic 
into one map, as all 3 only use one channel
Godot supports this using the `ORMMaterial3D` instead of the `StandardMaterial3D`

Some assets have the matierals packaged into the `.glb` file. Godot automatically extracts when you import the asset. However, we can then extract the graphic into it's own model if we want to further edit the colour/lght etc.

## Implementing models into the game

### Inherit

import the model and then add any scripts, etxtures, collions you want inside of the imported model

### Nest

Instead of altering and adding collisons and scripts ot the improted asset, it is bvetter to nest anssd create a new scene that we have full control.
This is the best option as we can create our own scene with the model and make changes. Then add in the model and material. If we make changes to our game and scenes, this new scene with the model inside it will be updated

### Make Local

Again, we create a new scene for this model. We import in the `.glb` file but then we right lcick and select "make local"
This adds extra flexiablity as Godot removes the reference to the imported `.glb` file so we have full control over the model. We can edit, delete and add new nodes as we wish.

However, this bloats the file size as the model is no longer neatly packaged. This can be fine for small low-poly models but it can quickly bloat the game making it harder to load.