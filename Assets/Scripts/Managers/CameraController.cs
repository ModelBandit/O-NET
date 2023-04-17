using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class CameraController : Monosingleton<CameraController>
{
    public Vector3 TargetPosition = Vector3.zero;

    readonly float BeginViewSize = 7f;
    readonly float BeginViewX = 0f;
    readonly float BeginViewY = 0f;

    readonly float GapViewSize = 4f;
    readonly float GapViewX = 8.5f;
    readonly float GapViewY = 4.5f;

    public readonly float DefaultSpeed = 15f;
    public float Speed;//옵션에서 수정가능하게 할 것
    readonly int Range = 10;

    float viewSize;
    public float MinViewX;
    public float MaxViewX;

    public float MinViewY;
    public float MaxViewY;


    [Range(0,1)]
    public float Value;

    public Vector3 MainCameraPosition;

    public AudioSource[] Speakers;

    // Start is called before the first frame update
    void Start()
    {
        MainCameraPosition = Camera.main.transform.position;
        Speed = DefaultSpeed;
    }

    // Update is called once per frame
    public void CameraUpdate()
    {
        switch (PlayManager.Instance.state)
        {
            case StateFlow.Search:
                UpdateSightFree();
                break;
            case StateFlow.Select:
            case StateFlow.Command:
                transform.position = Vector3.Lerp(transform.position, TargetPosition + Vector3.back * 10, Time.deltaTime * 2);
                break;
        }

        Speed = DefaultSpeed - (BeginViewSize - viewSize);
    }

    public float OutControlview;
    public void OutContorlCameraUpdate()
    {
        transform.position = Vector3.Lerp(transform.position, TargetPosition + Vector3.back * 10, Time.deltaTime * 3);
        Value = Mathf.Lerp(Value, OutControlview, Time.deltaTime * 3);

        viewSize = BeginViewSize - (GapViewSize * Value);
        Camera.main.orthographicSize = viewSize;
    }
    private Vector3 StartPos;
    private Vector3 MousePos;

    //#1 빌드 전 상태에서 카메라 위치문제로 오류 발생함
    public void UpdateSightFree()
    {
        if (EventSystem.current.IsPointerOverGameObject())
            return;

        if (Input.GetMouseButton(1))
        {
            MainCameraPosition.x -= Input.GetAxis("Mouse X");
            MainCameraPosition.y -= Input.GetAxis("Mouse Y");
        }

        else
        {
            //5.4   0   0
            //1.5 6.9 3.9

            //float deltaTime = PlayManager.Instance.DeltaTime;

            if (Input.mousePosition.x > Screen.width - Range)
            {
                MainCameraPosition.x += Speed * Time.deltaTime;
            }
            else if (Input.mousePosition.x < Range)
                MainCameraPosition.x -= Speed * Time.deltaTime;

            if (Input.mousePosition.y > Screen.height - Range)
                MainCameraPosition.y += Speed * Time.deltaTime;
            else if (Input.mousePosition.y < Range)
                MainCameraPosition.y -= Speed * Time.deltaTime;


        }
        if (MainCameraPosition.x > MaxViewX)
            MainCameraPosition.x = MaxViewX;
        else if (MainCameraPosition.x < MinViewX)
            MainCameraPosition.x = MinViewX;

        if (MainCameraPosition.y > MaxViewY)
            MainCameraPosition.y = MaxViewY;
        else if (MainCameraPosition.y < MinViewY)
            MainCameraPosition.y = MinViewY;

        transform.position = Vector3.Lerp(transform.position, MainCameraPosition + Vector3.back * 10, Time.deltaTime * 10);
    }

    public void updateScroll()
    {
        if (Input.GetAxis("Mouse ScrollWheel") != 0f)
        {
            Value += Input.GetAxis("Mouse ScrollWheel");

            if (Value < 0)
                Value = 0;
            else if (Value > 1f)
                Value = 1;
        }

        viewSize = BeginViewSize - (GapViewSize * Value);
        Camera.main.orthographicSize = viewSize;
    }

    public void TargetToMain()
    {
        MainCameraPosition = transform.position;
        //PlayManager.Instance.CoroutineList.Add(TargetPosToMainPos());
    }
    public void MainToTarget()
    {
        TargetPosition = MainCameraPosition;
        //PlayManager.Instance.CoroutineList.Add(TargetPosToMainPos());
    }

    IEnumerator TargetPosToMainPos()
    {
        float t = 0f;

        while(t < 1f)
        {
            t += Time.deltaTime * 2;
            TargetPosition = Vector3.Lerp(TargetPosition, MainCameraPosition, t);
            yield return null;
        }

        yield break;
    }
}
