using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class PathFinder 
{
    public List<NodeComp> FindPath(NodeComp start, NodeComp end)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closedList = new List<NodeComp>();

        openList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        while (openList.Count > 0)
        {
            NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

            openList.Remove(currentOverlayMesh);
            closedList.Add(currentOverlayMesh);

            if(currentOverlayMesh == end)
            {
                //도착지점
                return GetFinishedList(start, end);
            }
            List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

            for (int i = 0; i < neighbourTiles.Count; ++i)
            {
                if (closedList.Contains(neighbourTiles[i]))
                    continue;

                neighbourTiles[i].G = CostCheck(start.transform.position, neighbourTiles[i].transform.position);
                neighbourTiles[i].H = CostCheck(end.transform.position, neighbourTiles[i].transform.position);

                neighbourTiles[i].PreviousTile = currentOverlayMesh;

                if (openList.Contains(neighbourTiles[i]) == false)
                {
                    openList.Add(neighbourTiles[i]);
                }
            }
        }

        List<NodeComp> path = new List<NodeComp>();
        path.Add(start);
        path.Add(start);
        return path;
    }



    private List<NodeComp> GetFinishedList(NodeComp start, NodeComp end)
    {
        List<NodeComp> finishedList = new List<NodeComp>();

        int count = 0;
        NodeComp curMesh = end;
        while(curMesh != start)
        {
            //Debug.Log($"{count++} : {curMesh.F}");
            finishedList.Add(curMesh);

            Vector2 v2 = curMesh.transform.position - curMesh.PreviousTile.transform.position;
            v2.Normalize();
            if (v2.x == 0 && v2.y > 0)
            {
                curMesh.PreviousTile.PreviousDir = 1;
            }
            else if (v2.x == 0 && v2.y < 0)
            {
                curMesh.PreviousTile.PreviousDir = 0;
            }
            else if (v2.y == 0 && v2.x > 0)
            {
                curMesh.PreviousTile.PreviousDir = 3;
            }
            else if (v2.y == 0 && v2.x < 0)
            {
                curMesh.PreviousTile.PreviousDir = 2;
            }
            curMesh = curMesh.PreviousTile;
        }

        finishedList.Reverse();

        return finishedList;
    }
    private int GetCountList(NodeComp start, NodeComp end)
    {
        int Count = 0;

        NodeComp curMesh = end;
        while (curMesh != start)
        {
            ++Count;
            curMesh = curMesh.PreviousTile;
        }

        return Count;
    }

    //도로 기준으로 코스트체크가 되도록 손볼 필요 있음
    public int CostCheck(Vector2 start, Vector2 end)
        => (int)(Mathf.Abs(start.x - end.x) + Mathf.Abs(start.y - end.y) * 2);


    public List<NodeComp> GetNeighbourTiles(NodeComp node)
    {
        Dictionary<Vector2, NodeComp> map = NodeContainer.Instance.Map;

        List<NodeComp> neighbours = new List<NodeComp>();

        Vector2 XSize = new Vector2(1f, 0f);
        Vector2 YSize = new Vector2(0f, 1f);

        //+z
        Vector2 FrontLocationCheck = new Vector2(node.transform.position.x + XSize.x, node.transform.position.y + XSize.y);
        //Debug.Log($"FrontLocationCheck : {FrontLocationCheck}");

        if (map.ContainsKey(FrontLocationCheck))
        {
            map[FrontLocationCheck].PreviousDir = 3;
                neighbours.Add(map[FrontLocationCheck]);
        }

        //+x
        Vector2 LeftLocationCheck = new Vector2(node.transform.position.x + YSize.x, node.transform.position.y + YSize.y);
        //Debug.Log($"LeftLocationCheck : {LeftLocationCheck}");
        if (map.ContainsKey(LeftLocationCheck))
        {
            map[LeftLocationCheck].PreviousDir = 1;
                neighbours.Add(map[LeftLocationCheck]);
        }

        //-x
        Vector2 RightLocationCheck = new Vector2(node.transform.position.x - YSize.x, node.transform.position.y - YSize.y);
        //Debug.Log($"RightLocationCheck : {RightLocationCheck}");
        if (map.ContainsKey(RightLocationCheck))
        {
            map[RightLocationCheck].PreviousDir = 0;
                neighbours.Add(map[RightLocationCheck]);
        }
        //-z
        Vector2 BackLocationCheck = new Vector2(node.transform.position.x - XSize.x, node.transform.position.y - XSize.y);
        //Debug.Log($"BackLocationCheck : {BackLocationCheck}");
        if (map.ContainsKey(BackLocationCheck))
        {
            map[BackLocationCheck].PreviousDir = 2;
                neighbours.Add(map[BackLocationCheck]);
        }

        return neighbours;
    }
    public List<NodeComp> GetNeighbourTilesOnTile(NodeComp node)
    {
        Dictionary<Vector2, NodeComp> map = NodeContainer.Instance.Map;

        List<NodeComp> neighbours = new List<NodeComp>();

        Vector2 XSize = new Vector2(1f, 0f);
        Vector2 YSize = new Vector2(0f, 1f);

        //+z
        Vector2 FrontLocationCheck = new Vector2(node.transform.position.x + XSize.x, node.transform.position.y + XSize.y);
        //Debug.Log($"FrontLocationCheck : {FrontLocationCheck}");

        if (map.ContainsKey(FrontLocationCheck))
        {
            map[FrontLocationCheck].PreviousDir = 3;
            if (map[FrontLocationCheck].IsActivated == false)
                neighbours.Add(map[FrontLocationCheck]);
        }

        //+x
        Vector2 LeftLocationCheck = new Vector2(node.transform.position.x + YSize.x, node.transform.position.y + YSize.y);
        //Debug.Log($"LeftLocationCheck : {LeftLocationCheck}");
        if (map.ContainsKey(LeftLocationCheck))
        {
            map[LeftLocationCheck].PreviousDir = 1;
            if (map[LeftLocationCheck].IsActivated == false)
                neighbours.Add(map[LeftLocationCheck]);
        }

        //-x
        Vector2 RightLocationCheck = new Vector2(node.transform.position.x - YSize.x, node.transform.position.y - YSize.y);
        //Debug.Log($"RightLocationCheck : {RightLocationCheck}");
        if (map.ContainsKey(RightLocationCheck))
        {
            map[RightLocationCheck].PreviousDir = 0;
            if (map[RightLocationCheck].IsActivated == false)
                neighbours.Add(map[RightLocationCheck]);
        }
        //-z
        Vector2 BackLocationCheck = new Vector2(node.transform.position.x - XSize.x, node.transform.position.y - XSize.y);
        //Debug.Log($"BackLocationCheck : {BackLocationCheck}");
        if (map.ContainsKey(BackLocationCheck))
        {
            map[BackLocationCheck].PreviousDir = 2;
            if (map[BackLocationCheck].IsActivated == false)
                neighbours.Add(map[BackLocationCheck]);
        }

        return neighbours;
    }


    List<NodeComp> FindCostPathCountF(NodeComp start, int MaxCost)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closedList = new List<NodeComp>();

        openList.Add(start);
        closedList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closedList.Contains(neighbourTiles[i]))
                        continue;

                    neighbourTiles[i].G = CostCheck(start.transform.position, neighbourTiles[i].transform.position);
                    prevTiles.Add(neighbourTiles[i]);
                }
            }
            openList = prevTiles;
            closedList.AddRange(prevTiles);
        }

        return closedList;
    }
    List<NodeComp> FindCostPath(NodeComp start, int MaxCost)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closedList = new List<NodeComp>();

        openList.Add(start);
        closedList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closedList.Contains(neighbourTiles[i]))
                        continue;

                    neighbourTiles[i].OnBlue();
                    prevTiles.Add(neighbourTiles[i]);
                }
            }
            openList = prevTiles;
            closedList.AddRange(prevTiles);
        }

        return closedList;
    }

    public List<NodeComp> FindMovementTileCountF(NodeComp node, int MovePoint)
    {
        return FindCostPathCountF(node, MovePoint);
    }
    public List<NodeComp> FindMovementTile(NodeComp node, int MovePoint)
    {
        return FindCostPath(node, MovePoint);
    }

    List<NodeComp> FindCostPathDouble(NodeComp start, int MaxCost)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closedList = new List<NodeComp>();

        openList.Add(start);
        closedList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closedList.Contains(neighbourTiles[i]))
                        continue;

                    if(j < MaxCost/2)
                        neighbourTiles[i].OnBlue();
                    else
                        neighbourTiles[i].OnOrange();

                    prevTiles.Add(neighbourTiles[i]);
                }
            }
            openList = prevTiles;
            closedList.AddRange(prevTiles);
        }

        return closedList;
    }
    public List<NodeComp> FindMovementTileDouble(NodeComp node, int MovePoint)
    {
        return FindCostPathDouble(node, MovePoint * 2);
    }

    public int PathCost(NodeComp start, NodeComp end)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closedList = new List<NodeComp>();

        openList.Add(start);

        while (openList.Count > 0)
        {
            NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

            openList.Remove(currentOverlayMesh);
            closedList.Add(currentOverlayMesh);

            if (currentOverlayMesh == end)
            {
                return GetCountList(start, end);
            }

            List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

            foreach (var neighbour in neighbourTiles)
            {
                if (!(neighbour == end ^ neighbour.gameObject.tag == "Road") ||
                    closedList.Contains(neighbour))
                    continue;

                neighbour.PreviousTile = currentOverlayMesh;

                if (openList.Contains(neighbour) == false)
                {
                    openList.Add(neighbour);
                }
            }
        }

        return int.MaxValue;
    }

    public volatile bool CalculateOver = false;
    List<NodeComp> blueList;
    public List<NodeComp> BlueList
    {
        get
        {
            if (blueList == null)
                blueList = new List<NodeComp>();

            return blueList;
        }
        set
        {
            blueList = value;
        }
    }
    List<NodeComp> orangeList;
    public List<NodeComp> OrangeList
    {
        get
        {
            if (orangeList == null)
                orangeList = new List<NodeComp>();

            return orangeList;
        }
        set
        {
            orangeList = value;
        }
    }
    public IEnumerator CoroutineFindPathDouble(NodeComp start, int MaxCost)
    {
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closeList = new List<NodeComp>();

        openList.Add(start);
        closeList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closeList.Contains(neighbourTiles[i]))
                    {
                        continue;
                    }
                    
                    if (j < MaxCost / 2)
                    {
                        BlueList.Add(neighbourTiles[i]);
                    }
                    else
                    {
                        OrangeList.Add(neighbourTiles[i]);
                    }

                    prevTiles.Add(neighbourTiles[i]);
                }
                yield return null;
            }
            openList = prevTiles;
            closeList.AddRange(prevTiles);

        }
        CalculateOver = true;
        yield break;
    }
    public IEnumerator CoroutineFindPath(NodeComp start, int MaxCost)
    {
        CalculateOver = false;
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closeList = new List<NodeComp>();
        blueList = new List<NodeComp>();

        openList.Add(start);
        closeList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closeList.Contains(neighbourTiles[i]))
                    {
                        continue;
                    }

                    BlueList.Add(neighbourTiles[i]);
                    //neighbourTiles[i].OnBlue();
                    prevTiles.Add(neighbourTiles[i]);
                }
                yield return null;
            }
            openList = prevTiles;
            closeList.AddRange(prevTiles);

        }
        CalculateOver = true;
        yield break;
    }
    public void RemoveNonCoverInBlueList()
    {
        for (int i = 0; i < BlueList.Count; ++i)
        {
            if (BlueList[i].shieldDirection <= 0)
                BlueList.RemoveAt(i--);
        }
    }

    public IEnumerator EnemyCoroutineFindPath(NodeComp start, int MaxCost)
    {
        CalculateOver = false;
        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closeList = new List<NodeComp>();
        blueList = new List<NodeComp>();

        openList.Add(start);
        closeList.Add(start);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTiles(currentOverlayMesh);

                if (currentOverlayMesh.IsActivated == true)
                {
                    closeList.Add(currentOverlayMesh);

                    if (PlayManager.Instance.agentManager.FindSameTile(currentOverlayMesh))
                    {
                        closeList.AddRange(GetCoverTileByCoverDirection(currentOverlayMesh));
                        continue;
                    }
                }
                if (currentOverlayMesh.IsActivated == true)
                {
                    closeList.Add(currentOverlayMesh);

                    if (PlayManager.Instance.agentManager.FindSameTile(currentOverlayMesh))
                    {
                        closeList.AddRange(GetCoverTileByCoverDirection(currentOverlayMesh));
                        continue;
                    }
                }

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closeList.Contains(neighbourTiles[i]) || neighbourTiles[i].IsActivated)
                    {
                        continue;
                    }

                    BlueList.Add(neighbourTiles[i]);
                    //neighbourTiles[i].OnBlue();
                    prevTiles.Add(neighbourTiles[i]);
                }
                yield return null;
            }
            openList = prevTiles;
            closeList.AddRange(prevTiles);

        }
        CalculateOver = true;
        yield break;
    }
    public IEnumerator FindNodeDirectionFilter(NodeComp node, Vector2 pos, Vector2 beforePos, int MaxCost)
    {
        CalculateOver = false;
        int integerX = (int)pos.x;
        int integerY = (int)pos.y;

        Vector2 dir = (pos - beforePos);
        int binary = 0;
        //좌우이동 중일때
        if (dir.x * dir.x > dir.y * dir.y)
        {
            if (dir.x < 0)
                binary = 8;
            else
                binary = 4;
        }
        //상하이동 중일때
        else
        {
            if (dir.y < 0)
                binary = 2;
            else
                binary = 1;
        }
        //하지만 반대로 입력하는

        List<NodeComp> openList = new List<NodeComp>();
        List<NodeComp> closeList = new List<NodeComp>();
        BlueList = new List<NodeComp>();

        openList.Add(node);
        closeList.Add(node);
        //Debug.Log($"Start Point : {start.transform.position}");
        //Debug.Log($"End Point : {end.transform.position}");

        for (int j = 0; j < MaxCost; ++j)
        {
            List<NodeComp> prevTiles = new List<NodeComp>();
            while (openList.Count > 0)
            {
                NodeComp currentOverlayMesh = openList.OrderBy(x => x.F).First();

                openList.Remove(currentOverlayMesh);

                List<NodeComp> neighbourTiles = GetNeighbourTilesDirectionFilter(currentOverlayMesh, binary);

                for (int i = 0; i < neighbourTiles.Count; ++i)
                {
                    if (closeList.Contains(neighbourTiles[i]))
                    {
                        continue;
                    }

                    BlueList.Add(neighbourTiles[i]);

                    prevTiles.Add(neighbourTiles[i]);
                }
                yield return null;
            }
            openList = prevTiles;
            closeList.AddRange(prevTiles);
        }
        Vector3 v3 = pos;
        BlueList.OrderBy(x => Vector3.Distance(x.transform.position, v3));
        CalculateOver = true;
        yield break;
    }
    public List<NodeComp> GetNeighbourTilesDirectionFilter(NodeComp node, int DirBinary)
    {
        Dictionary<Vector2, NodeComp> map = NodeContainer.Instance.Map;

        List<NodeComp> neighbours = new List<NodeComp>();

        Vector2 XSize = new Vector2(1f, 0f);
        Vector2 YSize = new Vector2(0f, 1f);


        // 1
        if((DirBinary & 1) == 0)
        {
            Vector2 LeftLocationCheck = new Vector2(node.transform.position.x + YSize.x, node.transform.position.y + YSize.y);
            //Debug.Log($"LeftLocationCheck : {LeftLocationCheck}");
            if (map.ContainsKey(LeftLocationCheck))
            {
                map[LeftLocationCheck].PreviousDir = 1;
                neighbours.Add(map[LeftLocationCheck]);
            }
        }

        // 2
        if ((DirBinary & 2) == 0)
        {
            Vector2 RightLocationCheck = new Vector2(node.transform.position.x - YSize.x, node.transform.position.y - YSize.y);
            //Debug.Log($"RightLocationCheck : {RightLocationCheck}");
            if (map.ContainsKey(RightLocationCheck))
            {
                map[RightLocationCheck].PreviousDir = 0;
                neighbours.Add(map[RightLocationCheck]);
            }
        }

        // 4
        if ((DirBinary & 4) == 0)
        {
            Vector2 BackLocationCheck = new Vector2(node.transform.position.x - XSize.x, node.transform.position.y - XSize.y);
            //Debug.Log($"BackLocationCheck : {BackLocationCheck}");
            if (map.ContainsKey(BackLocationCheck))
            {
                map[BackLocationCheck].PreviousDir = 2;
                neighbours.Add(map[BackLocationCheck]);
            }
        }
        // 8
        if ((DirBinary & 8) == 0)
        {
            Vector2 FrontLocationCheck = new Vector2(node.transform.position.x + XSize.x, node.transform.position.y + XSize.y);
            //Debug.Log($"FrontLocationCheck : {FrontLocationCheck}");

            if (map.ContainsKey(FrontLocationCheck))
            {
                map[FrontLocationCheck].PreviousDir = 3;
                neighbours.Add(map[FrontLocationCheck]);
            }
        }

        return neighbours;
    }

    public List<NodeComp> GetCoverTileByCoverDirection(NodeComp node)
    {
        Dictionary<Vector2, NodeComp> map = NodeContainer.Instance.Map;
        Vector2 XSize = new Vector2(1f, 0f);
        Vector2 YSize = new Vector2(0f, 1f);

        List<NodeComp> CoverNodes = new List<NodeComp>();
        List<NodeComp> openList = new List<NodeComp>();
        int DirBinary = node.shieldDirection;

        openList.Add(node);
        while (openList.Count <= 0)
        {
            NodeComp curNode = openList[0];
            switch (DirBinary)
            {
                case 1:
                case 2:
                    Vector2 LeftLocationCheck = new Vector2(node.transform.position.x + YSize.x, node.transform.position.y + YSize.y);
                    //Debug.Log($"LeftLocationCheck : {LeftLocationCheck}");
                    if (map.ContainsKey(LeftLocationCheck) && map[LeftLocationCheck].shieldDirection != 0)
                    {
                        openList.Add(map[LeftLocationCheck]);
                        CoverNodes.Add(map[LeftLocationCheck]);
                    }
                    Vector2 RightLocationCheck = new Vector2(node.transform.position.x - YSize.x, node.transform.position.y - YSize.y);
                    //Debug.Log($"RightLocationCheck : {RightLocationCheck}");
                    if (map.ContainsKey(RightLocationCheck) && map[RightLocationCheck].shieldDirection != 0)
                    {
                        openList.Add(map[RightLocationCheck]);
                        CoverNodes.Add(map[RightLocationCheck]);
                    }

                    break;
                case 4:
                case 8:
                    Vector2 FrontLocationCheck = new Vector2(node.transform.position.x + XSize.x, node.transform.position.y + XSize.y);
                    if (map.ContainsKey(FrontLocationCheck) && map[FrontLocationCheck].shieldDirection != 0)
                    {
                        openList.Add(map[FrontLocationCheck]);
                        CoverNodes.Add(map[FrontLocationCheck]);
                    }
                    Vector2 BackLocationCheck = new Vector2(node.transform.position.x - XSize.x, node.transform.position.y - XSize.y);
                    //Debug.Log($"BackLocationCheck : {BackLocationCheck}");
                    if (map.ContainsKey(BackLocationCheck) && map[BackLocationCheck].shieldDirection != 0)
                    {
                        openList.Add(map[BackLocationCheck]);
                        CoverNodes.Add(map[BackLocationCheck]);
                    }
                    break;
            }
            openList.Remove(curNode);
        }

        return CoverNodes;
    }
}
