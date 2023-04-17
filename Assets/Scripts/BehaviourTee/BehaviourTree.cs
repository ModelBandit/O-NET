using System.Collections;
using UnityEngine;

public enum BehaviourReturn
{
    None = -2,
    FAIL = -1,
    RUNNING = 0,
    SUCCESS = 1
}

public class BehaviourTree
{
    int level = 0;
    BehaviourTreeNode Root;
    public BehaviourTree(BehaviourTreeNode RootNode)
    {
        Root = RootNode;
    }

    public void Run()
    {
        Root.Run();
    }
} 
