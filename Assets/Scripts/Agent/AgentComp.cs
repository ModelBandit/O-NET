using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AgentComp : MonoBehaviour
{
    public string AgentName;
    public bool isDetected;

    [SerializeField]
    public int HP;
    [SerializeField]
    int MaxHP;
    [SerializeField]
    protected PointAnimator[] HPAnims;
    [SerializeField]
    public int AP;
    [SerializeField]
    int MaxAP;
    [SerializeField]
    PointAnimator[] APAnims;

    public int Class;
    public int Rank;
    public int Weapon;

    public int Ammo;
    public int MaxAmmo;
    public int ActUIBinary
    {
        get
        {
            int binary = 0;
            if(InvaderList.Count > 0)
             binary += 1;
            if(Ammo > 0)
             binary += 2;
            if(Ammo != MaxAmmo)
             binary += 4;

            return binary;//1+2+4
        }
    }

    public int MovePoint;
    [SerializeField]
    Animator UI;
    [SerializeField]
    protected SpriteRenderer CoverValueImage;
    [SerializeField]
    protected int Speed;

    protected PathFinder pathFinder;
    public PathFinder pPathFinder
    {
        get
        {
            if(pathFinder == null)
                pathFinder = new PathFinder();

            return pathFinder;
        }
    }
    List<NodeComp> path;
    protected List<NodeComp> Path
    {
        get
        {
            if (path == null)
                path = new List<NodeComp>();
            return path;
        }
        set
        {
            path = value;
        }
    }
    public NodeComp CurNode;
    public NodeComp DestNode = null;
    public int CoverValue;
    public SpineAnimatorController SpineAC;

    [SerializeField]
    protected ParticleSystem Particle;
    public int ActNumber = -1;

    // Start is called before the first frame update
    void Start()
    {
        if (pathFinder == null)
            pathFinder = new PathFinder();

        CoverValue = 0;
        SpineAC.Direction = 0;
        SpineAC.SelectSetActive();
        SpineAC.PlayAnimation("rifle_idle", true);
        Particle.Stop();
        CurNodeCoverCheck();
        isDetected = true;
    }


    public FieldOfView AllSight;
    public FieldOfView[] Sights;
    public virtual void SightVision(bool inSight)
    {
        if (inSight)
        {
            AllSight.MatChange(PlayManager.Instance.SightMats[1]);
            //for (int i = 0; i < Sights.Length; ++i)
                //Sights[i].MatChange(PlayManager.Instance.SightMats[2]);
        }
        else
        {
            AllSight.MatChange(PlayManager.Instance.SightMats[0]);
            //for (int i = 0; i < Sights.Length; ++i)
                //Sights[i].MatChange(PlayManager.Instance.SightMats[0]);
        }
    }

    public List<InvaderComp> InvaderList = new List<InvaderComp>();
    public virtual void FindEnemy()
    {
        AllSight.CheckSight();
        Bounds sightBounds = AllSight.GetComponent<MeshCollider>().bounds;
        InvaderManager manager = PlayManager.Instance.invaderManager;
        for (int i = 0; i < manager.Invaders.Length; ++i)
        {
            InvaderComp invader = manager.Invaders[i];

            if(invader.isDetected)
            {
                if(InvaderList.Contains(invader))
                {
                    if (Vector2.Distance(invader.transform.position, transform.position) > AllSight.viewDistance)
                    {
                        InvaderList.Remove(invader);
                    }
                    if (invader.HP <= 0)
                    {
                        InvaderList.Remove(invader);
                    }
                }
                else
                {
                    if (Vector2.Distance(invader.transform.position, transform.position) <= AllSight.viewDistance)
                    {
                        if(invader.HP > 0)
                            InvaderList.Add(invader);
                        //invader.Appear();
                    }
                }
            }
            else
            {
                BoxCollider2D col = invader.GetComponent<BoxCollider2D>();
                Bounds bounds = col.bounds;
                if (sightBounds.Intersects(bounds) && // 시야각을 관통하는 버그가 있는것으로 보임
                    InvaderList.Contains(invader) == false)
                {
                    StartCoroutine(MoveScaleControl(1, 0));
                    PlayManager.Instance.CoroutineList.Add(MoveScaleControl(0, 1));
                    invader.Appear();
                    if (invader.HP > 0)
                    {
                        InvaderList.Add(manager.Invaders[i]);
                    }
                }
            }
        }
    }
    public virtual void FindEnemyDirection()
    {
        for (int i = 0; i < Sights.Length; ++i)
        {
            Sights[i].CheckSight();
            Bounds sightBounds = Sights[i].GetComponent<MeshCollider>().bounds;

            InvaderComp invader = InvaderList[UIManager.Instance.enemyListUI.EnemyIter];
            BoxCollider2D col = invader.GetComponent<BoxCollider2D>();
            Bounds bounds = col.bounds;
            if (sightBounds.Intersects(bounds))
            {
                SpineAC.Direction = i;
                return;
            }
        }

    }
    protected void Reloading()
    {
        Ammo = MaxAmmo;
        SpineAC.PlayAnimation("rifle_reload", false);
    }
    void AttackTarget()
    {
        FindEnemyDirection();
        SpineAC.PlayAnimation("rifle_shoot", false);
    }

    //List<NodeComp> list;
    public void OpenUI()
    {
        UI.Play("AgentUI_Open");
    }
    public void OpenTileUI()
    {
        if (pPathFinder.CalculateOver == false)
            return;

        if (AP < 2)
        {
            for (int i = 0; i < pathFinder.BlueList.Count; ++i)
            {
                pathFinder.BlueList[i].OnBlue();
            }
        }
        else
        {
            for (int i = 0; i < pathFinder.BlueList.Count; ++i)
            {
                pathFinder.BlueList[i].OnBlue();
            }
            for (int i = 0; i < pathFinder.OrangeList.Count; ++i)
            {
                pathFinder.OrangeList[i].OnOrange();
            }
        }
    }
    public void CloseUI()
    {
        UI.Play("AgentUI_Close");
    }
    public void CloseTileUI()
    {
        if (pathFinder.CalculateOver == false)
            return;

        for (int i = 0; i < pathFinder.BlueList.Count; ++i)
        {
            pathFinder.BlueList[i].OffTile();
        }
        for (int i = 0; i < pathFinder.OrangeList.Count; ++i)
        {
            pathFinder.OrangeList[i].OffTile();
        }
    }

    public int ActivatePathFinder()
    {
        Path = pathFinder.FindPath(CurNode, DestNode);
        return Path.Count;
    }
    public void OnlyPathOn()
    {
        if (Path == null || Path.Count == 0)
            return;

        {
            for (int i = 0; i < pathFinder.BlueList.Count; ++i)
            {
                pathFinder.BlueList[i].OffTile();
            }
            for (int i = 0; i < pathFinder.OrangeList.Count; ++i)
            {
                pathFinder.OrangeList[i].OffTile();
            }
        }
        for (int i=0;i<Path.Count;++i)
        {
            Path[i].OnBlue();
        }
    }
    public void FinishedAct()
    {
        EmphasisHPReset();
        EnemyHPEmphasisReset();
        UIManager.Instance.ActWindow.CloseUI();
        UIManager.Instance.ActerInfoReset();
    }
    public float MoveScale = 1f;
    public IEnumerator MoveScaleControl(float FromScaleSize, float ToScaleSize)
    {
        float t = 0;
        while(t < 1f)
        {
            t += Time.deltaTime;
            MoveScale = Mathf.Lerp(FromScaleSize, ToScaleSize, t);
            SpineAC.DirAnimator.SAnim.timeScale = MoveScale;
            yield return null;
        }
        yield break;
    }
    public virtual IEnumerator MovePath()
    {
        if (Path == null || Path.Count == 0)
            yield break;

        UIManager.Instance.FriendlyUISwitch(false);
        PlayManager.Instance.outControll = true;
        Particle.Play();
        CurNode.RealeseTile();
        PayAP();

        CoverValue = 0;
        CoverValueImage.sprite = UIManager.Instance.CoverValueImage[0];

        while (true)
        {
            if (Path[Path.Count - 1].IsActivated)
            {
                Path[Path.Count - 1].OffTile();
                Path.Remove(Path[Path.Count - 1]);
            }
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
                PlayManager.Instance.CoroutineList.Add(pathFinder.CoroutineFindPath(CurNode, MovePoint));
                SpineAC.PlayAnimation("rifle_idle", true);
                CurNodeCoverCheck();
                break;
            }
            if(MoveScale > 0)
            {
                PlayManager.Instance.AllUpdateSight();
                CameraController.Instance.TargetPosition = transform.position;
            }
            yield return null;
        }


        float t = 0;
        while(t <0.8f)
        {
            t += Time.deltaTime;
            yield return null;
        }

        UIManager.Instance.FriendlyUISwitch(true);
        EndCoroutine();
        CurNode.OffTile();
        PlayManager.Instance.CoroutineList.Add(pathFinder.CoroutineFindPath(CurNode, MovePoint));
        Particle.Stop();

        while (pPathFinder.CalculateOver == false) ;

        if (PlayManager.Instance.ActOver())
        {
            PlayManager.Instance.TurnChange();
        }
        yield break;
    }

    public IEnumerator MovePathDouble()
    {
        if (Path == null || Path.Count == 0)
            yield break;

        UIManager.Instance.FriendlyUISwitch(false);
        PlayManager.Instance.outControll = true;
        Particle.Play();
        CurNode.RealeseTile();
        PayAP();
        PayAP();

        while (true)
        {
            if (Path[Path.Count - 1].IsActivated)
            {
                Path[Path.Count - 1].OffTile();
                Path.Remove(Path[Path.Count - 1]);
            }
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
                SpineAC.PlayAnimation("rifle_idle", true);

                CurNodeCoverCheck();
                break;
            }
            if (MoveScale > 0)
            {
                FindEnemy();
                CameraController.Instance.TargetPosition = transform.position;
            }
            yield return null;
        }
        float t = 0;
        while (t < 0.8f)
        {
            t += Time.deltaTime;
            yield return null;
        }

        EndCoroutine();
        Particle.Stop();

        UIManager.Instance.FriendlyUISwitch(true);
        if (PlayManager.Instance.ActOver())
        {
            PlayManager.Instance.TurnChange();
        }

        yield break;
    }
    private void EndCoroutine()
    {
        CloseUI();
        CloseTileUI();
        CursorComp.Instance.RendererColor = Color.blue;
        PlayManager.Instance.state = StateFlow.Search;
        CameraController.Instance.TargetToMain();
        PlayManager.Instance.outControll = false;
    }
    const int CoverValueDefault = 20;
    protected void CurNodeCoverCheck()
    {
        if (CurNode == null)
            return;

        CoverValueImage.sprite = CurNode.ShieldSR.sprite;

        for (int i = 0; i < UIManager.Instance.CoverValueImage.Length; ++i)
        {
            if (CoverValueImage.sprite.name == UIManager.Instance.CoverValueImage[i].name)
            {
                CoverValue = CoverValueDefault * i;
                break;
            }
        }
    }
    [SerializeField]
    public Transform BodyPoint;
    [SerializeField]
    protected int HitRate;
    [SerializeField]
    public float AvoidanceRate;
    [SerializeField]
    protected int MinPower;
    [SerializeField]
    public int MaxPower;

    public IEnumerator ActFunc = null;
    public virtual void ForceActStop()
    {
        if (ActFunc != null)
            StopCoroutine(ActFunc);
        ActFunc = null;
        Particle.Stop();
    }
    public virtual IEnumerator Attack()
    {
        PlayManager.Instance.outControll = true;

        UIManager.Instance.FriendlyUISwitch(false);
        --Ammo;
        SpineAC.PlayAttatchment("[base]face", "[base]attack");
        PayAP();
        Time.timeScale = 0.5f;
        AttackTarget();
        SpineAC.DirAnimator.follower.followBoneRotation = false;

        InvaderComp invader = InvaderList[UIManager.Instance.enemyListUI.EnemyIter];
        Vector2 dir = (invader.transform.position - SpineAC.DirAnimator.follower.transform.position).normalized;
        //Vector2 dir2 = (SpineAC.DirAnimator.follower.transform.position - InvaderList[UIManager.Instance.enemyListUI.EnemyIter].transform.position );
        Vector3 curDir = Vector3.zero;

        float originValue = CameraController.Instance.Value;

        float x = Mathf.Abs(dir.x);
        float y = Mathf.Abs(dir.y);
        if (x > y)
        {
            if(x <= 10)
                CameraController.Instance.OutControlview = 1f;
            else if(x > 10 && x < 20)
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
            if (y <= 2f)
                CameraController.Instance.OutControlview = 1f;
            else if (y > 2 && y < 9)
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
        float t = 0;
        while (t < 1f)
        {
            t += Time.deltaTime;
            SpineAC.DirAnimator.follower.transform.eulerAngles = Vector3.Lerp(Vector3.zero, dir3, t);
            //SpineAC.DirAnimator.follower.transform.rotation=
            yield return null;
        }

        Time.timeScale = 1;

        int DirCoverValue = invader.CoverValue;
        NodeComp node = NodeContainer.Instance[invader.transform.position];
        Vector2 agentToEnemy = transform.position - invader.transform.position;

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
        float distance = Vector2.Distance(transform.position, invader.transform.position);
        

        if (Random.Range(0, 100) <= (HitRate - (DirCoverValue - invader.AvoidanceRate) - distance*3))
        {
            for (int i = 0; i < MaxPower; ++i)
            {
                PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, invader);

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);
                yield return new WaitForSeconds(0.15f);
            }
        }
        else
        {
            int refeat = Random.Range(MinPower, MaxPower);
            for (int i = 0; i < MaxPower; ++i)
            {
                if (i < refeat && Random.Range(0, 100) <= HitRate - (DirCoverValue - invader.AvoidanceRate) - distance * 3)
                {
                    PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, invader);
                }
                else
                {
                    PlayManager.Instance.bulletManager.Shoot(false, SpineAC.DirMuzzle, invader);
                }

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);
                yield return new WaitForSeconds(0.15f);
            }
        }
        SpineAC.DirAnimator.follower.followBoneRotation = true;
        SpineAC.PlayAnimation("rifle_idle", true);
        HPFace();

        yield return new WaitForSeconds(0.5f);

        CameraController.Instance.OutControlview = originValue;
        yield return new WaitForSeconds(1f);


        invader.CloseUI();
        PlayManager.Instance.AllUpdateSight();

        CloseUI();
        PlayManager.Instance.invaderManager.AllInvadersDetectPosition(transform.position);
        CursorComp.Instance.RendererColor = Color.blue;
        PlayManager.Instance.state = StateFlow.Search;
        PlayManager.Instance.outControll = false;
        UIManager.Instance.FriendlyUISwitch(true);
        if (PlayManager.Instance.ActOver())
        {
            PlayManager.Instance.outControll = true;
            PlayManager.Instance.TurnChange();
        }
        yield break;
    }
    public virtual IEnumerator OverwatchAttack(AgentComp comp)
    {
        --Ammo;
        SpineAC.PlayAttatchment("[base]face", "[base]attack");
        Time.timeScale = 0.5f;

        for (int i = 0; i < Sights.Length; ++i)
        {
            Sights[i].CheckSight();
            Bounds sightBounds = Sights[i].GetComponent<MeshCollider>().bounds;

            AgentComp invader = comp;
            BoxCollider2D col = invader.GetComponent<BoxCollider2D>();
            Bounds bounds = col.bounds;
            if (sightBounds.Intersects(bounds))
            {
                SpineAC.Direction = i;
                break;
            }
        }
        SpineAC.PlayAnimation("rifle_shoot", false);

        SpineAC.DirAnimator.follower.followBoneRotation = false;

        OpenUI();
        comp.OpenUI();
        Vector2 dir = (comp.transform.position - SpineAC.DirAnimator.follower.transform.position).normalized;
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
            if (y <= 2f)
                CameraController.Instance.OutControlview = 1f;
            else if (y > 2 && y < 9)
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
        float t = 0;
        while (t < 1f)
        {
            t += Time.deltaTime;
            SpineAC.DirAnimator.follower.transform.eulerAngles = Vector3.Lerp(Vector3.zero, dir3, t);
            //SpineAC.DirAnimator.follower.transform.rotation=
            yield return null;
        }

        Time.timeScale = 1;

        if (Random.Range(0, 100) <= ((HitRate - comp.AvoidanceRate) * 0.5))
        {
            for (int i = 0; i < MaxPower; ++i)
            {
                PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, comp);

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);
                yield return new WaitForSeconds(0.15f);
            }
        }
        else
        {
            int refeat = Random.Range(MinPower, MaxPower);
            for (int i = 0; i < MaxPower; ++i)
            {
                if (i < refeat && Random.Range(0, 100) <= ((HitRate - comp.AvoidanceRate) * 0.5))
                {
                    PlayManager.Instance.bulletManager.Shoot(true, SpineAC.DirMuzzle, comp);
                }
                else
                {
                    PlayManager.Instance.bulletManager.Shoot(false, SpineAC.DirMuzzle, comp);
                }

                CameraController.Instance.transform.position += new Vector3(Random.Range(-0.075f, 0.075f), Random.Range(-0.075f, 0.075f));
                SpineAC.PlayAnimation("rifle_shoot2", false);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Fire, transform);
                yield return new WaitForSeconds(0.15f);
            }
        }
        SpineAC.DirAnimator.follower.followBoneRotation = true;
        SpineAC.PlayAnimation("rifle_idle", true);
        HPFace();

        yield return new WaitForSeconds(0.5f);

        CameraController.Instance.OutControlview = originValue;
        yield return new WaitForSeconds(1f);


        comp.CloseUI();
        PlayManager.Instance.AllUpdateSight(); 
        PlayManager.Instance.invaderManager.AllInvadersDetectPosition(transform.position);
        CloseUI();

        yield break;
    }
    public void HPFace()
    { 
        if (HP < 0)
            SpineAC.PlayAttatchment("[base]face", "[base]sleep_deep");
        else if (HP < 3)
            SpineAC.PlayAttatchment("[base]face", "[base]tired");
        else
            SpineAC.PlayAttatchment("[base]face", "[base]idle");
    }
    public IEnumerator Overwatch()
    {
        UIManager.Instance.FriendlyUISwitch(false);
        PlayManager.Instance.outControll = true;
        PayAP();
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Overwatch);
        SightVision(false);
        SpineAC.PlayAnimation("rifle_shoot", false);
        SpineAC.PlayAttatchment("[base]face", "[base]mad");

        ActFunc = Overwatching();
        StartCoroutine(ActFunc);

        yield return new WaitForSeconds(1f);
        EndCoroutine();
        UIManager.Instance.FriendlyUISwitch(true);
        if (PlayManager.Instance.ActOver())
        {
            PlayManager.Instance.TurnChange();
        }
        yield break;
    }
    public virtual IEnumerator Overwatching()
    {
        AllSight.CheckSight();
        Bounds bounds = AllSight.GetComponent<MeshCollider>().bounds;
        InvaderComp invader = null;
        bool detect = false;
        //WorkNow
        while (detect == false)
        {
            for(int i=0;i<PlayManager.Instance.invaderManager.Invaders.Length;++i)
            {
                invader = PlayManager.Instance.invaderManager.Invaders[i];
                Bounds invaderBounds = invader.GetComponent<BoxCollider2D>().bounds;
                if (invader.HP > 0 &&
                    (invader.ActNumber == 0 || invader.ActNumber == 99) &&
                    bounds.Intersects(invaderBounds))// 시야 내의 적 중 누군가 MovePath시도하거나 시행중
                {
                    detect = true;
                    break;
                }
                yield return null;
            }
            yield return null;
        }
        PlayManager.Instance.CoroutineList.Add(invader.MoveScaleControl(1, 0)); //당하는 쪽이 실행해야하는 부분

        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Overwatch);
        SoundManager.Instance.Play(SoundType.Voice, StringComplex.VoiceString.Knight_Command_OverwatchAttack);
        yield return new WaitForSeconds(1f);

        
        //Attack()를 쓴다면 적지정을 먼저 완료한 후에 해당 함수 수행
        ActFunc = OverwatchAttack(invader);
        StartCoroutine(ActFunc);
        yield return new WaitForSeconds(3.5f);
        PlayManager.Instance.CoroutineList.Add(invader.MoveScaleControl(0, 1));//당하는 쪽이 실행해야하는 부분
        yield break;
    }
    public IEnumerator Reload()
    {
        UIManager.Instance.FriendlyUISwitch(false);
        PlayManager.Instance.outControll = true;
        PayAP();
        Reloading();
        SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Reload);

        yield return new WaitForSeconds(1f);
        SpineAC.PlayAnimation("rifle_idle", true);

        HPFace();
        UIManager.Instance.FriendlyUISwitch(true);
        EndCoroutine();
        if (PlayManager.Instance.ActOver())
        {
            PlayManager.Instance.TurnChange();
        }
        yield break;
    }

    public void RestoreHP()
    {
        if (HP >= MaxHP)
            return;

        HPAnims[HP++].IncreaseAnimation();
        HPFace();
        ++PlayManager.Instance.HPCount;
    }
    public void RestoreAP()
    {
        if (AP >= MaxAP)
            return;

        APAnims[AP++].IncreaseAnimation();
    }
    public virtual void PayHP()
    {
        if (HP <= 0)
            return;

        HPAnims[--HP].DecreaseAnimation();
        HPFace();
        --PlayManager.Instance.HPCount;

        if (HP <= 0)
            Dead();
    }
    public void EmphasisHP(int Cost)
    {
        if(HP < Cost)
        {
            for (int i = 0; i < HP; ++i)
            {
                HPAnims[(HP - 1) - i].EmphasisAnimation();
            }
        }
        else
        {
            for (int i = 0; i < Cost; ++i)
            {
                HPAnims[(HP - 1) - i].EmphasisAnimation();
            }
        }
    }
    public void EmphasisHPReset()
    {
        for (int i = 0; i < HP; ++i)
        {
            HPAnims[i].IdleAnimation(true);
        }
        for (int i = HP; i < MaxHP; ++i)
        {
            HPAnims[i].IdleAnimation(false);
        }
    }
    protected virtual void Dead()
    {
        ForceActStop();
        SpineAC.PlayAnimationDead();
        PayAP();
        PayAP();
        if (CurNode != null)
        {
            CurNode.RealeseTile();
            CurNode = null;
        }
        PlayManager.Instance.AllUpdateSight();
        --PlayManager.Instance.SurvivorCount;
    }
    public void PayAP()
    {
        if (AP <= 0)
            return;

        APAnims[--AP].DecreaseAnimation();
    }
    public bool EmphasisAP(int Cost)
    {
        if (AP - Cost < 0)
            return false;

        for (int i = AP - 1; i >= AP - Cost; --i)
        {
            APAnims[i].EmphasisAnimation();
        }
        return true;
    }
    public void EmphasisAPReset()
    {
        for (int i = 0; i < AP; ++i)
        {
            APAnims[i].IdleAnimation(true);
        }
        for (int i = AP; i < MaxAP; ++i)
        {
            APAnims[i].IdleAnimation(false);
        }
    }
    public void EnemyHPEmphasis()
    {
        for (int i = 0; i < InvaderList.Count; ++i)
        {
            InvaderList[i].EmphasisHP(MaxPower);
        }
    }
    public void EnemyHPEmphasisReset()
    {
        for (int i = 0; i < InvaderList.Count; ++i)
        {
            InvaderList[i].EmphasisHPReset();
        }
    }
    public void EnemysUISwitch(bool isOpen)
    {
        if (isOpen)
        {
            for(int i=0;i< InvaderList.Count;++i)
            {
                InvaderList[i].OpenUI();
            }
        }
        else
        {
            for (int i = 0; i < InvaderList.Count; ++i)
            {
                InvaderList[i].CloseUI();
            }
        }
    }

    public virtual void PersonalUpdate()
    {
    }
    public virtual void Appear()
    {
    }
    //public virtual void Disappear()
    //{
    //}
}
