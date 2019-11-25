Shader "Custom/surfaceColor"
{
  Properties
  {
    _SurfaceColor("diffuse color", COLOR) = (0,0,0,1)
    _NormalMap("normal map", 2D) = "bump"{}
  }
  SubShader
  {
    Tags { "RenderType"="Opaque" }
    CGPROGRAM 
    //define the entry function
    #pragma surface surt Lambert 
    struct Input {
      float4 color: COLOR; //bind color 
      float2 uv_NormalMap;
    };

    half3 _SurfaceColor;
    sampler2D _NormalMap;
    void surt(Input IN, inout SurfaceOutput o){
      o.Albedo = _SurfaceColor;
      o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
    }
    ENDCG
  }
  Fallback "Diffuse"
}
