using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : Monosingleton<GameManager>
{
    public string PlayerName = "기사";

    // Use this for initialization
    void Start()
    {
        DontDestroyOnLoad(this);
        SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Title);
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.Escape))
        //    QuitGame();
    }

    public void ToGame()
    {
        SceneManager.LoadScene(1);
    }
    public void ToTitle()
    {
        SceneManager.LoadScene(0);
    }
    public void QuitGame()
    {
        Application.Quit();
    }
}