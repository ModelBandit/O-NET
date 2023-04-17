using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ActListWindow : MonoBehaviour
{
    public Animator Animator;
    bool isOpen = false;
    public Text Title;
    public Text Detail;

    //Title과 Detail 내 텍스트 수정 후에 사용할 것
    public void OpenUI()
    {
        if (isOpen)
            return;
        isOpen = true;
        Animator.Play("AgentUI_Open");
    }
    public void SetTitle(string title)
    {
        Title.text = title;
    }
    public void SetDetail (string detail)
    {
        Detail.text = detail;
    }
    public void OpenUI(string title, string detail)
    {
        Title.text = title;
        Detail.text = detail;
        OpenUI();
    }
    public void CloseUI()
    {
        if (isOpen == false)
            return;
        isOpen = false;

        Animator.Play("AgentUI_Close");
    }
}
