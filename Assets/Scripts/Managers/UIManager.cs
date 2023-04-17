using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : Monosingleton<UIManager>
{
    public MessageWindowController telegram;
    int clickedActList = -1;
    public int ClickedActList
    {
        get
        {
            return clickedActList;
        }
    }
    public void SetActListIndex(int index)
    {
        clickedActList = index;
    }
    [SerializeField]
    public Image Glow;
    [SerializeField]
    public Animator RadarUI;
    [SerializeField]
    public Color RadarUIColor;
    [SerializeField]
    public GameObject[] FriendlyUI;
    [SerializeField]
    public GameObject[] EnemyUI;

    public Sprite Empty;
    public Image RankUI;
    public Sprite[] RankImage;
    public Text NameUI;
    public Image ClassUI;
    public Sprite[] ClassImage;
    public Image[] WeaponUI;
    public Sprite[] WeaponUIImage;

    public GameObject[] ActUI;
    public ActListWindow ActWindow;
    public EnemyListUI enemyListUI;

    public Sprite[] CoverValueImage;

    private void Start()
    {
        enemyListUI.gameObject.SetActive(false);
        for (int i = 0; i < enemyListUI.EnemyList.Length; ++i)
        {
            enemyListUI.EnemyList[i].gameObject.SetActive(false);
        }
        StartCoroutine(IntroGame());
    }
    public IEnumerator IntroGame()
    {
        yield return new WaitForSeconds(2f);
        EndUI.gameObject.SetActive(false);
        yield break;
    }
    public void FriendlyUISwitch(bool enemyTurn)
    {
        for (int i = 0; i < FriendlyUI.Length; ++i)
        {
            FriendlyUI[i].SetActive(enemyTurn);
        }
    }
    public void EnemyUISwitch(bool enemyTurn)
    {
        for (int i = 0; i < EnemyUI.Length; ++i)
        {
            EnemyUI[i].SetActive(enemyTurn);
        }
    }
    public void TurnChangeUI(bool enemyTurn)
    {
        if(enemyTurn)
        {
            StartCoroutine(GlowColorChange(Color.red));
            FriendlyUISwitch(false);
            EnemyUISwitch(true);
        }
        else
        {
            StartCoroutine(GlowColorChange(Color.white));
            FriendlyUISwitch(true);
            EnemyUISwitch(false);
        }
    }

    IEnumerator GlowColorChange(Color color)
    {
        float t = 0;

        Color origin = Glow.color;
        while (t < 1f)
        {
            t += Time.deltaTime * 2;
            Glow.color = Vector4.Lerp(origin, color, t);
            yield return null;
        }
        yield break;
    }
    public void MatchEnemyCount()
    {
        if(enemyListUI.gameObject.activeSelf == false)
            enemyListUI.gameObject.SetActive(true);

        for (int i = 0; i < enemyListUI.EnemyList.Length; ++i)
        {
            enemyListUI.EnemyList[i].gameObject.SetActive(false);
        }

        enemyListUI.FitLayout.padding.left = -55 - ((PlayManager.Instance.NowActor.InvaderList.Count - 1) * 110);

        for (int i = 0; i < PlayManager.Instance.NowActor.InvaderList.Count; ++i)
        {
            enemyListUI.EnemyList[i].gameObject.SetActive(true);
            enemyListUI.EnemyListPos[i] = PlayManager.Instance.NowActor.InvaderList[i].transform.position;
        }
        enemyListUI.SelectTarget(PlayManager.Instance.NowActor.InvaderList.Count - 1);
        CameraController.Instance.TargetPosition = enemyListUI.EnemyListPos[PlayManager.Instance.NowActor.InvaderList.Count - 1];
    }
    public void EnemyCountReset()
    {
        enemyListUI.gameObject.SetActive(false);
        for (int i = 0; i < enemyListUI.EnemyList.Length; ++i)
        {
            enemyListUI.EnemyList[i].gameObject.SetActive(false);
        }
        CameraController.Instance.TargetPosition = PlayManager.Instance.NowActor.transform.position;
    }
    public void ActerInfoReset()
    {
        NameUI.text = string.Empty;
        RankUI.sprite = Empty;
        ClassUI.sprite = Empty;

        for (int i = 0; i < WeaponUI.Length; ++i)
        {
            WeaponUI[i].sprite = Empty;
        }
        //WeaponUI[0].fillAmount = (float)agent.Ammo / (float)agent.MaxAmmo;

        for (int i = 0; i < ActUI.Length; ++i)
        {
            ActUI[i].SetActive(false);
        }
    }
    public void ActorInfoMatch()
    {
        AgentComp agent = PlayManager.Instance.NowActor;
        
        NameUI.text = agent.AgentName;
        RankUI.sprite = RankImage[agent.Rank];
        ClassUI.sprite = ClassImage[agent.Class];

        for(int i=0;i< WeaponUI.Length;++i)
        {
            WeaponUI[i].sprite = WeaponUIImage[agent.Weapon];
        }
        WeaponUI[0].fillAmount = (float)agent.Ammo / (float)agent.MaxAmmo;

        //ActUI로 ActUIBinary를 체크하거나 Agent별로 Binary로 들고 있게 하고 처리할 것
        int ActUIBinary = agent.ActUIBinary;
        for (int i = 0; i < ActUI.Length; ++i, ActUIBinary = ActUIBinary >> 1)
        {
            if ((ActUIBinary & 1) == 1)
            {
                ActUI[i].SetActive(true);
            }
            else
            {
                ActUI[i].SetActive(false);
            }
        }
    }

    //차례가 안온 아무 대상용
    public void ActerInfoMatch(AgentComp agent)
    {
        NameUI.text = agent.AgentName;
        RankUI.sprite = RankImage[agent.Rank];
        ClassUI.sprite = ClassImage[agent.Class];

        for (int i = 0; i < WeaponUI.Length; ++i)
        {
            WeaponUI[i].sprite = WeaponUIImage[agent.Weapon];
        }
        WeaponUI[0].fillAmount = (float)agent.Ammo / (float)agent.MaxAmmo;

        for (int i = 0; i < ActUI.Length; ++i)
        {
            ActUI[i].SetActive(false);
        }
    }


    public void GlowRadarUI(bool getOn)
    {
        RadarUI.SetBool("Glow", getOn);
        if (getOn)
        {
            RadarUI.Play("GlowSelf");
            SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.RadarSound, CameraController.Instance.transform);
        }
        else
        {
            RadarUI.Play("TurnOff");
            SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.DelayOff, CameraController.Instance.transform);
        }
    }

    public EndUIComp EndUI;
    public void GameOver(bool isWin, int SurvivorCount, int HPCount, int KillCount, int HitCount)
    {
        FriendlyUISwitch(false);
        EnemyUISwitch(false);
        EndUI.GameOver(isWin, SurvivorCount, HPCount, KillCount, HitCount);
    }

    [SerializeField]
    GameObject ESCWindow;
    bool ESCWindowOpen = false;
    public void OpenESCWindow()
    {
        ESCWindowOpen = !ESCWindowOpen;
        ESCWindow.SetActive(ESCWindowOpen);
    }
    public void ToTitle()
    {
        GameManager.Instance.ToTitle();
    }
    public void Quit()
    {
        GameManager.Instance.QuitGame();
    }
}
