//author: vvvlad
//whatis: shadertoy / texture.source
//lang : GLSL


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;


float c = cos (uv.y*4.0+iTime)+(uv.x*.3);
vec2 gv = fract(uv)-.5;  // grid

uv *= mat2(.501, -.501, .707, .501);
uv *= 55.;

float unghi =.78;
float t = iTime;
float cerc =.0;
vec2 id = floor (uv);
float s = sin(unghi);

for (float y=-1.; y<=1.; y++){
for (float x=-1.; x<=1.; x++) {


 
         vec2 ofst = vec2 (x,y);
         
         float d = length(gv-ofst); 
         float d2 =length(cerc+id)*3.3;
         
         float r = mix(.6 , 0.5, sin(d2-t)*.5);
       cerc += smoothstep (r,r*1.9,d);


};
    
};

float o = mix (cerc, s, c);

    vec3 col = vec3(c,o,0.2);
    col += smoothstep (o,t-0.9,o);
    col.bg = gv;
    col += mod(cerc,-.9);
  
 //  col.gb =gv;







    fragColor = vec4(col,1.0);
}