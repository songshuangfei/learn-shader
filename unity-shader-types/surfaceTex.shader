Shader "Custom/surfaceTex"
{
    Properties
    {
      _MainTex("main texture", 2D) = "white" {}
      _BumpMap("bump map", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM 
        #pragma surface surt Lambert 
        
        struct Input {
            float2 uv_MainTex; //uv for main texture 
            float2 uv_BumpMap;// uv for normal map
        };

        sampler2D _MainTex;
        sampler2D _BumpMap;
        half3 _SurfaceColor;
        void surt(Input IN, inout SurfaceOutput o){
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;//set diffuse texture
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));// set normal map
        }
        ENDCG
    }
    Fallback "Diffuse"
}
