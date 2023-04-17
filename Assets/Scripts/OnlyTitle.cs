using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class OnlyTitle : MonoBehaviour
{
    [SerializeField]
    AudioSource[] Speakers;
    // Start is called before the first frame update
    void Start()
    {
        SoundManager.Instance.Speaker[0] = Speakers[0];
        SoundManager.Instance.Speaker[1] = Speakers[1];
        SoundManager.Instance.Speaker[2] = Speakers[2];
        SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Title);
        titleImage.Play("TItleAnim");
    }

    // Update is called once per frame
    void Update()
    {

    }
    public void ToGame()
    {
        GameManager.Instance.ToGame();
    }
    public void QuitGame()
    {
        Application.Quit();
    }
    [SerializeField]
    Animator titleImage;
}
