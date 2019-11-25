// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
Shader "Custom/VertexFragment"
{
	SubShader
	{
		pass{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// #include "UnityCG.cginc"

			struct v2f {
				float4 pos: SV_POSITION;
				float4 color: COLOR0;
			};

			//use this with line 10
			// v2f vert(appdata_base v){
			// 	v2f output;
			// 	output.pos = UnityObjectToClipPos(v.vertex);
			// 	output.color = v.normal * 0.5 + 0.5;
			// 	return output;
			// }

			v2f vert(float4 v:POSITION, float3 normal:NORMAL){
				v2f output;
				output.pos = UnityObjectToClipPos(v);
				float4 c = float4(normal.x+0.5, normal.y+0.5, normal.z+0.5, 1);//create a float4 color by normal.xyz & alpha=1
				output.color = c;
				return output;
			}

			float4 frag(v2f input):COLOR{
				return input.color;
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
