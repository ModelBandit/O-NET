using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AgentManager : MonoBehaviour
{
    public AgentComp[] Agents;

    private void Start()
    {

    }

    public bool FindSameTile(NodeComp node)
    {
        for (int i = 0; i < PlayManager.Instance.agentManager.Agents.Length; ++i)
        {
            if (PlayManager.Instance.agentManager.Agents[i].CurNode == node)
                return true;
        }
        return false;
    }
    List<InvaderComp> SquadInvaderList = new List<InvaderComp>();
    public InvaderComp[] SquadInSights
    {
        get
        {
            for (int i = 0; i < Agents.Length; ++i)
            {
                for (int j = 0; j < Agents[i].InvaderList.Count; ++j)
                {
                    if(SquadInvaderList.Contains(Agents[i].InvaderList[j]) == false)
                        SquadInvaderList.Add(Agents[i].InvaderList[j]);
                }
            }
            return SquadInvaderList.ToArray();
        }
    }
    public bool SquadInSightsRemove(InvaderComp target)
    {
        for (int i = 0; i < Agents.Length; ++i)
        {
            if (Agents[i].InvaderList.Contains(target))
                return false;
        }

        if (SquadInvaderList.Contains(target))
            SquadInvaderList.Remove(target);
        return true;
    }
    public void AllAgentsFindEnemy()
    {
        for (int i = 0; i < Agents.Length; ++i)
        {
            Agents[i].FindEnemy();
        }
    }

    public bool InvaderListChecker(InvaderComp invader)
    {
        for (int i = 0; i < Agents.Length; ++i)
        {
            if(Agents[i].InvaderList.Contains(invader))
            {
                return true;
            }
        }
        return false;
    }

    public void AllKill()
    {
        for (int i = 0; i < Agents.Length; ++i)
        {
            Agents[i].PayHP();
            Agents[i].PayHP();
            Agents[i].PayHP();
            Agents[i].PayHP();
            Agents[i].PayHP();
        }
    }
    public int LiveAgent
    {
        get
        {
            int count = 0;
            for(int i = 0;i<Agents.Length;++i)
            {
                if (Agents[i].HP > 0)
                    ++count;
            }
            return count;
        }
    }

}
