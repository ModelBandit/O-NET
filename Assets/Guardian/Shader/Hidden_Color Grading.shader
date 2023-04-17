//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Color Grading" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_HueShift ("Hue", Float) = 0
_Saturation ("Saturation", Float) = 0
_Contrast ("Constarst", Float) = 0
_ColorBalance ("Color Balance", Color) = (1,1,1,1)
_ColorFilter ("Color Filter", Color) = (1,1,1,1)
_ChannelMixerRed ("Channel Mixer Red", Vector) = (1,0,0,0)
_ChannelMixerGreen ("Channel Mixer Green", Vector) = (0,1,0,0)
_ChannelMixerBlue ("Channel Mixer Blue", Vector) = (0,0,1,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 25913
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat10_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat10_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat10_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.x>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
#endif
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.x>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
#endif
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _HueShift;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec3 _ColorBalance;
uniform 	mediump vec3 _ColorFilter;
uniform 	mediump vec3 _ChannelMixerRed;
uniform 	mediump vec3 _ChannelMixerGreen;
uniform 	mediump vec3 _ChannelMixerBlue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + vec3(1.525878e-05, 1.525878e-05, 1.525878e-05);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    u_xlat16_4.xyz = log2(u_xlat16_2.xyz);
    u_xlatb1.xyz = lessThan(u_xlat16_2.xyzx, vec4(3.05175708e-05, 3.05175708e-05, 3.05175708e-05, 0.0)).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz + vec3(9.72000027, 9.72000027, 9.72000027);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0570776239, 0.0570776239, 0.0570776239);
    {
        vec4 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_3.x : u_xlat16_2.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_3.y : u_xlat16_2.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_3.z : u_xlat16_2.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat1.xyz = u_xlat16_2.xyz + vec3(-0.413588405, -0.413588405, -0.413588405);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast)) + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(17.5200005, 17.5200005, 17.5200005) + vec3(-9.72000027, -9.72000027, -9.72000027);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat1.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorBalance.xyz;
    u_xlat1.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat16_2.xyz);
    u_xlat1.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat16_2.xyz);
    u_xlat1.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat1.xyz * _ColorFilter.xyz;
    u_xlat1.x = dot(u_xlat16_2.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat16_2.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat16_2.xyz, _ChannelMixerBlue.xyz);
    u_xlat16_1.xyw = max(u_xlat1.yzx, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.x>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_1.x>=u_xlat16_1.y;
#endif
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_4.xy = u_xlat16_1.xy + (-u_xlat16_3.xy);
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_4.z = float(1.0);
    u_xlat16_4.w = float(-1.0);
    u_xlat16_2 = u_xlat16_2.xxxx * u_xlat16_4 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_3.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_3.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_2.x = u_xlat16_1.x + (-u_xlat16_2.x);
    u_xlat5.x = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_8.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat5.x = u_xlat16_8.x / u_xlat5.x;
    u_xlat5.x = u_xlat16_1.z + u_xlat5.x;
    u_xlat16_8.x = abs(u_xlat5.x) + _HueShift;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat16_1.x + 9.99999975e-05;
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz + (-vec3(u_xlat16_20));
    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_2.xyz + vec3(u_xlat16_20);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_2.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
}
}
}