using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnemyListUI : MonoBehaviour
{
    public Transform TargetMark;

    public int EnemyIter = 0;
    public HorizontalLayoutGroup FitLayout;
    public Transform[] EnemyList;
    public Vector3[] EnemyListPos;


    public void Update()
    {
    }
    public void SelectTarget(int iter)
    {
        if(enumerator != null)
            StopCoroutine(enumerator);
        EnemyIter = iter;
        enumerator = MoveToTarget(iter);
        StartCoroutine(enumerator);
    }
    IEnumerator enumerator = null;
    IEnumerator MoveToTarget(int iter)
    {
        float t = 0f;

        while (t < 1f)
        {
            t += Time.deltaTime;
            TargetMark.position = Vector3.Lerp(TargetMark.position, EnemyList[iter].position, t);
            yield return null;
        }
        yield break;
    }
}
