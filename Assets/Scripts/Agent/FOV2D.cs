using System.Collections;
using UnityEngine;
public class FOV2D : FieldOfView
{
    [SerializeField]
    private PolygonCollider2D PolygonCollider;

    Vector3 origin;
    // Start is called before the first frame update
    void Awake()
    {
        mesh = new Mesh();
        GetComponent<MeshFilter>().sharedMesh = mesh;

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

    private void Update()
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
            if (hit.collider == null)
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
            //Debug.Log($"전 {i} - { vertices[i]}");
            vertices[i] -= transform.position;
        }
        mesh.vertices = vertices;
        mesh.uv = uv;
        mesh.triangles = triangles;

        PolygonCollider.pathCount = vertices.Length;
        PolygonCollider.SetPath(0, System.Array.ConvertAll<Vector3, Vector2>(vertices, ConvertV2ToV3));

        //PolygonCollider.sharedMesh = mesh;
        //for (int i = 0; i < mesh.vertices.Length; ++i)
        //{
        //    Debug.Log($"후 {i} - { mesh.vertices[i]}");
        //}
    }
    public Vector2 ConvertV2ToV3(Vector3 v3Pos)
    {
        return new Vector2(v3Pos.x, v3Pos.y);
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
