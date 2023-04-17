using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ActListHover : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public Animator animator;
    public void OnPointerEnter(PointerEventData eventData)
    {
        animator.Play("AgentUI_Open");
        //Debug.Log("Enter");
    }
    public void OnPointerExit(PointerEventData eventData)
    {
        animator.Play("AgentUI_Close");
        //Debug.Log("Exit");
    }
}
