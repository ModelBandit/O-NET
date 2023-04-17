using System.Collections;
using UnityEngine;
public class SpineAnimatorGhost : SpineAnimator
{
    [SerializeField]
    public MeshRenderer mesh;
    [SerializeField]
    private SpriteRenderer sprite;


    // Use this for initialization
    void Start()
    {
        mesh.material = new Material(mesh.material);
    }

    // Update is called once per frame
    void Update()
    {
        sprite.color = Color.white * alpha;
        mesh.material.SetColor("_Color", Color.white * alpha);
    }


}