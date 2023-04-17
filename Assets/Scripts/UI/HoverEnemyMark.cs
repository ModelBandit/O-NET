using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;
public class HoverEnemyMark : MonoBehaviour, IPointerEnterHandler
{
    [SerializeField]
    int index;
    public void OnPointerEnter(PointerEventData eventData)
    {
        UIManager.Instance.enemyListUI.SelectTarget(index);
        CameraController.Instance.TargetPosition = UIManager.Instance.enemyListUI.EnemyListPos[index];
    }
}