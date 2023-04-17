using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletComp : MonoBehaviour
{
    [SerializeField]
    BoxCollider2D collider;
    [SerializeField]
    int Speed;
    Vector3 way;
    bool isHit;
    public bool IsHit
    {
        get
        {
            return isHit;
        }
    }

    [SerializeField]
    public AgentComp Target;
    // Start is called before the first frame update
    public void Shoot(bool ishit, Transform from, AgentComp Target)
    {
        this.Target = Target;
        isHit = ishit;
        if (ishit)
        {
            way = new Vector3(Target.BodyPoint.position.x - from.position.x,
                Target.BodyPoint.position.y - from.position.y,
                0);
        }
        else
        {
            Vector3 v3 = new Vector2(Random.Range(-1f, 1f), Random.Range(-1f, 1f));
            way = new Vector3(Target.BodyPoint.position.x - from.position.x + v3.x,
                Target.BodyPoint.position.y - from.position.y + v3.y,
                0);
        }
        way.Normalize();
    }

    public bool isInterect()
    {
        Bounds bounds = Target.GetComponent<BoxCollider2D>().bounds;
        if (collider.bounds.Intersects(bounds))
            return true;

        return false;
    }
    public bool isInterect(Bounds bounds)
    {
        if (collider.bounds.Intersects(bounds))
            return true;

        return false;
    }

    public void BulletUpdate()
    {
        transform.position += way * Speed * Time.deltaTime;
    }
    IEnumerator MissTarget()
    {
        yield return null;
        yield break;
    }


    // Update is called once per frame
    void Update()
    {

    }
}
