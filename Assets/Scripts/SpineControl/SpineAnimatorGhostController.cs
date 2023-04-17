using System.Collections;
using UnityEngine;

namespace Assets.Scripts.SpineControl
{
    public class SpineAnimatorGhostController : SpineAnimatorController
    {
        public override void SelectSetActive()
        {
            for (int i = 0; i < Animators.Length; ++i)
            {
                if (Direction == i)
                    continue;
                Animators[i].alpha = 0;
            }
            DirAnimator.alpha = 1f;
        }
    }
}