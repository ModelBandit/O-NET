using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class InvaderComp : AgentComp
{

    BehaviourTree behaviourTree;
    WaitForSeconds DefaultWait = new WaitForSeconds(1.5f);
    // Start is called before the first frame update
    void Start()
    {
        if (pathFinder == null)
            pathFinder = new PathFinder();

        SpineAC.Direction = 0;
        SpineAC.PlayAnimation("rifle_idle", true);

        behaviourTree = new BehaviourTree(new LeafNode("Nothing", DoNothing));

        CoverValue = 0;
        SpineAC.Direction = 0;
        SpineAC.PlayAnimation("rifle_idle", true);
        FindEnemy();
        Particle.Stop();
        CurNodeCoverCheck();
        for (int i = 0; i < Sights.Length; ++i)
        {
            Sights[i].CheckSight();
        }

        InvaderList = null;
        isDetected = false;

        for (int i = 0; i < SpineAC.Animators.Length; ++i)
        {
            SpineAC.Animators[i].alpha = 0;
        }
    }
    public override void PersonalUpdate()
    {
        if (isDetected && HP > 0)
            behaviourTree.Run();
    }
private void FirstDetected()
    {
        ActFunc = FirstDetectedCoroutine();
        PlayManager.Instance.CoroutineList.Add(ActFunc);
    }
    private IEnumerator FirstDetectedCoroutine()
    {
        float t = 0;
        while (t < 1f)
        {
            t += Time.deltaTime;
            yield return null;
        }
        //yield return new WaitForSeconds(1f);

        CameraController.Instance.OutControlview = 0.65f;
        CameraController.Instance.TargetPosition = transform.position;
        SpineAC.PlayAnimation("attack", true);
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.EnemyAppear);

        t = 0;
        while (t < 1.5f)
        {
            t += Time.deltaTime;
            yield return null;
        }
        //yield return new WaitForSeconds(1.5f);

        Reloading();
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Reload);

        t = 0;
        while (t < 1f)
        {
            t += Time.deltaTime;
            yield return null;
        }
        //yield return new WaitForSeconds(1f);

        CameraController.Instance.OutControlview = 0.2f;
        ActivatePathFinder();
        ActFunc = MovePath();
        PlayManager.Instance.CoroutineList.Add(ActFunc);
    }
    private void BuildBehaviourTree()
    {
        LeafNode DoNothingNode = new LeafNode("Nothing", DoNothing);

        LeafNode KnowCoverNode = new LeafNode("KnowCover", KnowCover);
        LeafNode CoverNowNode = new LeafNode("CoverNow", CoverNow);
        LeafNode DetectCoversNode = new LeafNode("DetectCovers", DetectCovers);//엄폐물 특정
        LeafNode SeletDetectedCoverNode = new LeafNode("SeletDetectedCover", SeletDetectedCover);
        LeafNode MoveDetectedCoverNode = new LeafNode("MoveDetectedCover", MoveDetectedCover);

        LeafNode ChasingTargetNode = new LeafNode("ChasingTarget", ChasingTarget);
        LeafNode WaitPredictiveNode = new LeafNode("WaitPredictive", WaitPredictive);
        LeafNode ChaseFromTargetNode = new LeafNode("ChaseFromTarget", ChaseFromTarget);

        LeafNode DetectEnemyNode = new LeafNode("DetectEnemy", DetectEnemy);//적 위치 특정
        LeafNode SeletDetectedEnemyNode = new LeafNode("SeletDetectedEnemy", SeletDetectedEnemy);
        LeafNode AttackDetectedEnemyNode = new LeafNode("AttackDetectedEnemy", AttackDetectedEnemy);

        LeafNode NoEnemyNode = new LeafNode("NoEnemy", NoEnemy);
        LeafNode ChaseFromHereNode = new LeafNode("ChaseFromHere", ChaseFromHere);

        SequenceNode MoveCover = new SequenceNode("MoveCover");
        {
            MoveCover.AddChild(KnowCoverNode);
            MoveCover.AddChild(DetectCoversNode);
            MoveCover.AddChild(CoverNowNode);
            MoveCover.AddChild(SeletDetectedCoverNode);
            MoveCover.AddChild(MoveDetectedCoverNode);
        }
        SequenceNode MoveChase = new SequenceNode("MoveChase");
        {
            MoveChase.AddChild(ChasingTargetNode);
            MoveChase.AddChild(WaitPredictiveNode);
            MoveChase.AddChild(ChaseFromTargetNode);
            MoveChase.AddChild(MoveDetectedCoverNode);
        }
        //SelectorNode Move = new SelectorNode("Move");
        //{
        //    Move.AddChild(MoveCover);
        //    Move.AddChild(MoveChase);
        //}
        SequenceNode Attack = new SequenceNode("Attack");
        {
            Attack.AddChild(DetectEnemyNode);
            Attack.AddChild(SeletDetectedEnemyNode);
            Attack.AddChild(AttackDetectedEnemyNode);
        }
        SequenceNode FindOut = new SequenceNode("FindOut");
        {
            FindOut.AddChild(NoEnemyNode);
            FindOut.AddChild(WaitPredictiveNode);
            FindOut.AddChild(ChaseFromHereNode);
            FindOut.AddChild(MoveDetectedCoverNode);
        }
        SelectorNode MoveOrAttack = new SelectorNode("MoveOrAttack");
        {
            MoveOrAttack.AddChild(MoveCover);
            MoveOrAttack.AddChild(Attack);
            MoveOrAttack.AddChild(MoveChase);
            MoveOrAttack.AddChild(FindOut);
        }
        SelectorNode Root = new SelectorNode("Root");
        {
            Root.AddChild(MoveOrAttack);
            Root.AddChild(DoNothingNode);
        }
        behaviourTree = new BehaviourTree(Root);
    }
    public BehaviourReturn NoEnemy()
    {
        if (DetectedTargets.Count > 0)
            return BehaviourReturn.FAIL;

        pathFinder.CalculateOver = false;
        ActFunc = pathFinder.EnemyCoroutineFindPath(CurNode, MovePoint);
        PlayManager.Instance.CoroutineList.Add(ActFunc);

        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn ChaseFromHere()
    {
        pathFinder.RemoveNonCoverInBlueList();

        List<NodeComp> EnemyNode = FunctionComplex.FindNearNodePosition(LastOneSaw);
        float curDistance = float.MaxValue;
        SeletedNodeIndex = -1;
        for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        {
            if (EnemyNode.Count <= 0)
                break;

            float distance = Vector2.Distance(pathFinder.BlueList[i].transform.position, EnemyNode[0].transform.position);
            if (curDistance > distance)
            {
                SeletedNodeIndex = i;
                curDistance = distance;
            }
        }
        if(SeletedNodeIndex < 0)
            return BehaviourReturn.FAIL;

        DestNode = pathFinder.BlueList[SeletedNodeIndex];
        SeletedNodeIndex = -1;
        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn KnowCover()
    {
        if (nodeList.Count <= 0)
            return BehaviourReturn.SUCCESS;
        return BehaviourReturn.FAIL;
    }
    public BehaviourReturn CoverNow()
    {
        if(CoverValue < 25)
            return BehaviourReturn.SUCCESS;
        return BehaviourReturn.FAIL;
    }
    List<NodeComp> nodeList = new List<NodeComp>();
    int SeletedNodeIndex = -1;
    public BehaviourReturn DetectCovers()
    {
        nodeList = pathFinder.FindMovementTileCountF(CurNode, MovePoint);
        if (nodeList.Count <= 0)
            return BehaviourReturn.FAIL;

        for (int i = 0; i < nodeList.Count; ++i)
        {
            if (nodeList[i].ShieldSR.sprite.name == UIManager.Instance.CoverValueImage[0].name)
            {
                nodeList.RemoveAt(i--);
            }
        }
        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn ChaseFromTarget()
    {
        pathFinder.RemoveNonCoverInBlueList();
        //for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        //    pathFinder.BlueList[i].OnBlue();
        

        //for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        //    pathFinder.BlueList[i].OnOrange();

        //float curDistance = float.MaxValue;
        SeletedNodeIndex = -1;
        for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        {
            if (pathFinder.BlueList[i].IsActivated)
                continue;
            //pathFinder.BlueList[i].OnBlue();
            float distance = Vector2.Distance(pathFinder.BlueList[i].transform.position, transform.position);
            if (MovePoint < distance)
                continue;
            SeletedNodeIndex = i;
        }

        if (SeletedNodeIndex < 0)
            return BehaviourReturn.FAIL;

        DestNode = pathFinder.BlueList[0];
        SeletedNodeIndex = -1;
        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn WaitPredictive()
    {
        if (pathFinder.CalculateOver == false)
            return BehaviourReturn.RUNNING;


        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn ChasingTarget()
    {
        List<NodeComp> nearNodes = FunctionComplex.FindNearNodePosition(LastOneSaw);

        float curDistance = 0f;
        SeletedNodeIndex = -1;
        for (int i= 0; i < nearNodes.Count; ++i)
        {
            //nearNodes[i].OnBlue();
            float distance = Vector2.Distance(nearNodes[i].transform.position, transform.position);
            if (curDistance < distance)
            {
                SeletedNodeIndex = i;
                curDistance = distance;
            }
        }
        //nearNodes[SeletedNodeIndex].OnOrange();
        if (SeletedNodeIndex < 0)
            return BehaviourReturn.FAIL;
        //pathFinder.CalculateOver = false;
        pathFinder.BlueList = pathFinder.FindMovementTileCountF(nearNodes[SeletedNodeIndex], 6);
        pathFinder.CalculateOver = true;
        //PlayManager.Instance.CoroutineList.Add(ActFunc);

        Vector2 dir = (LastOneSaw - LastOneSawBefore);
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
                binary = 1;
            else
                binary = 2;
        }

        //for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        //    pathFinder.BlueList[i].OnBlue();
        //Debug.Break();



        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn SeletDetectedCover()
    {
        if (nodeList.Count <= 0)
            return BehaviourReturn.FAIL;

        nodeList.OrderByDescending(x => x.F);
        float distance = float.MaxValue;
        for (int i = 0; i < nodeList.Count; ++i)
        {
            float dist = Vector2.Distance(transform.position, nodeList[i].transform.position);
            if (dist < distance)
            {
                SeletedNodeIndex = i;
                distance = dist;
            }
        }
        if (SeletedNodeIndex < 0)
            return BehaviourReturn.FAIL;
        DestNode = nodeList[SeletedNodeIndex];
        return BehaviourReturn.SUCCESS;
    }

    public BehaviourReturn MoveDetectedCover()
    {
        if (DestNode == null || DetectedTargets.Count > 0)
            return BehaviourReturn.FAIL;

        Path = pathFinder.FindPath(CurNode, DestNode);
        ActFunc = MovePath();
        PlayManager.Instance.CoroutineList.Add(ActFunc);
        return BehaviourReturn.SUCCESS;
    }

    public Vector2 LastOneSaw;
    public Vector2 LastOneSawBefore;

    public List<AgentComp> DetectedTargets = new List<AgentComp>();
    int DetectedTargetIndex = -1;
    public BehaviourReturn DetectEnemy()
    {
        FindEnemy();
        if (DetectedTargets.Count <= 0)
            return BehaviourReturn.FAIL;
        return BehaviourReturn.SUCCESS;
    }
    public override void FindEnemy()
    {
        AllSight.CheckSight();
        //Bounds sightBounds = AllSight.GetComponent<MeshCollider>().bounds;
        AgentManager manager = PlayManager.Instance.agentManager;
        for (int i = 0; i < manager.Agents.Length; ++i)
        {
            AgentComp agent = manager.Agents[i];
            if (DetectedTargets.Contains(agent) == false)
            {
                if(agent.HP > 0 && Vector2.Distance(agent.transform.position, transform.position) <= AllSight.viewDistance)
                    DetectedTargets.Add(agent);
            }
            else
            {
                if (agent.HP <= 0 || Vector2.Distance(agent.transform.position, transform.position) > AllSight.viewDistance)
                    DetectedTargets.Remove(agent);
            }
        }
    }
    public override void FindEnemyDirection()
    {
        if (DetectedTargets.Count <= 0 || DetectedTargetIndex < 0)
            return;
        AgentComp invader = DetectedTargets[DetectedTargetIndex];

        Vector2 dir = DetectedTargets[DetectedTargetIndex].transform.position - transform.position;

        if(dir.x * dir.x > dir.y * dir.y)
        {
            if(dir.x > 0)
            {
                SpineAC.Direction = 3;
            }
            else
            {
                SpineAC.Direction = 2;
            }
        }
        else
        {
            if (dir.y > 0)
            {
                SpineAC.Direction = 1;
            }
            else
            {
                SpineAC.Direction = 0;
            }
        }
        //for (int i = 0; i < Sights.Length; ++i)
        //{
        //    Sights[i].CheckSight();
        //    Bounds sightBounds = Sights[i].GetComponent<MeshCollider>().bounds;
        //    AgentComp invader = DetectedTargets[DetectedTargetIndex];
        //    BoxCollider2D col = invader.GetComponent<BoxCollider2D>();
        //    Bounds bounds = col.bounds;
        //    if (sightBounds.Intersects(bounds))
        //    {
        //        SpineAC.Direction = i;
        //        return;
        //    }
        //}
    }
    public BehaviourReturn SeletDetectedEnemy()
    {
        if (DetectedTargets.Count <= 0)
            return BehaviourReturn.FAIL;

        DetectedTargets.OrderByDescending(x => x.HP);
        float sDistance = float.MaxValue;
        for (int i=0;i< DetectedTargets.Count;++i)
        {
            if(DetectedTargets[i].HP < MinPower)
            {
                DetectedTargetIndex = i;
                break;
            }

            float distance = Vector2.Distance(transform.position, DetectedTargets[i].transform.position);
            if(sDistance > distance)
            {
                DetectedTargetIndex = i;
                sDistance = distance;
            }
        }
        FindEnemyDirection();

        return BehaviourReturn.SUCCESS;
    }
    public BehaviourReturn AttackDetectedEnemy()
    {
        if (DetectedTargets.Count <= 0 || DetectedTargetIndex < 0)
            return BehaviourReturn.FAIL;
        ActFunc = Attack();
        PlayManager.Instance.CoroutineList.Add(ActFunc);
        return BehaviourReturn.SUCCESS;
    }
    public override IEnumerator Attack()
    {
        float t = 0;

        AgentComp agent = DetectedTargets[DetectedTargetIndex];
        ActNumber = 1;
        OpenUI();
        agent.OpenUI();

        --Ammo;
        //SpineAC.PlayAttatchment("[base]face", "[base]attack");
        PayAP();
        Time.timeScale = 0.5f;
        FindEnemyDirection();

        SpineAC.PlayAnimation("rifle_shoot", false);
        SpineAC.DirAnimator.follower.followBoneRotation = false;

        Vector2 dir = (agent.transform.position - SpineAC.DirAnimator.follower.transform.position).normalized;
        //Vector2 dir2 = (SpineAC.DirAnimator.follower.transform.position - InvaderList[UIManager.Instance.enemyListUI.EnemyIter].transform.position );
        Vector3 curDir = Vector3.zero;

        float originValue = CameraController.Instance.Value;

        float x = Mathf.Abs(dir.x);
        float y = Mathf.Abs(dir.y);
        if (x > y)
        {
            if (x <= 10)
                CameraController.Instance.OutControlview = 1f;
            else if (x > 10 && x < 20)
            {
                CameraController.Instance.OutControlview = (x - 10f) / 10f;
            }
            else
                CameraController.Instance.OutControlview = 0f;
            //10 1
            //25 0
        }
        else
        {
            if (x <= 2f)
                CameraController.Instance.OutControlview = 1f;
            else if (x > 2 && x < 9)
            {
                CameraController.Instance.OutControlview = (y - 2f) / 7f;
            }
            else
                CameraController.Instance.OutControlview = 0f;
        }
        CameraController.Instance.TargetPosition = BodyPoint.position + new Vector3(dir.x, dir.y) * 0.5f;

        float angle = Mathf.Atan2(dir.y, dir.x);
        Vector3 dir3 = new Vector3(0, 0, angle) * Mathf.Rad2Deg;

        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Aim);
        t = 0;
        while (t < 1f)
        {
            t += Time.deltaTime;
            SpineAC.DirAnimator.follower.transform.eulerAngles = Vector3.Lerp(Vector3.zero, dir3, t);
            //SpineAC.DirAnimator.follower.transform.rotation=
            yield return null;
        }

        Time.timeScale = 1;

        int DirCoverValue = agent.CoverValue;
        NodeComp node = NodeContainer.Instance[agent.transform.position];
        Vector2 agentToEnemy = transform.position - agent.transform.position;

        //node.shieldDirection
        switch (node.shieldDirection)
        {
            case 1://후
                if (agentToEnemy.y < 0 && agentToEnemy.normalized.y < 0.4f)
                    DirCoverValue = 0;
                break;
            case 2://전
                if (agentToEnemy.y > 0 && agentToEnemy.normalized.y < 0.4f)
                    DirCoverValue = 0;
                break;
            case 4://좌
                if (agentToEnemy.x < 0 && agentToEnemy.normalized.x < 0.4f)
                    DirCoverValue = 0;
                break;
            case 8://우
                if (agentToEnemy.x > 0 && agentToEnemy.normalized.x < 0.4f)
                    DirCoverValue = 0;
                break;
        }
        float distance = Vector2.Distance(transform.position, agent.transform.position);


        if (Random.Range(0, 100) <= (HitRate - DirCoverValue - distance * 3))
        {
            for (int i = 0; i < MaxPower; ++i)
            {
                PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, agent);

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);

                t = 0;
                while (t < 0.15f)
                {
                    t += Time.deltaTime;
                    yield return null;
                }
            }
        }
        else
        {
            int refeat = Random.Range(MinPower, MaxPower);
            for (int i = 0; i < MaxPower; ++i)
            {
                if (i < refeat && Random.Range(0, 100) <= HitRate - DirCoverValue - distance * 3)
                {
                    PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, agent);
                }
                else
                {
                    PlayManager.Instance.bulletManager.Shoot(false, SpineAC.DirMuzzle, agent);
                }

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);

                t = 0;
                while (t < 0.15f)
                {
                    t += Time.deltaTime;
                    yield return null;
                }
            }
        }
        SpineAC.DirAnimator.follower.followBoneRotation = true;
        SpineAC.PlayAnimation("rifle_idle", true);


        t = 0;
        while (t < 0.5f)
        {
            t += Time.deltaTime;
            yield return null;
        }

        CameraController.Instance.OutControlview = originValue;


        CloseUI();
        agent.CloseUI();
        DetectedTargetIndex = -1;

        PlayManager.Instance.AllUpdateSight();
        ActNumber = -1;

        yield break;
    }
    public override IEnumerator Overwatching()
    {
        yield return null;
    }


    public BehaviourReturn DoNothing()
    {
        PayAP();
        PayAP();
        return BehaviourReturn.SUCCESS;
    }

    public override void Appear()
    {
        if (isDetected == false)
        {
            CurNode.ConqTile();
            BuildBehaviourTree();
            FirstDetected();
            isDetected = true;
            PlayManager.Instance.Contact(transform);
            if (PlayManager.Instance.ContactCount > 3)
            {
                SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Mission_Advantageous);
            }
            else if (PlayManager.Instance.ContactCount > 1)
            {
                SoundManager.Instance.Play(SoundType.BGM, StringComplex.BGMString.Mission_EnemyContact);
            }
        }
        LastOneSaw = transform.position;
    }
    //public override void Disappear()
    //{
    //    for (int i = 0; i < SpineAC.Animators.Length; ++i)
    //        SpineAC.Animators[i].alpha = 0;
    //
    //    if (CanSee == true)
    //        PlayManager.Instance.Fog(false, transform);
    //    CanSee = false;
    //}
    public override void SightVision(bool inSight)
    {
        if (inSight)
        {
            AllSight.MatChange(PlayManager.Instance.SightMats[2]);
        }
        else
        {
            AllSight.MatChange(PlayManager.Instance.SightMats[0]);
        }
    }
    public override IEnumerator MovePath()
    {
        if (Path == null || Path.Count == 0)
            yield break;

        if (Path[Path.Count - 1].IsActivated)
        {
            Path[Path.Count - 1].OffTile();
            Path.Remove(Path[Path.Count - 1]);
        }

        ActNumber = 0;
        Particle.Play();
        CurNode.RealeseTile();
        PayAP();

        CoverValue = 0;
        CoverValueImage.sprite = UIManager.Instance.CoverValueImage[0];

        while (true)
        {
            float step = Speed * Time.deltaTime * MoveScale;
            transform.position = Vector3.MoveTowards(transform.position, Path[0].transform.position, step);

            Vector2 direction = transform.position - Path[0].transform.position;
            direction.Normalize();
            if (direction.y == 0 && SpineAC.IsPlaying("rifle_run_side") == false)
            {
                if (direction.x > 0)//Left
                {
                    SpineAC.Direction = 2;
                    SpineAC.PlayAnimation("rifle_run", true);
                }
                else if (direction.x < 0)
                {
                    SpineAC.Direction = 3;
                    SpineAC.PlayAnimation("rifle_run", true);
                }
            }
            else if (direction.x == 0)
            {
                if (direction.y < 0)//Up
                {
                    if (SpineAC.IsPlaying("rifle_run_back") == false)
                    {
                        SpineAC.Direction = 1;
                        SpineAC.PlayAnimation("rifle_run", true);
                    }
                }
                else if (direction.y > 0)
                {
                    if (SpineAC.IsPlaying("rifle_run_front") == false)
                    {
                        SpineAC.Direction = 0;
                        SpineAC.PlayAnimation("rifle_run", true);
                    }
                }
            }


            if (Vector3.Distance(transform.position, Path[0].transform.position) < 0.0001f)
            {
                transform.position = Path[0].transform.position;
                Path.RemoveAt(0);
            }

            if (Path.Count <= 0)
            {
                CurNode = DestNode;
                DestNode = null;
                CurNode.ConqTile();
                pathFinder.CalculateOver = false;
                ActFunc = pathFinder.EnemyCoroutineFindPath(CurNode, MovePoint);
                PlayManager.Instance.CoroutineList.Add(ActFunc);
                SpineAC.PlayAnimation("rifle_idle", true);
                CurNodeCoverCheck();
                break;
            }
            if (MoveScale > 0)
            {
                FindEnemy();
                PlayManager.Instance.AllUpdateSight();
                CameraController.Instance.TargetPosition = transform.position;
            }
            yield return null;
        }

        float t = 0;
        while (t < 0.8f)
        {
            t += Time.deltaTime;
        }
        while (pathFinder.CalculateOver == false)
            yield return null;


        ActNumber = -1;
        Particle.Stop();
        SeletedNodeIndex = -1;

        yield break;
    }

    public override void ForceActStop()
    {
        if (ActFunc != null)
            PlayManager.Instance.CoroutineList.Remove(ActFunc);

        Particle.Stop();
        ActFunc = null;
        behaviourTree = null;
    }

    protected override void Dead()
    {
        ForceActStop();
        SpineAC.PlayAnimationDead();
        PayAP();
        PayAP();
        PlayManager.Instance.AllUpdateSight();
        ++PlayManager.Instance.EnemyKillCount;
    }
    public override void PayHP()
    {
        if (HP <= 0)
            return;

        HPAnims[--HP].DecreaseAnimation();
        HPFace();
        ++PlayManager.Instance.HitCount;

        if (HP <= 0)
            Dead();
    }
}
