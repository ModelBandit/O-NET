using System.Collections;
using UnityEngine;

public class Cheat : MonoBehaviour
{
    TileSearcher ts;

    public void Active()
    {
        ts = GetComponent<TileSearcher>();
        ts.GenerateMeshs();
    }
}