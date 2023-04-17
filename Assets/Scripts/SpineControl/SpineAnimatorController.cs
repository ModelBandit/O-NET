using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpineAnimatorController : MonoBehaviour
{
    int direction;
    public int Direction
    {
        get { return direction; }
        set 
        { 
            direction = value;

        }
    }
    [SerializeField]
    public SpineAnimator[] Animators;
    public SpineAnimator DirAnimator
    {
        get
        {
            return Animators[direction];
        }
    }
    [SerializeField]
    Transform[] Muzzles;
    public Transform DirMuzzle
    {
        get
        {
            return Muzzles[direction];
        }
    }
    // Start is called before the first frame update

    public virtual void SelectSetActive()
    {
        for(int i=0;i< Animators.Length;++i)
        {
            if (direction == i)
                continue;
            Animators[i].gameObject.SetActive(false);
        }
        Animators[direction].gameObject.SetActive(true);
    }

    public void PlayAnimation(string name, bool loop)
    {
        string dir = string.Empty;
        if (direction == 0)
            dir = "_front";
        else if (direction == 1)
            dir = "_back";
        else if (direction >= 2)
            dir = "_side";

        SelectSetActive();
        Animators[direction].PlayAnimation($"{name}{dir}", loop);
    }
    public void PlayAnimationDead()
    {
        direction = 2;
        SelectSetActive();
        Animators[direction].follower.gameObject.SetActive(false);
        Animators[direction].PlayAnimation($"dead_side", false);
        PlayAttatchment("[base]face", "[base]damaged");
    }
    public void PlayAttatchment(string slotName, string slotAnimName)
    {
        string dir = string.Empty;
        if (direction == 0)
            dir = "front";
        else if (direction == 1)
            return;
        else if (direction >= 2)
            dir = "side";

        Animators[direction].SetAttatchment(slotName, $"{dir}/face/{slotAnimName}");
    }
    public bool IsPlaying(string name)
    {
        return Animators[direction].IsPlaying($"{name}");
    }
}


/*
 * 
 * */