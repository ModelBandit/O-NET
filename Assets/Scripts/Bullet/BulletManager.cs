using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletManager : MonoBehaviour
{

    [SerializeField]
    GameObject bullet;
    [SerializeField]
    GameObject Boom;

    List<BulletComp> BulletList = new List<BulletComp>();
    List<BulletComp> BlindBulletList = new List<BulletComp>();
    [SerializeField]
    BoxCollider2D[] Walls;
    public void Shoot(bool isHit,Transform from, AgentComp Target)
    {
        GameObject go = Instantiate(bullet, (Vector2)from.position, Quaternion.identity, transform);

        BulletComp bc = go.GetComponent<BulletComp>();
        bc.Shoot(isHit, from, Target);

        if(isHit)
            BulletList.Add(bc);
        else
            BlindBulletList.Add(bc);
    }
    // Update is called once per frame
    void Update()
    {
        for (int i=0;i< BulletList.Count;++i)
        {
            if (BulletList[i] == null)
                continue;

            BulletList[i].BulletUpdate();
            if (BulletList[i].isInterect())
            {
                BulletList[i].Target.PayHP();
                Vector3 v3 = new Vector2(Random.Range(-0.3f, 0.3f), Random.Range(-0.3f, 0.3f));
                GameObject boom = Instantiate(Boom, BulletList[i].transform.position + v3, Quaternion.identity, transform);
                Destroy(boom, 0.5f);
                SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.Hit, boom.transform);
                Destroy(BulletList[i].gameObject);
                BulletList.RemoveAt(i--);
            }
        }

        for (int i = 0; i < BlindBulletList.Count; ++i)
        {
            if (BlindBulletList[i] == null)
                continue;

            BlindBulletList[i].BulletUpdate();
            for (int j = 0; j < Walls.Length; ++j)
            {
                if (BlindBulletList[i].isInterect(Walls[j].bounds))
                {
                    Vector3 v3 = new Vector2(Random.Range(-0.3f, 0.3f), Random.Range(-0.3f, 0.3f));
                    GameObject boom = Instantiate(Boom, BlindBulletList[i].transform.position + v3, Quaternion.identity, transform);
                    Destroy(boom, 0.5f);
                    SoundManager.Instance.Play(SoundType.SE, StringComplex.SEString.BlindHit, boom.transform);
                    Destroy(BlindBulletList[i].gameObject);
                    BlindBulletList.RemoveAt(i--);
                    break;
                }
            }
        }
    }
    Vector3 GetVectorFromAngle(float angle)
    {
        float angleRad = angle * (Mathf.PI / 180f);
        return new Vector3(Mathf.Cos(angleRad), Mathf.Sin(angleRad));
    }
}