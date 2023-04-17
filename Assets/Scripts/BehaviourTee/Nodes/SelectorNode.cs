using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectorNode : BehaviourTreeNode
{
    int BeforeResult;
    public SelectorNode(string name)
    {
        Name = name;
        Children = new List<BehaviourTreeNode>();
        BeforeResult = 0;
    }

    public override BehaviourReturn Run()
    {
        BehaviourReturn result = BehaviourReturn.FAIL;
        //Debug.Log(Name);

        for (int i = BeforeResult; i < Children.Count; ++i)
        {
            result = Children[i].Run();
            if (result == BehaviourReturn.RUNNING)
            {
                BeforeResult = i;
                return BehaviourReturn.RUNNING;
            }
            else if (result == BehaviourReturn.SUCCESS)
            {
                BeforeResult = 0;
                return BehaviourReturn.SUCCESS;
            }

        }
        BeforeResult = 0;
        return BehaviourReturn.FAIL;
    }
}