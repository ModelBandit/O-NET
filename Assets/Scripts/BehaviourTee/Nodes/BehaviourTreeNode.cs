using System;
using System.Collections.Generic;

using UnityEngine;

public class BehaviourTreeNode
{
    protected Func<BehaviourReturn> Act;
    protected string Name;
    protected List<BehaviourTreeNode> Children;

    public virtual BehaviourReturn Run()
    {
        Debug.Log(Name);
        return Act();
    }
    public virtual void AddChild(BehaviourTreeNode child)
    {
        Children.Add(child);
    }

    public virtual void AddChildren(BehaviourTreeNode[] children)
    {
        foreach (BehaviourTreeNode child in children)
        {
            Children.Add(child);
        }
    }
}