using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class CursorComp : Monosingleton<CursorComp>
{
    [SerializeField]
    SpriteRenderer renderer;
    public Color RendererColor
    {
        get
        {
            if (renderer == null)
                return Color.white;

            return renderer.color;
        }
        set
        {
            if (renderer == null)
                return;
            renderer.color = value;
        }
    }

    AgentComp HoverAgent;
    bool ClickLock;

    // Start is called before the first frame update
    void Start()
    {
        ClickLock = false;
    }

    // Update is called once per frame
    public void CursorUpdate()
    {
        UpdateRaycast();
        if (PlayManager.Instance.NowActor != null)
        {
            switch (PlayManager.Instance.state)
            {
                case StateFlow.Search:
                    break;
                case StateFlow.Select:
                    if (Input.GetMouseButtonDown(1))
                    {
                        RightCursorUpdateSelect();
                    }
                    break;
                case StateFlow.Command:
                    if (Input.GetMouseButtonDown(0))
                    {
                        //다시 클릭시, 확인완료 처리
                        LeftCursorUpdateCommand();
                    }
                    if (Input.GetMouseButtonDown(1))
                    {
                        RightCursorUpdateCommand();
                    }
                    break;
            }
        }
        if (Input.GetMouseButtonDown(0) || Input.GetMouseButtonDown(1))
        {
            SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Click);
        }
    }
    private KeyCode[] keyCodes = {
         KeyCode.Alpha1,
         KeyCode.Alpha2,
         KeyCode.Alpha3,
         KeyCode.Alpha4,
         KeyCode.Alpha5,
         KeyCode.Alpha6,
         KeyCode.Alpha7,
         KeyCode.Alpha8,
         KeyCode.Alpha9,
     };

    public void KeyInputUpdate()
    {
        if (Input.anyKeyDown)
        {
            SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Click);
        }
        for (int i = 0; i < keyCodes.Length; i++)
        {
            if (Input.GetKeyDown(keyCodes[i]))
            {
                int numberPressed = i + 1;

                switch (PlayManager.Instance.state)
                {
                    case StateFlow.Search:
                        break;
                    case StateFlow.Select:
                    case StateFlow.Command:
                        PlayManager.Instance.SetActList(numberPressed);
                        break;
                }

            }
        }
        switch (PlayManager.Instance.state)
        {
            case StateFlow.Search:
                if (Input.GetKey(KeyCode.W))
                {
                    CameraController.Instance.MainCameraPosition.y += CameraController.Instance.Speed * Time.deltaTime;
                }
                if (Input.GetKey(KeyCode.S))
                {
                    CameraController.Instance.MainCameraPosition.y -= CameraController.Instance.Speed * Time.deltaTime;
                }
                if (Input.GetKey(KeyCode.A))
                {
                    CameraController.Instance.MainCameraPosition.x -= CameraController.Instance.Speed * Time.deltaTime;
                }
                if (Input.GetKey(KeyCode.D))
                {
                    CameraController.Instance.MainCameraPosition.x += CameraController.Instance.Speed * Time.deltaTime;
                }
                break;
            case StateFlow.Select:
                break;
            case StateFlow.Command:
                if (Input.GetKeyDown(KeyCode.Space))
                {
                    PlayManager.Instance.CommandNowActor();
                    UIManager.Instance.ActWindow.CloseUI();
                }
                break;
        }
    }
    public void OutControlCursorUpdate()
    {

    }
    private void LeftCursorUpdateSearch()
    {
        PlayManager.Instance.state = StateFlow.Select;
        PlayManager.Instance.NowActor.OpenUI();
        PlayManager.Instance.NowActor.OpenTileUI();
        UIManager.Instance.ActorInfoMatch();
        renderer.color = Color.white;

        CameraController.Instance.TargetPosition //이건 대상 설정시에 동작하도록 이동
            = PlayManager.Instance.NowActor.transform.position;
        CameraController.Instance.MainCameraPosition //이건 대상 설정시에 동작하도록 이동
            = PlayManager.Instance.NowActor.transform.position;
    }
    private void RightCursorUpdateSelect()
    {
        PlayManager.Instance.state = StateFlow.Search;
        PlayManager.Instance.NowActor.CloseUI();
        PlayManager.Instance.NowActor.CloseTileUI();
        UIManager.Instance.ActerInfoReset();
        PlayManager.Instance.NowActor.EnemysUISwitch(false);
        PlayManager.Instance.NowActor.EmphasisHPReset();
        PlayManager.Instance.NowActor.EnemyHPEmphasisReset();
        CameraController.Instance.TargetToMain();
        renderer.color = Color.blue;
    }
    private void LeftCursorUpdateCommand()
    {
        //버튼이 켜진상태나 이동경로가 켜진상태
    }
    private void RightCursorUpdateCommand()
    {
        PlayManager.Instance.state = StateFlow.Select;
        PlayManager.Instance.NowActor.OpenTileUI();
        PlayManager.Instance.NowActor.SightVision(false);
        UIManager.Instance.EnemyCountReset();
        UIManager.Instance.ActWindow.CloseUI();
        PlayManager.Instance.NowActorEnemyHPEmpasisReset();
        PlayManager.Instance.NowActorEmpasisAPReset();

        CameraController.Instance.TargetPosition //이건 대상 설정시에 동작하도록 이동
            = PlayManager.Instance.NowActor.transform.position;
        CameraController.Instance.MainCameraPosition //이건 대상 설정시에 동작하도록 이동
            = PlayManager.Instance.NowActor.transform.position;
    }
    private void OutControllUpdate()
    {
    }

    public void UpdateRaycast()
    {
        if (EventSystem.current.IsPointerOverGameObject())
            return;

        var focusedTilehit = GetFocusedOnTile();

        if (focusedTilehit.HasValue)
        {
            transform.position = focusedTilehit.Value.collider.transform.position;

            AgentComp comp = focusedTilehit.Value.collider.GetComponent<AgentComp>();

            switch (PlayManager.Instance.state)
            {
                case StateFlow.Search:
                    if (comp != null && ClickLock == false)
                    {
                        if (comp.HP <= 0 || comp.isDetected == false)
                            return;

                        if (HoverAgent != null && HoverAgent != comp)
                        {
                            HoverAgent.CloseUI();
                        }

                        HoverAgent = comp;
                        HoverAgent.OpenUI();
                        UIManager.Instance.ActerInfoMatch(HoverAgent);
                    }
                    else if (comp == null && HoverAgent != null && ClickLock == false)
                    {
                        HoverAgent.CloseUI();
                    }

                    if (HoverAgent != null)
                    {
                        if(Input.GetMouseButtonDown(0))
                        {
                            if(PlayManager.Instance.ActerChange(HoverAgent))
                            {
                                //NodeComp node = NodeContainer.Instance.Map[focusedTilehit.Value.collider.transform.position];
                                //HoverAgent.DestNode = node;
                                //HoverAgent.ActivatePathFinder();
                                LeftCursorUpdateSearch();
                            }
                            else
                            {
                                HoverAgent.SightVision(true);
                                ClickLock = true;
                            }
                        }
                        else if (Input.GetMouseButtonDown(1) && ClickLock == true)
                        {
                            HoverAgent.DestNode = null;
                            HoverAgent.CloseUI();
                            HoverAgent.SightVision(false);
                            HoverAgent = null;
                            ClickLock = false;
                            UIManager.Instance.ActerInfoReset();
                        }
                    }
                    break;
                case StateFlow.Select:
                    if (Input.GetMouseButtonDown(0))
                    {
                        if (NodeContainer.Instance.Map.ContainsKey(focusedTilehit.Value.collider.transform.position) == false)
                            return;

                        for(int i = 0;i<PlayManager.Instance.invaderManager.Invaders.Length;++i)
                        {
                            if (PlayManager.Instance.invaderManager.Invaders[i].transform.position.Equals(
                                focusedTilehit.Value.collider.transform.position))
                                return;
                        }
                        for (int i = 0; i < PlayManager.Instance.agentManager.Agents.Length; ++i)
                        {
                            if (PlayManager.Instance.agentManager.Agents[i].transform.position.Equals(
                                focusedTilehit.Value.collider.transform.position))
                                return;
                        }
                        //UI버튼 + 윈도우 활성화 or 이동경로타일만 활성화를 하고 확인대기

                        NodeComp node = NodeContainer.Instance.Map[focusedTilehit.Value.collider.transform.position];
                        PlayManager.Instance.NowActor.DestNode = node;

                        int PathCount = PlayManager.Instance.NowActor.ActivatePathFinder();
                        if(PathCount <= PlayManager.Instance.NowActor.MovePoint)
                        {
                            PlayManager.Instance.SetActList(0);
                        }
                        else if (PathCount <= PlayManager.Instance.NowActor.MovePoint * 2
                            && PlayManager.Instance.NowActor.AP >= 2)
                        {
                            PlayManager.Instance.SetActList(99);
                        }
                        else
                        {
                            PlayManager.Instance.NowActor.DestNode = null;
                            return;
                        }

                        renderer.color = Color.green;
                        PlayManager.Instance.state = StateFlow.Command;
                        PlayManager.Instance.NowActor.OnlyPathOn();
                        UIManager.Instance.ActWindow.OpenUI();
                    }
                    break;
                case StateFlow.Command:
                    if (Input.GetMouseButtonDown(0))
                    {
                        if (PlayManager.Instance.CommandIndex == 0)
                        {
                            if (NodeContainer.Instance.Map.ContainsKey(focusedTilehit.Value.collider.transform.position) == false)
                                return;
                            //UI버튼 + 윈도우 활성화 or 이동경로타일만 활성화를 하고 확인대기
                            NodeComp node = NodeContainer.Instance.Map[focusedTilehit.Value.collider.transform.position];
                            if (PlayManager.Instance.NowActor.DestNode == node)
                            {
                                renderer.color = Color.white;
                                PlayManager.Instance.CommandNowActor();
                            }
                        }
                    }
                    break;
            }
        }
    }

    //#1 마우스 위치 문제로 오류 발생함 빌드하면 괜찮아짐
    public RaycastHit2D? GetFocusedOnTile()
    {
        Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        Vector2 mousePos2d = new Vector2(mousePos.x, mousePos.y);

        RaycastHit2D[] hits = Physics2D.RaycastAll(mousePos2d, Vector2.zero);

        if (hits.Length > 0)
        {
            return hits.OrderByDescending(i => i.collider.transform.position.z).First();
        }

        return null;
    }
    
}
