//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/Vignette" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,0,0,1)
_Intensity ("Intensity", Range(0, 1)) = 1
_Smoothness ("Smoothness", Range(0, 5)) = 0.5
_Roundness ("Roundness", Range(0, 1)) = 0.5
_Cutoff ("Cutoff", Range(0, 0.5)) = 0.375
_FitAspectRatio ("FitAspectRatio", Range(0, 1)) = 1
_Radius ("Radius", Float) = 0.5
}
SubShader {
 Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 19848
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec4 unity_OrthoParams;
uniform 	mediump vec4 _Color;
uniform 	float _Intensity;
uniform 	float _Smoothness;
uniform 	float _Roundness;
uniform 	float _Cutoff;
uniform 	float _FitAspectRatio;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat2 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _FitAspectRatio * u_xlat2 + u_xlat0.x;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat16_1.y = vs_TEXCOORD0.y;
    u_xlat0.x = _Radius * 4.0;
    u_xlat0.xy = abs(u_xlat16_1.xy) / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Cutoff, _Cutoff)));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0);
    u_xlat0.xy = log2(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Roundness, _Roundness));
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Smoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    SV_Target0.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}

#endif
"
}
}
}
}
}