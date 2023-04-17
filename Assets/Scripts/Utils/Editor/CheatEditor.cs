using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Cheat))]
public class CheatEditor : Editor
{
    Cheat module = null;

    private void OnEnable()
    {
        module = target as Cheat;
    }

    public override void OnInspectorGUI()
    {
        if(GUILayout.Button("Active"))
        {
            module.Active();
        }

    }
}
