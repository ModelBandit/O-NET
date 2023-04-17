using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Spine.Unity;

public class MessageWindowController : MonoBehaviour
{
    public SpineAnimator Portrait;
    public SkeletonAnimation Noise;

    public Animator animator;
    public Text text;
    public string Telegram;

    // Start is called before the first frame update
    void Start()
    {
        //PlayManager.Instance.CoroutineList.Add(SendTelegram());
        text.text = string.Empty;

    }

    // Update is called once per frame
    void Update()
    {
        //if(Input.GetKeyDown(KeyCode.D))
        //{
        //    StartCoroutine(Test());
        //}
    }
    float defaultTime = 0.3f;
    public void GameStart()
    {
        SoundManager.Instance.Speaker[0] = CameraController.Instance.Speakers[0];
        SoundManager.Instance.Speaker[1] = CameraController.Instance.Speakers[1];
        SoundManager.Instance.Speaker[2] = CameraController.Instance.Speakers[2];
        SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Mission_Start);
        SoundManager.Instance.Play(SoundType.Voice, StringComplex.VoiceString.Knight_Mission_Start);  
        StartCoroutine(GameStartCoroutine());
    }
    public IEnumerator GameStartCoroutine()
    {
        OpenUI();
        yield return new WaitForSeconds(1f);

        Portrait.PlayAnimation("cross_arm_side");
        Portrait.SetAttatchment("[base]face", "[base]idle");
        string telegram = $"요원전원,\n작전지역에 도착.";
        TextResend(telegram);
        yield return new WaitForSeconds(telegram.Length * defaultTime);

        Portrait.PlayAnimation("shoot_side");
        Portrait.SetAttatchment("[base]face", "[base]attack");
        telegram = $"작전개시!";
        TextResend(telegram);
        yield return new WaitForSeconds(telegram.Length * defaultTime);

        telegram = $"... ...";
        TextResend(telegram);
        Portrait.PlayAnimation("cast_side");
        Portrait.SetAttatchment("[base]face", "[base]idle");
        yield return new WaitForSeconds(telegram.Length * defaultTime + 1f);

        telegram = $"조심해야 돼...";
        TextResend(telegram);
        Portrait.PlayAnimation("sing_side");
        Portrait.SetAttatchment("[base]face", "[base]tired");
        yield return new WaitForSeconds(telegram.Length * defaultTime);

        CloseUI();
        PlayManager.Instance.GameStart();
        yield break;
    }
    public IEnumerator GameStartCoroutineLong()
    {
        OpenUI();
        yield return new WaitForSeconds(1f);

        Portrait.PlayAnimation("shoot_side");
        Portrait.SetAttatchment("[base]face", "[base]attack");
        string telegram = $"{GameManager.Instance.PlayerName}, 대답해! {GameManager.Instance.PlayerName}!";
        TextResend(telegram);
        yield return new WaitForSeconds(telegram.Length * 0.2f);

        telegram = $"... ...";
        TextResend(telegram);
        Portrait.PlayAnimation("cast_side");
        Portrait.SetAttatchment("[base]face", "[base]tired");
        yield return new WaitForSeconds(telegram.Length * 0.2f + 1f);

        telegram = $"... !";
        TextResend(telegram);
        Portrait.SetAttatchment("[base]face", "future_princess_3/side/face/tear");
        yield return new WaitForSeconds(telegram.Length * 0.2f + 1f);
        telegram = $"!!!";
        TextResend(telegram);
        Portrait.SetAttatchment("[base]face", "[base]damaged");
        yield return new WaitForSeconds(telegram.Length * 0.2f);

        telegram = $"무사했구나!";
        TextResend(telegram);
        Portrait.SAnim.state.SetAnimation(0, "clap_side", true);
        Portrait.SetAttatchment("[base]face", "[base]idle");
        yield return new WaitForSeconds(telegram.Length * 0.2f);

        telegram = $"카메라라도 작동해서 다행이야.";
        TextResend(telegram);
        Portrait.SAnim.state.SetAnimation(0, "nod_side", false);
        yield return new WaitForSeconds(telegram.Length * 0.2f);

        telegram = $"거기로 갈게. 조금만 기다려.";
        TextResend(telegram);
        Portrait.PlayAnimation("sing_side");
        Portrait.SetAttatchment("[base]face", "[base]tired");
        yield return new WaitForSeconds(telegram.Length * 0.2f);

        CloseUI();
        PlayManager.Instance.GameStart();
        yield break;
    }
    public IEnumerator GameOver()
    {
        OpenUI();
        yield return new WaitForSeconds(1f);

        string telegram = $"임무 실패....\n구조팀 출동!";
        TextResend(telegram);
        Portrait.SAnim.state.SetAnimation(0, "nod_side", false);
        yield return new WaitForSeconds(telegram.Length * defaultTime + 1f);

        telegram = $"{GameManager.Instance.PlayerName}... 괜찮아?\n많이 다쳤어?";
        TextResend(telegram);
        Portrait.PlayAnimation("sing_side");
        Portrait.SetAttatchment("[base]face", "future_princess_3/side/face/tear");
        yield return new WaitForSeconds(telegram.Length * defaultTime + 1f);

        telegram = $"금방 갈게...\n조금만 기다려...";
        TextResend(telegram);
        Portrait.PlayAnimation("sing_side");
        Portrait.SetAttatchment("[base]face", "[base]tired");
        yield return new WaitForSeconds(telegram.Length * defaultTime + 1f);

        CloseUI();

        yield break;
    }
    public IEnumerator GameClear()
    {
        OpenUI();
        yield return new WaitForSeconds(1f);

        string telegram = $"임무 완료";
        TextResend(telegram);
        Portrait.PlayAnimation("victory_extra_side");
        Portrait.SetAttatchment("[base]face", "[base]doyagao");
        yield return new WaitForSeconds(telegram.Length * defaultTime + 2f);

        telegram = $"전원! 환자부터 이송하고 지역점령을 시작한다.";
        TextResend(telegram);
        Portrait.PlayAnimation("cast2_side");
        Portrait.SetAttatchment("[base]face", "[base]attack");
        yield return new WaitForSeconds(telegram.Length * defaultTime + 1f);

        CloseUI();
        yield break;
    }

    IEnumerator SendTelegram()
    {
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Connection);
        yield return new WaitForSeconds(0.5f);

        while (true)
        {
            if (i < Telegram.Length)
            {
                text.text += Telegram[i];
                ++i;
            }
            yield return new WaitForSeconds(0.1f);
        }
        yield break;
    }


    IEnumerator enumerator = null;
    int i = 0;
    public void TextResend(string s)
    {
        i = 0;
        text.text = string.Empty;
        Telegram = s;
        if(enumerator != null)
            StopCoroutine(enumerator);
        enumerator = SendTelegram();
        StartCoroutine(enumerator);
    }

    IEnumerator Test()
    {
        OpenUI();

        yield return new WaitForSeconds(1f);

        TextResend("헤실미소, 여기는 윈도우 브레이커. 응답하라");
        
        yield return new WaitForSeconds(5f);

        CloseUI();

        yield break;
    }
    public void OpenUI()
    {
        text.text = string.Empty;
        animator.Play("MessageUI_Open");
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.On);
        Noise.state.SetAnimation(0, "static", false);
    }
    public void CloseUI()
    {
        animator.Play("MessageUI_Close");
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Off);
        Noise.state.SetAnimation(0, "static", false);
    }
}
