//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Additive Bend" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_Pivot ("Pivot", Vector) = (0,0,0,0)
}
SubShader {
 LOD 100
 Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ZWrite Off
  Cull Off
  GpuProgramID 44459
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat10_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat10_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat10_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Pivot;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Pivot.w) + 1.0;
    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xy = _Pivot.yz * _Pivot.ww + u_xlat0.xy;
    u_xlat1.x = 0.0;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat3.xy = (-u_xlat4.xy) + u_xlat2.xy;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.y = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat3.x, 0.0);
    u_xlat1.z = u_xlat0.x + u_xlat3.y;
    u_xlat4.z = u_xlat2.z;
    u_xlat0.xyz = u_xlat4.zxy + u_xlat1.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat2.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 * _Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.wwww;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
    return;
}

#endif
"
}
}
}
}
}