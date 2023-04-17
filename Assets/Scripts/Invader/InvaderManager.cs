using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InvaderManager : MonoBehaviour
{
    public InvaderComp[] Invaders;
    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < Invaders.Length; ++i)
        {
            Invaders[i].pPathFinder.BlueList = null;
            Invaders[i].pPathFinder.OrangeList = null;
            Invaders[i].pPathFinder.CalculateOver = false;
        }
    }

    // Update is called once per frame
    //public void ActUpdate()
    //{
    //    for (int i = 0; i < Invaders.Length; ++i)
    //    {
    //        if (Invaders[i].AP <= 0)
    //            continue;
    //        Invaders[i].PersonalUpdate();
    //        break;
    //    }
    //}
    public void AllInvadersFindEnemy()
    {
        for (int i = 0; i < Invaders.Length; ++i)
        {
            Invaders[i].FindEnemy();
        }
    }
    public void AllInvadersDetectPosition(Vector2 v2)
    {
        for (int i = 0; i < Invaders.Length; ++i)
        {
            if(Invaders[i].DetectedTargets.Count <= 0)
            {
                Invaders[i].LastOneSaw = v2;
                Invaders[i].LastOneSawBefore = Invaders[i].transform.position;
            }
        }
    }
    public void AllKill()
    {
        for (int i = 0; i < Invaders.Length; ++i)
        {
            Invaders[i].PayHP();
            Invaders[i].PayHP();
            Invaders[i].PayHP();
            Invaders[i].PayHP();
            Invaders[i].PayHP();
        }
    }
    public bool FindSameTile(NodeComp node)
    {
        for (int i = 0; i < PlayManager.Instance.invaderManager.Invaders.Length; ++i)
        {
            if (PlayManager.Instance.invaderManager.Invaders[i].CurNode == node)
                return true;
        }
        return false;
    }
    public int LiveInvader
    {
        get
        {
            int count = 0;
            for (int i = 0; i < Invaders.Length; ++i)
            {
                if (Invaders[i].HP > 0)
                    ++count;
            }
            return count;
        }
    }
}
