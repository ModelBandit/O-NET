using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BackgroundResizer : MonoBehaviour
{
    public Image Renderer;

    public void ResizeByView(float size)
    {
        float ImageWidth = 3700;//Renderer.sprite.texture.width;
        float ImageHeight = 1400;//Renderer.sprite.texture.height;

        float screenWidth = Screen.width;
        float screenHeight = Screen.height;

        float ImageRatio = ImageWidth / ImageHeight;
        float screenRatio = screenWidth / screenHeight;

        float Ratio = Mathf.Abs(ImageRatio - screenRatio) + 1f;

        Vector3 vImageRatio = new Vector3(ImageWidth, ImageHeight, 0).normalized;
        Vector3 vScreenRatio = new Vector3(screenWidth, screenHeight, 0).normalized;
        float resizeWidth = vScreenRatio.x / vImageRatio.x * Ratio;
        float resizeHeight = vScreenRatio.y / vImageRatio.y * Ratio;

        Renderer.transform.localScale = new Vector3(resizeWidth + size * 0.5f, resizeHeight + size * 0.5f, 1);
    }
}
