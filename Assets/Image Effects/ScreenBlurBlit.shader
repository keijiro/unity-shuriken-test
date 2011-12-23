Shader "Custom/ScreenBlurBlit" {
	Properties {
		_MainTex ("Screen", 2D) = "white" {}
	}
	SubShader {
        Pass {
            ZTest Off
            ZWrite Off
            Blend SrcAlpha One
            ColorMask RGB
			SetTexture [_MainTex] {
                constantColor (1, 1, 1, 0.52)
                combine texture, constant
            }
        }
	} 
}
