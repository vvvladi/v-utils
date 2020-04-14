void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Time varying pixel color
    
    uv -=.5; // center
    float d = length(uv);
    float c = (d*5.0)-2.0;
    vec3 col = (0.5 + 0.5*sin(iTime+uv.xyx+vec3(c)*5.0));
    // Output to screen
    fragColor = vec4(vec3(col),1.0);
}