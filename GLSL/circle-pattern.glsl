void mainImage (out vec4 fragColor, in vec2 fragCoord)
{

vec2 uv = fragCoord/iResolution.x; //normalise
//vec2 uv = (fragCoord-.5)/iResolution.y;  // normalise variant

vec3 col = vec3(.7,.75,.7);
float unghi =.78;
float s = sin(unghi);
float c = cos(unghi);
uv *= mat2(c, -s, s, c);
uv *= 15.;
vec2 gv = fract(uv)-.5;  // grid
float cerc = 0.0;
float t = iTime;
vec2 id = floor(uv);



//loops (circle size influencing neighbours)
for (float y=-1.; y<=1.; y++) {
    for (float x=-1.; x<=1.; x++) { 
         
         vec2 ofst = vec2 (x,y);
         
         float d = length(gv-ofst); 
         float d2 =length(id+ofst)*.3;
         
         float r = mix(.6 , 1.55, sin(d2-t)*.5+.5);
         cerc += smoothstep (r,r*0.9,d);
    
    };
        }

//Draw screen
//col.rg = gv;  
col += mod (cerc, 3.9);

fragColor = vec4(col,1.0);


}