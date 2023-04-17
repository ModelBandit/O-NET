using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EndUIComp : MonoBehaviour
{
    [SerializeField]
    Image GameOverUI;
    [SerializeField]
    Image GameOverTitle;
    [SerializeField]
    Sprite[] GameOverTitleSprite;
    [SerializeField]
    Text GameOverText;
    [SerializeField]
    Image[] GameOverMarks;
    [SerializeField]
    Sprite[] GameOverMarkSprite;

    [SerializeField]
    Text[] ScoreCountText;

    [SerializeField]
    Image[] RankImage;
    [SerializeField]
    Sprite[] RankSprite;
    [SerializeField]
    Text[] RankText;
    string[] EndText = {"ÈÇ¸¢ÇÑ","ÁÁÀ½","º¸Åë" };
    public void GameOver(bool isWin, int SurvivorCount, int HPCount, int KillCount, int HitCount)
    {
        GameOverUI.gameObject.SetActive(true);
        ScoreCountText[0].text = SurvivorCount.ToString();
        ScoreCountText[1].text = HPCount.ToString();
        ScoreCountText[2].text = KillCount.ToString();
        ScoreCountText[3].text = HitCount.ToString();

        if (SurvivorCount >= 3)
        {
            RankImage[0].sprite = RankSprite[0];
            RankText[0].text = EndText[0];
        }
        else if (KillCount >= 2)
        {
            RankImage[0].sprite = RankSprite[1];
            RankText[0].text = EndText[1];
        }
        else if (KillCount < 2)
        {
            RankImage[0].sprite = RankSprite[2];
            RankText[0].text = EndText[2];
        }
        if (KillCount >= 5)
        {
            RankImage[1].sprite = RankSprite[0];
            RankText[1].text = EndText[0];
        }
        else if (KillCount >= 2)
        {
            RankImage[1].sprite = RankSprite[1];
            RankText[1].text = EndText[1];
        }
        else if (KillCount < 2)
        {
            RankImage[1].sprite = RankSprite[2];
            RankText[1].text = EndText[2];
        }

        if (isWin)
        {
            GameOverTitle.sprite = GameOverTitleSprite[0];
            for (int i = 0; i < GameOverMarks.Length; ++i)
                GameOverMarks[i].sprite = GameOverMarkSprite[0];

            GameOverText.text = " Victory ";
            GameOverUI.GetComponent<Animator>().Play("WinAnimation");
            SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Mission_Complete);
            SoundManager.Instance.Play(SoundType.Voice, StringComplex.BGMString.Mission_Complete);
        }
        else
        {
            GameOverTitle.sprite = GameOverTitleSprite[1];
            for (int i = 0; i < GameOverMarks.Length; ++i)
                GameOverMarks[i].sprite = GameOverMarkSprite[1];

            GameOverText.text = "  Defeat  ";
            GameOverUI.GetComponent<Animator>().Play("DefeatAnimation");
            SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.GameOver);
            SoundManager.Instance.Play(SoundType.Voice, StringComplex.BGMString.GameOver);
        }
        //GameOverUI.GetComponent<Animator>().Play("ReturnAnimation");
    }
}
