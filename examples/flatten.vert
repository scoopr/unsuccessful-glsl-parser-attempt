uniform float time;

void main(void)
{
	vec4 v = vec4(gl_Vertex);
	
	v.z = sin(5.0*v.x+time)*0.5;
	
	gl_Position = gl_ModelViewProjectionMatrix * v;
} 
