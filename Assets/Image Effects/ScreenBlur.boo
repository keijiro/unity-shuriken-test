import UnityEngine

class ScreenBlur(MonoBehaviour): 

    public _accShader as Shader
    public _blitShader as Shader
    
    _accMaterial as Material
    _blitMaterial as Material

    _accBuffer0 as RenderTexture
    _accBuffer1 as RenderTexture
    _oddEven as bool

    def Start():
        _accMaterial = Material(_accShader)
        _blitMaterial = Material(_blitShader)
        _accBuffer0 = RenderTexture(Screen.width, Screen.height, 0)
        _accBuffer1 = RenderTexture(Screen.width, Screen.height, 0)

    def OnDestroy():
        Destroy(_accMaterial)
        Destroy(_blitMaterial)
        Destroy(_accBuffer0)
        Destroy(_accBuffer1)
    
    def OnRenderImage(src as RenderTexture, dst as RenderTexture):
        if _oddEven:
            blur, prev = _accBuffer0, _accBuffer1
        else:
            blur, prev = _accBuffer1, _accBuffer0

        _oddEven = not _oddEven

        Graphics.BlitMultiTap(prev, blur, _accMaterial,
            Vector2(-1, -1),
            Vector2(-1,  1),
            Vector2( 1, -1),
            Vector2( 1,  1))

        Graphics.Blit(src, blur, _blitMaterial)
        Graphics.Blit(blur, dst)

