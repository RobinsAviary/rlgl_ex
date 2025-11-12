package rlgl_ex

import rlgl "vendor:raylib/rlgl"
import rl "vendor:raylib"

// Define one vertex (color)
ColorRL :: proc(color: rl.Color) {
	rlgl.Color4ub(color.r, color.g, color.b, color.a)
}

// Define one vertex (color) - 3 byte
Color3ub :: proc(r, g, b: u8) {
	rlgl.Color4ub(r, g, b, 255)
}

// Define one vertex (position) - 2 f32
Vertex2fVector2 :: proc(vector: rl.Vector2) {
	rlgl.Vertex2f(vector.x, vector.y)
}

// Define one vertex (texture coordinate) - 2 f32
TexCoord2fVector2 :: proc(vector: rl.Vector2) {
	rlgl.TexCoord2f(vector.x, vector.y)
}

// Define one vertex (position) - 3 f32
Vertex3fVector3 :: proc(vector: rl.Vector3) {
	rlgl.Vertex3f(vector.x, vector.y, vector.z)
}

// Multiply the current matrix by a translation matrix
TranslatefVector3 :: proc(vector: rl.Vector3) {
	rlgl.Translatef(vector.x, vector.y, vector.z)
}
// Multiply the current matrix by a rotation matrix     
RotatefVector3 :: proc(angleDeg: f32, vector: rl.Vector3) {
	rlgl.Rotatef(angleDeg, vector.x, vector.y, vector.z)
}
// Multiply the current matrix by a scaling matrix
ScalefVector3 :: proc(vector: rl.Vector3) {
	rlgl.Scalef(vector.x, vector.y, vector.z)
}

// Define one vertex (normal) - 3 f32
Normal3fVector3 :: proc(vector: rl.Vector3) {
	rlgl.Normal3f(vector.x, vector.y, vector.z)
}

// Clear color buffer with color
ClearColorRL :: proc(color: rl.Color) {
	rlgl.ClearColor(color.r, color.g, color.b, color.a)
}