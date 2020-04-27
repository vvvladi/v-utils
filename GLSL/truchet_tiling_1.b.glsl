float Noiz(vec2 p){                           //Random (+time)
    p = fract(p*vec2(213.20701, 582.109));
    p += dot(p, p+40.0);
    return fract (p.x*p.y)
;}


void mainImage( out vec4 fragColor, in vec2 fragCoord )


{
        vec2 uv = (fragCoord-.5*iResolution.xy)/iResolution.xy;





    vec3 col = vec3(.5, .7, .7);
uv *=8.;
vec2 gv = fract(uv)-.5;

float grosso = .1;
vec2 id = floor(uv);
float n = Noiz(id);


if (n<.5) gv.x *= -1. ;  //flip flip

 //  mix(-0.5, 0.5, step(0., gv.x+gv.y));   // step(0., gv.x+gv.y);
vec2 cUv = (gv-sign(gv.x+gv.y+.0001)*.5);
float unghi = atan(cUv.x,cUv.y);



float dist = abs(abs(gv.x+gv.y)-.5);
dist = length (cUv) -.5;
float mask = smoothstep(.01, -.01 ,abs(dist)-grosso);


//col -= unghi;
col += sin (iTime+unghi*10.)* mask;
//if (gv.x >.49 || gv.y>.49) col=vec3(1.0, .0, .0);  // guide grid
   






    fragColor = vec4(col,1.0);
}