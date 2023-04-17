using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class FieldOfView : MonoBehaviour
{
    [SerializeField] 
    protected LayerMask mask;
    [SerializeField]
    public float viewDistance;
    [SerializeField]
    protected float startAngle;
    [SerializeField]
    protected float fov;
    [SerializeField]
    protected int rayCount;
    [SerializeField]
    private MeshCollider meshCollider;

    protected Mesh mesh;
    Vector3 origin;
    // Start is called before the first frame update
    void Awake()
    {
        mesh = new Mesh();
        GetComponent<MeshFilter>().sharedMesh = mesh;
        meshCollider.sharedMesh = mesh;
        origin = transform.position;
    }
    // Update is called once per frame
    //void LateUpdate()
    //{
    //    CheckSight();
    //    //for (int i = 0; i < mesh.triangles.Length; ++i)
    //    //{
    //    //    Debug.Log($"{i} - { mesh.vertices[mesh.triangles[i]]}");
    //    //    if(i >= mesh.triangles.Length-1)
    //    //        Debug.DrawLine(mesh.vertices[mesh.triangles[i]], mesh.vertices[mesh.triangles[0]]);
    //    //    else
    //    //        Debug.DrawLine(mesh.vertices[mesh.triangles[i]], mesh.vertices[mesh.triangles[i + 1]]);
    //    //}
    //    //GetComponent<MeshCollider>().sharedMesh = mesh;
    //}

    public void CheckSight()
    {
        origin = transform.position;
        float angle = startAngle;
        float angleIncrease = fov / rayCount;


        Vector3[] vertices = new Vector3[rayCount + 1 + 1];
        Vector2[] uv = new Vector2[vertices.Length];
        int[] triangles = new int[rayCount * 3];

        vertices[0] = origin;

        int vertexIndex = 1;
        int triangleIndex = 0;
        for (int i = 0; i <= rayCount; ++i, ++vertexIndex)
        {
            Vector3 vertex = origin + GetVectorFromAngle(angle) * viewDistance;

            RaycastHit2D hit = Physics2D.Raycast(origin, GetVectorFromAngle(angle), viewDistance, mask);
            if(hit.collider == null)
            {
                vertex = origin + GetVectorFromAngle(angle) * viewDistance;
            }
            else
            {
                //RaycastHit hit = hits.OrderByDescending(i => i.collider.transform.position.z).First();
                vertex = hit.point;
            }

            vertices[vertexIndex] = vertex;

            if (i > 0)
            {
                triangles[triangleIndex + 0] = 0;
                triangles[triangleIndex + 1] = vertexIndex - 1;
                triangles[triangleIndex + 2] = vertexIndex;
                triangleIndex += 3;
            }


            angle -= angleIncrease;
        }

        for (int i = 0; i < vertices.Length; ++i)
        {
            //Debug.Log($"Àü {i} - { vertices[i]}");
            vertices[i] -= transform.position;
        }
        mesh.vertices = vertices;
        mesh.uv = uv;
        mesh.triangles = triangles;

        meshCollider.sharedMesh = mesh;
        //for (int i = 0; i < mesh.vertices.Length; ++i)
        //{
        //    Debug.Log($"ÈÄ {i} - { mesh.vertices[i]}");
        //}
    }

    public void MatChange(Material mat)
    {
        GetComponent<MeshRenderer>().material = mat;
    }
    Vector3 GetVectorFromAngle(float angle)
    {
        float angleRad = angle * (Mathf.PI / 180f);
        return new Vector3(Mathf.Cos(angleRad), Mathf.Sin(angleRad));
    }
}
