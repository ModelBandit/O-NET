//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Blur" {
Properties {
_MainTex ("", 2D) = "" { }
_BaseTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1184
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.x * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(1.0, 0.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 106437
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.340000004, 0.340000004, 0.340000004);
    u_xlat16_1.x = _MainTex_TexelSize.y * _Radius;
    u_xlat16_5.xy = (-u_xlat16_1.xx) * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xw = u_xlat16_1.xx * vec2(0.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.xw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_5.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.330000013, 0.330000013, 0.330000013) + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 141739
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 215089
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 312803
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_1 = u_xlat16_0.zwxw * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyzy * vec4(1.0, 1.0, -1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 341079
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3.xyz = texture2D(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = (-_MainTex_TexelSize.xy) * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(_Radius);
    u_xlat16_2 = u_xlat16_0.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_2.zw).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_0 = u_xlat16_0.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_1.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_1.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat16_0.zw).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_0.xyz;
    u_xlat16_2.xy = _MainTex_TexelSize.xy * vec2(_Radius) + vs_TEXCOORD1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat16_2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = texture(_BaseTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
}