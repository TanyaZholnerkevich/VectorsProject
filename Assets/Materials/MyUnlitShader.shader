Shader "Unlit/MyUnlitShader"
{
    Properties
    {
        _Color ("MyColor", Color) = (1, 1, 1, 1)
        _Vector ("Vector", Vector) = (0, 0, 0, 0)
    }
    SubShader
    {
        Pass
        {
            Cull Front
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex: SV_POSITION;
                float4 color: COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }
    }
}
