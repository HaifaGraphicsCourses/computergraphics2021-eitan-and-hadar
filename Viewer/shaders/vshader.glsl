#version 330




layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 texCoords;


//



// The model/view/projection matrices
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;



// These outputs will be available in the fragment shader as inputs
out vec3 fragPos;
out vec3 fragNormal;
out vec2 fragTexCoords;
out vec3 fragLightPos;
out vec3 fragCameraPos;
out vec3 textureDir;


void main()
{
	
	fragPos = vec3(model * vec4(pos, 1.0f));
	fragNormal = mat3(model) * normal;

	textureDir = pos;
	fragTexCoords = texCoords;

	gl_Position = projection * view *  model * vec4(pos, 1.0f);
}