using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NodeComp : MonoBehaviour
{
    public int G;
    public int H;

    public int F
    {
        get
        {
            return G + H;
        }
    }

    const int Up = 1;
    const int Down = 2;
    const int Left = 4;
    const int Right = 8;

    public BoxCollider2D collider;

    public SpriteRenderer NodeSR;
    public SpriteRenderer ShieldSR;
    public int shieldDirection;

    public NodeComp PreviousTile;
    public int PreviousDir;

    public bool IsActivated;

    // Start is called before the first frame update
    void Awake()
    {
        collider = GetComponent<BoxCollider2D>();
        NodeSR = GetComponent<SpriteRenderer>();
        ShieldSR = transform.GetChild(0).GetComponent<SpriteRenderer>();
        IsActivated = false;
    }

    private void Update()
    {
        if(IsActivated)
        {

        }
    }

    public void ConqTile()
    {
        IsActivated = true;
        collider.enabled = false;
    }
    public void RealeseTile()
    {
        IsActivated = false;
        collider.enabled = true;
    }

    public void OnBlue()
    {
        NodeSR.color = TileSearcher.Instance.blue;
        if(shieldDirection > 0)
        {
            ShieldSR.color = Color.white;
        }
    }
    public void OnOrange()
    {
        NodeSR.color = TileSearcher.Instance.orange;
        if (shieldDirection > 0)
        {
            ShieldSR.color = Color.white;
        }
    }
    public void OffTile()
    {
        NodeSR.color = TileSearcher.Instance.None;
        ShieldSR.color = Color.clear;
    }
}
