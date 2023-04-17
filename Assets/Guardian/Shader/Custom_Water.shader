//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Water" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
_MainTex ("Normalmap", 2D) = "bump" { }
_LightMax ("Light Max", Range(0, 1)) = 0
_LightMin ("Light Min", Range(0, 1)) = 0
_GradationTop ("Gradation Top", Float) = 1
_GradationBottom ("Gradation Bottom", Float) = 0
_Speed ("Wave Speed", Float) = 0.5
_Amount ("Wave Amount", Range(0, 1)) = 0.5
_Height ("Wave Height", Range(0, 1)) = 0.5
_Speed2 ("Wave2 Speed", Float) = 0.5
_Amount2 ("Wave2 Amount", Range(0, 1)) = 0.5
_Height2 ("Wave2 Height", Range(0, 1)) = 0.5
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 51043
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COORDINATE0;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_COORDINATE0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COORDINATE0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_COORDINATE0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COORDINATE0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump float _Amount;
uniform 	mediump float _Height;
uniform 	mediump float _Speed2;
uniform 	mediump float _Amount2;
uniform 	mediump float _Height2;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_COORDINATE0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat2.xy = _Time.zz * vec2(_Speed, _Speed2);
    u_xlat0.y = u_xlat0.x * _Amount + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * _Amount2 + u_xlat2.y;
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat2.x = u_xlat0.y * _Height + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _Height2 + u_xlat2.x;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    vs_COORDINATE0.z = u_xlat0.x;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COORDINATE0.xyw = in_POSITION0.xyw;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _SinTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _LightMax;
uniform 	mediump float _LightMin;
uniform 	mediump float _GradationTop;
uniform 	mediump float _GradationBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COORDINATE0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.x = _SinTime.w + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4.xy = (-vec2(_LightMin, _LightMax)) + vec2(1.0, 1.0);
    u_xlat0.x = u_xlat0.x * _LightMax + u_xlat4.y;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.y = 1.0;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.y = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_2.xz = u_xlat16_1.xx * vec2(0.0, 1.0);
    u_xlat0.xyz = vs_COORDINATE0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_COORDINATE0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_COORDINATE0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * vs_COORDINATE0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyw = u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.z = u_xlat0.z + 4.0;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_1.yz, u_xlat16_2.yz);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xz = u_xlat0.xz * vec2(25.0, 0.125);
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_5 = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xxx * _Color.xyz;
    u_xlat16_2.x = log2(u_xlat16_5);
    u_xlat16_2.x = u_xlat16_2.x * 25.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat0.x + u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.75;
    u_xlat4.x = u_xlat16_2.x * 0.75 + _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat16_1.xzw * vec3(u_xlat16_5) + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-_GradationBottom) + _GradationTop;
    u_xlat0.x = u_xlat0.z * u_xlat16_2.x + _GradationBottom;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
}
}
}