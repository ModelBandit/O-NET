using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NodeContainer : Monosingleton<NodeContainer>
{
    public Dictionary<Vector2, NodeComp> Map = new Dictionary<Vector2, NodeComp>();
    public NodeComp ErrorNode;
    public NodeComp this[Vector2 key]
    {
        get => GetValue(key);
    }
    private NodeComp GetValue(Vector2 key)
    {
        if(Map.ContainsKey(key))
            return Map[key];
        return ErrorNode;
    }
    public NodeComp[] NodeList;
    // Start is called before the first frame update
    void Start()
    {
        for(int i=0;i<NodeList.Length;++i)
        {
            Map.Add(NodeList[i].transform.position, NodeList[i]);
        }
    }


}
