float HexDist (vec2 p) 
{
    p = abs(p);
float c =dot(p, normalize (vec2(1,1.73)));

c = max(c, p.x);
return c;
}



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 uv = (fragCoord-.5*iResolution.xy)/iResolution.y;

 
    vec3 col =vec3 (0);
// col += step (HexDist(uv),0.2);
col += sin (HexDist(uv)*10.0+iTime);

    fragColor = vec4(col,1.0);
}