using System;
using System.Collections.Generic;
using UnityEngine;


public static class FunctionComplex
{
    public static List<NodeComp> FindNearNodePosition(Vector2 pos)
    {
        List<NodeComp> NearNodes = new List<NodeComp>();

        int integerX = (int)pos.x;
        int integerY = (int)pos.y;

        Vector2 nearPos = new Vector2(integerX + 0.5f, integerY + 0.5f);
        if (NodeContainer.Instance.Map.ContainsKey(nearPos) && NodeContainer.Instance.Map[nearPos].IsActivated == false)
            NearNodes.Add(NodeContainer.Instance.Map[nearPos]);

        nearPos = new Vector2(integerX - 0.5f, integerY + 0.5f);
        if (NodeContainer.Instance.Map.ContainsKey(nearPos) && NodeContainer.Instance.Map[nearPos].IsActivated == false)
            NearNodes.Add(NodeContainer.Instance.Map[nearPos]);

        nearPos = new Vector2(integerX + 0.5f, integerY - 0.5f);
        if (NodeContainer.Instance.Map.ContainsKey(nearPos) && NodeContainer.Instance.Map[nearPos].IsActivated == false)
            NearNodes.Add(NodeContainer.Instance.Map[nearPos]);

        nearPos = new Vector2(integerX - 0.5f, integerY - 0.5f);
        if (NodeContainer.Instance.Map.ContainsKey(nearPos) && NodeContainer.Instance.Map[nearPos].IsActivated == false)
            NearNodes.Add(NodeContainer.Instance.Map[nearPos]);

        return NearNodes;
    }
}
