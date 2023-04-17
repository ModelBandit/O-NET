using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SequenceNode : BehaviourTreeNode
{
    int BeforeResult;
    public SequenceNode(string name)
    {
        Name = name;
        Children = new List<BehaviourTreeNode>();
        BeforeResult = 0;
    }

    public override BehaviourReturn Run()
    {
        //Debug.Log(Name);

        BehaviourReturn result = BehaviourReturn.FAIL;
        for (int i = BeforeResult; i < Children.Count; ++i)
        {
            result = Children[i].Run();
            if (result == BehaviourReturn.RUNNING)
            {
                BeforeResult = i;
                return result;
            }
            else if (result == BehaviourReturn.FAIL)
            {
                BeforeResult = 0;
                return result;
            }

        }
        BeforeResult = 0;
        return BehaviourReturn.SUCCESS;
    }
}