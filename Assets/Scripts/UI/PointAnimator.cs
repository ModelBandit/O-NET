using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointAnimator : MonoBehaviour
{
    [SerializeField]
    Animator animator;
    [SerializeField]
    SpriteRenderer spriteRenderer;

    public void DecreaseAnimation()
    {
        StartCoroutine(Decrease());
    }
    IEnumerator Decrease()
    {
        float originPower = spriteRenderer.material.GetFloat("_DissolvePower");
        animator.Play("Point_Decrease");

        while (originPower > 0)
        {
            originPower -= Time.deltaTime;
            spriteRenderer.material.SetFloat("_DissolvePower", originPower);
            yield return null;
        }

        yield break;
    }
    public void IncreaseAnimation()
    {
        StartCoroutine(Increase());
    }
    IEnumerator Increase()
    {
        float originPower = spriteRenderer.material.GetFloat("_DissolvePower");
        animator.Play("Point_Increase");

        while (originPower < 1f)
        {
            originPower += Time.deltaTime;
            spriteRenderer.material.SetFloat("_DissolvePower", originPower);
            yield return null;
        }

        yield break;
    }
    public void EmphasisAnimation()
    {
        if (animator.GetCurrentAnimatorStateInfo(0).IsName("Point_Emphasis"))
            return;

        animator.Play("Point_Emphasis");
    }
    public void IdleAnimation(bool isOn)
    {
        if(isOn)
            animator.Play("Point_Increase_Idle");
        else
            animator.Play("Point_Decrease_Idle");
    }
}
