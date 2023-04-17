using UnityEngine;
using Spine.Unity;
using System.Collections;

public class SpineAnimator : MonoBehaviour
{
    //const string WeaponBoneName = "[base]weapon1";

    protected string CurAnim;
    //int Direction;
    public SkeletonAnimation SAnim;
    public BoneFollower follower;

    public float alpha;
    // Start is called before the first frame update
    void Start()
    {

    }

    public void PlayAnimation(string animationName, bool loop)
    {
        CurAnim = animationName;
        SAnim.state.SetAnimation(0, CurAnim, loop);
    }
    public bool IsPlaying(string animationName)
    {
        if (CurAnim == animationName)
            return true;
        return false;
    }
    public void SetAttatchment(string slotName, string slotAnimName)
    {
        SAnim.skeleton.SetAttachment(slotName, slotAnimName);
    }
    public void PlayAnimation(string animationName)
    {
        CurAnim = animationName;
        SAnim.state.SetAnimation(0, CurAnim, true);
    }
}
