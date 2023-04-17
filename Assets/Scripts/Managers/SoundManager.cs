using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum SoundType
{
    BGM,
    SE,
    Voice
}

public class SoundManager : Monosingleton<SoundManager>
{
    [SerializeField]
    public AudioSource[] Speaker;

    [SerializeField]
    public HolderList BGM;
    [SerializeField]
    public HolderList SE;
    [SerializeField]
    public HolderList Voice;

    [System.Serializable]
    public class AudioClipHolder
    {
        public string CallName;
        public AudioClip Clip;

        public AudioClipHolder(string CallName, AudioClip Clip)
        {
            this.CallName = CallName;
            this.Clip = Clip;
        }
    }
    [System.Serializable]
    public class HolderList
    {
        public List<AudioClipHolder> Holder;

        public AudioClip this[string key]
        {
            get => GetValue(key);
            set => SetValue(key, value);
        }
        private AudioClip GetValue(string key)
        {
            for (int i = 0; i < Holder.Count; ++i)
            {
                if (Holder[i].CallName == key)
                    return Holder[i].Clip;
            }
            return null;
        }
        private void SetValue(string key, AudioClip clip)
        {
            for (int i = 0; i < Holder.Count; ++i)
            {
                if (Holder[i].CallName == key)
                {
                    Debug.LogError("Exist Same CallName Audio");
                    return;
                }
            }
            Holder.Add(new AudioClipHolder(key, clip));
        }
    }

    void Start()
    {
        DontDestroyOnLoad(this);
        //Play(SoundType.BGM, StringComplex.BGMString.Mission_Start);
        //Play(SoundType.Voice, StringComplex.VoiceString.Knight_Mission_Start);
    }

    public void Play(SoundType type, string name)
    {
        switch (type)
        {
            case SoundType.BGM:
                Speaker[0].clip = BGM[name];
                Speaker[0].Play();
                break;
            case SoundType.SE:
                Speaker[1].clip = SE[name];
                Speaker[1].Play();
                break;
            case SoundType.Voice:
                Speaker[2].clip = Voice[name];
                Speaker[2].Play();
                break;
        }
    }
    public void Play(SoundType type, string name, Transform parent)
    {
        GameObject go = new GameObject(name);
        go.transform.position = parent.position;
        go.transform.parent = parent;

        AudioSource audio = go.AddComponent<AudioSource>();

        switch (type)
        {
            case SoundType.BGM:
                audio.clip = BGM[name];
                Speaker[0].Play();
                break;
            case SoundType.SE:
                audio.clip = SE[name];
                break;
            case SoundType.Voice:
                audio.clip = Voice[name];
                break;
        }

        audio.maxDistance = 30f;
        audio.spatialBlend = 1f;
        audio.rolloffMode = AudioRolloffMode.Linear;
        audio.dopplerLevel = 0f;

        audio.Play();
        Destroy(go, audio.clip.length);
    }
    public bool isPlaying(SoundType type, string name)
    {
        switch (type)
        {
            case SoundType.BGM:
                if (Speaker[0].clip != null &&
                    Speaker[0].time < Speaker[0].clip.length)
                    return true;
                break;
            case SoundType.SE:
                if (Speaker[1].clip != null &&
                    Speaker[1].time < Speaker[1].clip.length)
                    return true;
                break;
            case SoundType.Voice:
                if (Speaker[2].clip != null &&
                    Speaker[2].time < Speaker[2].clip.length)
                    return true;
                break;
        }
        return false;
    }
}
