package rlgl_ex

import rlgl "vendor:raylib/rlgl"
import rl "vendor:raylib"
import "core:c"

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

DrawTriangleColor :: proc(points: [3]rl.Vector2, colors: [3]rl.Color, uv: [3]rl.Vector2 = {}, texture: rl.Texture = {}) {
	Begin(.TRIANGLES)

	if rl.IsTextureValid(texture) {
		rlgl.SetTexture(texture.id)
	}

	for i := 0; i < len(points); i += 1 {
		ColorRL(colors[i])
		if len(uv) >= 3 {
			TexCoord2fVector2(uv[i])
		}

		Vertex2fVector2(points[i])
	}

	rlgl.End()
}

DrawRectangleColor :: proc(points: [4]rl.Vector2, colors: [4]rl.Color) {
	Begin(.QUADS)

	indices: []uint = {0, 1, 3, 2}

	for i := 0; i < len(points); i += 1 {
		ColorRL(colors[i])
		Vertex2fVector2(points[indices[i]])
	}

	rlgl.End()
}

DrawRectangleColorEx :: proc(rectangle: rl.Rectangle, colors: [4]rl.Color) {
	DrawRectangleColor({rectangle.x, rectangle.y, rectangle.x + rectangle.width, rectangle.y + rectangle.height}, colors)
}

DrawLineColor :: proc(points: [2]rl.Vector2, colors: [2]rl.Color) {
	Begin(.LINES)

	for color, i in colors {
		ColorRL(color)
		Vertex2fVector2(points[i])
	}

	rlgl.End()
}

DrawTriangleStrip :: proc(points: []rl.Vector2, color: rl.Color) {
	rl.DrawTriangleStrip(raw_data(points), c.int(len(points)), color)
}

DrawTriangleFan :: proc(points: []rl.Vector2, color: rl.Color) {
	rl.DrawTriangleFan(raw_data(points), c.int(len(points)), color)
}

@(private)
ColorPoint :: proc(color: rl.Color, point: rl.Vector2) {
	ColorRL(color);
    Vertex2fVector2(point);
}

DrawTriangleStripEx :: proc(points: []rl.Vector2, colors: []rl.Color) {
	if len(points) >= 3 {
		Begin(.TRIANGLES)

            for i := 2; i < len(points); i += 1 {
                if i%2 == 0
                {
					ColorPoint(colors[i], points[i])
					ColorPoint(colors[i - 2], points[i - 2])
					ColorPoint(colors[i - 1], points[i - 1])
                }
                else
                {
					ColorPoint(colors[i], points[i])
					ColorPoint(colors[i - 1], points[i - 1])
					ColorPoint(colors[i - 2], points[i - 2])
                }
            }
		
		rlgl.End()
    }
}

// Primitive assembly draw modes
PrimitiveDrawMode :: enum c.int {
	LINES = 0x0001,     // GL_LINES
	TRIANGLES = 0x0004, // GL_TRIANGLES
	QUADS = 0x0007,     // GL_QUADS
}

Begin :: proc(mode: PrimitiveDrawMode) {
	rlgl.Begin(c.int(mode))
}

End :: proc() {
	rlgl.End()
}