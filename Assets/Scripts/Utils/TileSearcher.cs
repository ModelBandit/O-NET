using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Tilemaps;

public class TileSearcher : Monosingleton<TileSearcher>
{
    public Grid grid;
    public Tilemap tileMap;
    public Transform Container;
    public TileBase[] Tiles;

    public GameObject prefabs;

    public Color None;
    public Color blue;
    public Color orange;

    // Start is called before the first frame update
    void Start()
    {
        //GenerateMeshs();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void GenerateMeshs()
    {
        BoundsInt bounds = tileMap.cellBounds;
        TileBase[] allTiles = tileMap.GetTilesBlock(bounds);
        //tileMap.settile

        Vector3 StartSize = new Vector3(-8.5f, -7.5f, 0);
        Vector3 XSize = new Vector3(1f, 0f, 0f);
        Vector3 YSize = new Vector3(0f, 1f, 0f);

        for (int x = 0; x < bounds.size.x; ++x)
        {
            for (int y = 0; y < bounds.size.y; ++y)
            {
                Vector3Int TilePos = new Vector3Int(x, y, 0);

                TileBase tile = allTiles[x + y * bounds.size.x];
                if (tile == null)
                    continue;
                //Debug.Log("x:" + x + " y:" + y + " tile:" + tile.name);
                //Debug.Log(tile.name);

                Instantiate(prefabs, StartSize + (x * XSize) + (y * YSize)
                    , Quaternion.identity, Container);
            }

        }


    }

}
