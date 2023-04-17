using UnityEngine;
using System.Collections.Generic;
public class Monosingleton<T>  : MonoBehaviour where T : MonoBehaviour
{
    private static T instance = null;
    public static T Instance
    {
        get
        {
            instance = (T)FindObjectOfType(typeof(T));

            if (FindObjectsOfType(typeof(T)).Length > 1)
                return instance;

            if (instance == null)
            {
                GameObject go = new GameObject();
                instance = go.AddComponent<T>();
                go.name = typeof(T).Name;
            }
            return instance;
        }
    }

    void Awake()
    {
        if (instance != null && instance != this)
        {
            Destroy(this.gameObject);
        }
    }
}
