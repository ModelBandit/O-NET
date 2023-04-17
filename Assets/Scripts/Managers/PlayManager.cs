using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum StateFlow
{
    Search,
    Select,
    Command
}
public class PlayManager : Monosingleton<PlayManager>
{
    public bool outControll;//연출 생각하면 아래꺼랑 따로 필요
    public void SetOutControll(bool isOut)
    {
        outControll = isOut;
    }
    public bool isEnemyTurn;

    public StateFlow state;
    public void SetStateInt(int stateFlow)
    {
        switch (stateFlow)
        {
            case 0:
                state = StateFlow.Search;
                break;
            case 1:
                state = StateFlow.Select;
                break;
            case 2:
                state = StateFlow.Command;
                break;
        }
    }

    public Image Glow;
    public BackgroundResizer Resizer;
    public Material[] SightMats;
    public AgentManager agentManager;
    public InvaderManager invaderManager;
    public BulletManager bulletManager;


    public AgentComp NowActor
    {
        get
        {
            return ActList[ActIndex];
        }
    }
    public List<AgentComp> ActList;
    int ActIndex = 0;

    [SerializeField]
    GameObject FogPrefab;
    public void Contact(Transform parent)
    {
        GameObject go = Instantiate(FogPrefab, parent);
        Destroy(go, 2f);
        Animator animator = go.GetComponent<Animator>();
        animator.Play("Appear");
        ++ContactCount;
    }
    public bool inActList(AgentComp comp)
    {
        for (int i = 0; i < ActList.Count; ++i)
        {
            if (ActList[i] == comp)
                return true;
        }
        return false;
    }
    public bool ActerChange(AgentComp comp)
    {
        if (comp.AP <= 0)
            return false;

        for (int i = 0; i < ActList.Count; ++i)
        {
            for (int j = 0; j < agentManager.Agents.Length; ++j)
            {
                if (ActList[i] == comp && agentManager.Agents[j] == comp)
                {
                    ActIndex = i;
                    return true;
                }
            }
        }
        return false;
    }

    // Start is called before the first frame update
    void Start()
    {
        outControll = true;
        state = StateFlow.Search;
        //Debug.Log(new PathFinder().FindMovementTileDouble(NodeContainer.Instance.Map[new Vector2(0.5f, 0.5f)], 4).Count);
        UIManager.Instance.telegram.GameStart();
    }


    public List<IEnumerator> CoroutineList = new List<IEnumerator>();
    void Update()
    {
        for (int i = CoroutineList.Count-1; i >= 0;)
        {
            if (CoroutineList[i].MoveNext() == false)
                CoroutineList.RemoveAt(i--);
            break;
        }

        if (isEnemyTurn)
        {
            if(CoroutineList.Count <= 0)
            {
                if (ActOver())
                    TurnChange();
                else
                {
                    for (int i = 0; i < ActList.Count; ++i)
                    {
                        if (ActList[i].AP <= 0)
                            continue;
                        ActList[i].PersonalUpdate();
                        break;
                    }
                    Debug.Log($"코루틴 갯수 - {CoroutineList.Count}");
                }
            }
        }
        else
        {
            if (outControll)
            {
                CursorComp.Instance.OutControlCursorUpdate();
                CameraController.Instance.OutContorlCameraUpdate();
            }
            else
            {
                CursorComp.Instance.KeyInputUpdate();
                CursorComp.Instance.CursorUpdate();
                CameraController.Instance.CameraUpdate();
            }
            CameraController.Instance.updateScroll();
        }
        //if (Input.GetKeyDown(KeyCode.S))
        //{
        //    invaderManager.AllKill();
        //    if (ActOver())
        //    {
        //        Debug.Log("ActOver is True");
        //    }
        //}
        //if (Input.GetKeyDown(KeyCode.D))
        //{
        //    agentManager.AllKill();
        //    if(ActOver())
        //    {
        //        Debug.Log("ActOver is True");
        //    }
        //}

    }

    int commandIndex = -1;
    public int CommandIndex
    {
        get
        {
            return commandIndex;
        }
    }
    public void SetComandIndex(int index)
    {
        commandIndex = index;
    }
    public void CommandNowActor()
    {
        if (commandIndex < 0)
            return;
        if (NowActor.ActFunc != null)
            NowActor.ForceActStop();

        NowActor.ActNumber = commandIndex;
        switch (commandIndex)
        {
            case 0:
                if (NowActor.DestNode == null)
                    return;
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Move, NowActor.transform);
                NowActor.ActFunc = NowActor.MovePath();
                break;
            case 1:
                NowActor.ActFunc = NowActor.Attack();
                UIManager.Instance.EnemyCountReset();
                break;
            case 2:
                NowActor.ActFunc = NowActor.Overwatch();
                break;
            case 3:
                NowActor.ActFunc = NowActor.Reload();
                break;
            case 99:
                if (NowActor.DestNode == null)
                    return;
                NowActor.ActFunc = NowActor.MovePathDouble();
                break;
        }
        switch (commandIndex)
        {
            case 1:
            case 2:
            case 3:
                StartCoroutine(NowActor.ActFunc);
                break;
            case 0:
            case 99:
                CoroutineList.Add(NowActor.ActFunc);
                break;
        }

        NowActor.FinishedAct();
    }
    bool gameOver = false;
    public bool ActOver()
    {
        if (gameOver)
            return false;

        if (invaderManager.LiveInvader <= 0 || agentManager.LiveAgent <= 0)
        {
            //게임오버 표시
            if (invaderManager.LiveInvader <= 0)
            {
                UIManager.Instance.GameOver(true, SurvivorCount, HPCount, EnemyKillCount, HitCount);
                StartCoroutine(UIManager.Instance.telegram.GameClear());
            }

            else if (agentManager.LiveAgent <= 0)
            {
                UIManager.Instance.GameOver(false, SurvivorCount, HPCount, EnemyKillCount, HitCount);
                StartCoroutine(UIManager.Instance.telegram.GameOver());
            }
            gameOver = true;
            return false;
        }

        for (int i = 0; i < ActList.Count; ++i)
        {
            if (ActList[i].AP > 0)
            {
                return false;
            }
        }
        return true;
    }
    public void TurnChange()
    {
        if (isEnemyTurn)
        {
            outControll = true;
            CoroutineList.Add(AllyTurnChanger());
        }
        else
        {
            outControll = true;
            CoroutineList.Add(EnemyTurnChanger());
        }
    }
    IEnumerator EnemyTurnChanger()
    {
        UIManager.Instance.GlowRadarUI(true);
        yield return new WaitForSeconds(3f);

        isEnemyTurn = true;

        for (int i = 0; i < ActList.Count; ++i)
        {
            ActList[i].pPathFinder.BlueList = null;
            ActList[i].pPathFinder.OrangeList = null;
            ActList[i].pPathFinder.CalculateOver = false;
            ActList[i].ActNumber = -1;
        }
        UIManager.Instance.TurnChangeUI(isEnemyTurn);

        outControll = true;
        ActList = new List<AgentComp>();
        for (int i = 0; i < invaderManager.Invaders.Length; ++i)
        {
            if (invaderManager.Invaders[i].isDetected == false ||
                invaderManager.Invaders[i].HP <= 0)
                continue;

            invaderManager.Invaders[i].RestoreAP();
            invaderManager.Invaders[i].RestoreAP();
            ActList.Add(invaderManager.Invaders[i]);
        }

        float curTime = 0f;
        while (curTime < 1f)
        {
            curTime += Time.deltaTime;
            Glow.color = Color.Lerp(Glow.color, Color.red, curTime);
            yield return null;
        }


        UIManager.Instance.GlowRadarUI(false);
        yield return null;
        //Turn End
        yield break;
    }
    IEnumerator AllyTurnChanger()
    {
        UIManager.Instance.GlowRadarUI(true);
        for (int i = 0; i < ActList.Count; ++i)
        {
            ActList[i].pPathFinder.BlueList = new List<NodeComp>();
            ActList[i].pPathFinder.OrangeList = new List<NodeComp>();
            ActList[i].pPathFinder.CalculateOver = false;
            ActList[i].ActNumber = -1;
        }
        ActIndex = 0;
        ActList = new List<AgentComp>();
        for (int i = 0; i < agentManager.Agents.Length; ++i)
        {
            if (agentManager.Agents[i].HP <= 0)
                continue;
            agentManager.Agents[i].RestoreAP();
            agentManager.Agents[i].RestoreAP();
            agentManager.Agents[i].FindEnemy();
            ActList.Add(agentManager.Agents[i]);
        }
        for (int i = 0; i < ActList.Count; ++i)
        {
            CoroutineList.Add(ActList[i].pPathFinder.CoroutineFindPathDouble(
                ActList[i].CurNode, ActList[i].MovePoint * 2));
        }

        yield return new WaitForSeconds(3f);

        isEnemyTurn = false;


        UIManager.Instance.TurnChangeUI(isEnemyTurn);
        float curTime = 0f;
        while (curTime < 1f)
        {
            curTime += Time.deltaTime;
            Glow.color = Color.Lerp(Glow.color, Color.white, curTime);
            yield return null;
        }


        for (int i = 0; i < ActList.Count; ++i)
        {
            if (ActList[i].pPathFinder.CalculateOver == false)
                --i;

            yield return null;
        }

        outControll = false;
        UIManager.Instance.GlowRadarUI(false);
        yield return null;
        yield break;
    }
    public void RefreshActorsEnemyList()
    {
        for (int i = 0; i < ActList.Count; ++i)
        {
            ActList[i].FindEnemy();
        }
    }
    public void NowActorEnemyList(bool isOpen)
    {
        NowActor.EnemysUISwitch(isOpen);
    }
    public void NowActorTileOff()
    {
        NowActor.CloseTileUI();
    }
    public void NowActorEmpasisHP(int Cost)
    {
        NowActor.EmphasisHP(Cost);
    }
    public void NowActorEmpasisHPReset()
    {
        NowActor.EmphasisHPReset();
    }
    public void NowActorEmpasisAP(int Cost)
    {
        NowActor.EmphasisAP(Cost);
    }
    public void NowActorEmpasisAPReset()
    {
        NowActor.EmphasisAPReset();
    }
    public void NowActorEnemyHPEmpasis()
    {
        NowActor.EnemyHPEmphasis();
    }
    public void NowActorEnemyHPEmpasisReset()
    {
        NowActor.EnemyHPEmphasisReset();
    }

    public void NowActorSightVision(bool inSight)
    {
        NowActor.SightVision(inSight);
    }
    IEnumerator yieldbreak()
    {
        while(true)
        {
            Debug.Log("A");
            yield return null;
        }
    }

    public void AllUpdateSight()
    {
        agentManager.AllAgentsFindEnemy();
        invaderManager.AllInvadersFindEnemy();
    }
    public void SetActList(int index)
    {
        switch (index)
        {
            case 0:
                NowActorEmpasisAP(1);
                SetComandIndex(0);
                NowActorSightVision(false);
                UIManager.Instance.ActWindow.SetTitle("이동");
                UIManager.Instance.ActWindow.SetDetail("선택한 위치로 이동 합니다");
                break;
            case 1:
                if ((NowActor.ActUIBinary & 1) != 1)
                    return;
                NowActorEmpasisAP(1);
                SetComandIndex(1);
                UIManager.Instance.ActWindow.SetTitle("공격");
                UIManager.Instance.ActWindow.SetDetail($"대상을 공격합니다.\n(최대 {NowActor.MaxPower}피해)");
                UIManager.Instance.SetActListIndex(0);
                UIManager.Instance.ActWindow.OpenUI();//이동 될 수 있음
                NowActorSightVision(false);

                SetStateInt(2);//모드변경
                NowActorTileOff();
                UIManager.Instance.MatchEnemyCount();

                NowActorEnemyList(true);
                NowActorEmpasisAP(1);
                NowActorEnemyHPEmpasis();
                break;
            case 2:
                if ((NowActor.ActUIBinary & 2) != 2)
                    return;
                NowActorEmpasisAP(1);
                SetComandIndex(2);
                NowActor.AllSight.CheckSight();
                UIManager.Instance.ActWindow.SetTitle("경계");
                UIManager.Instance.ActWindow.SetDetail("명중패널티를 받고\n시야에 들어온\n첫번째 적을 공격합니다.");
                UIManager.Instance.SetActListIndex(1);
                UIManager.Instance.ActWindow.OpenUI();//이동 될 수 있음

                SetStateInt(2);//모드변경
                NowActorSightVision(true);

                NowActorTileOff();
                break;
            case 3:
                if ((NowActor.ActUIBinary & 4) != 4)
                    return;
                NowActorEmpasisAP(1);
                SetComandIndex(3);
                UIManager.Instance.ActWindow.SetTitle("재장전");
                UIManager.Instance.ActWindow.SetDetail("무기를 재장전 합니다.");
                UIManager.Instance.SetActListIndex(2);
                UIManager.Instance.ActWindow.OpenUI();//이동 될 수 있음
                NowActorSightVision(false);

                SetStateInt(2);//모드변경
                NowActorTileOff();
                break;
            case 99:
                NowActorEmpasisAP(2);
                SetComandIndex(99);
                NowActorSightVision(false);
                UIManager.Instance.ActWindow.SetTitle("돌진");
                UIManager.Instance.ActWindow.SetDetail("AP를 전부 소모하여\n선택한 위치로 이동 합니다");
                break;
        }
    }

    public int SurvivorCount;
    public int HPCount;
    public int EnemyKillCount;
    public int HitCount;
    public int ContactCount = 0;
    public void GameStart()
    {
        isEnemyTurn = true;
        TurnChange();

        SurvivorCount = agentManager.Agents.Length;
        HPCount = SurvivorCount * 5;

        EnemyKillCount = 0;
        HitCount = 0;
    }
}
