using System;

public class LeafNode : BehaviourTreeNode
{
    public LeafNode(string name, Func<BehaviourReturn> func)
    {
        Name = name;
        Act = func;
    }
    //public LeafNode(string name,int a, Func<int, BehaviourReturn> func)
    //{
    //    Name = name;
    //    func(a);
    //}



    public override void AddChild(BehaviourTreeNode child)
    {
        //blocking
        return;
    }
    public override void AddChildren(BehaviourTreeNode[] children)
    {
        //blocking
        return;
    }
}