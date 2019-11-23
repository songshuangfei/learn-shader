Shader "Custom/surfaceColor"
{
    Properties
    {
        _SurfaceColor("surface color", COLOR) = (0,0,0,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        //c for program code
        CGPROGRAM 
        //define the entry function
        #pragma surface surt Lambert 
        struct Input {
            //at least one menber
            float4 color: COLOR; //bind color 
        };
        half3 _SurfaceColor;
        //IN:input surface data, o:output surface data
        void surt(Input IN, inout SurfaceOutput o){
            o.Albedo = _SurfaceColor;
        }
        ENDCG
    }
    Fallback "Diffuse"
}
