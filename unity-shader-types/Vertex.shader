Shader "Custom/Vertex"
{
  Properties
  {
    _MainTex("main texture", 2D) = "white"{}
    _Amount("scale amount", Range(-1,1)) = 0
  }
  SubShader
  {
    Tags { "RenderType"="Opaque" }
    CGPROGRAM
    #pragma surface surt Lambert
    #pragma vertex vert

    struct Input {
      float2 uv_MainTex;
    };

    sampler2D _MainTex;
    float _Amount;
    void surt(Input IN, inout SurfaceOutput o){
      o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
    }
    void vert(inout appdata_full v){
      v.vertex.xyz += v.normal * _Amount; //vector computing
    }
    ENDCG
  }
  FallBack "Diffuse"
}
