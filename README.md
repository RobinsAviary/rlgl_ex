# rlgl_ex

[rlgl](https://github.com/odin-lang/Odin/tree/master/vendor/raylib/rlgl) extension for Odin 

This library leverages `rlgl` and `raylib` in order to make advanced graphics rendering simpler.

It also contains various functions deemed too excessive to be included with base `rlgl`, and an enum to make interfacing with `Begin()` read better, that was rejected from the base vendor library.

It is intended to be used alongside `vendor:raylib/rlgl`.

## Docs

Define one vertex (color)

`ColorRL :: proc(color: rl.Color)`

Define one vertex (color) - 3 byte

`Color3ub :: proc(r, g, b: u8)`

Define one vertex (position) - 2 f32

`Vertex2fVector2 :: proc(vector: rl.Vector2)`

Define one vertex (texture coordinate) - 2 f32

`TexCoord2fVector2 :: proc(vector: rl.Vector2)`

Define one vertex (position) - 3 f32

`Vertex3fVector3 :: proc(vector: rl.Vector3)`

Multiply the current matrix by a translation matrix

`TranslatefVector3 :: proc(vector: rl.Vector3)`

Multiply the current matrix by a rotation matrix

`RotatefVector3 :: proc(angleDeg: f32, vector: rl.Vector3)`

Multiply the current matrix by a scaling matrix

`ScalefVector3 :: proc(vector: rl.Vector3)`

Define one vertex (normal) - 3 f32

`Normal3fVector3 :: proc(vector: rl.Vector3)`

Clear color buffer with color

`ClearColorRL :: proc(color: rl.Color)`

`DrawTriangleColor :: proc(points: [3]rl.Vector2, colors: [3]rl.Color)`

`DrawRectangleColor :: proc(points: [4]rl.Vector2, colors: [4]rl.Color)`

`DrawRectangleColorEx :: proc(rectangle: rl.Rectangle, colors: [4]rl.Color)`

`DrawLineColor :: proc(points: [2]rl.Vector2, colors: [2]rl.Color)`
