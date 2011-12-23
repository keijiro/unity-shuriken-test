Shader "Custom/ScreenBlurAcc" {
	Properties {
		_MainTex ("Screen", 2D) = "white" {}
	}
	SubShader {
        Pass {
            ZTest Off
            ZWrite Off
            ColorMask RGB
			SetTexture [_MainTex] {
                constantColor (0, 0, 0, 0.12)
                combine texture * constant alpha
            }
			SetTexture [_MainTex] {
                constantColor (0, 0, 0, 0.12)
                combine texture * constant alpha + previous
            }
			SetTexture [_MainTex] {
                constantColor (0, 0, 0, 0.12)
                combine texture * constant alpha + previous
            }
			SetTexture [_MainTex] {
                constantColor (0, 0, 0, 0.12)
                combine texture * constant alpha + previous
            }
        }
	} 
}
