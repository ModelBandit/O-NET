//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Bloom" {
Properties {
_MainTex ("", 2D) = "" { }
_BaseTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 19587
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
uniform 	mediump float _Threshold;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz + (-vec3(_Threshold));
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
uniform 	mediump float _Threshold;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz + (-vec3(_Threshold));
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
uniform 	mediump float _Threshold;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz + (-vec3(_Threshold));
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
uniform 	mediump float _Threshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + (-vec3(_Threshold));
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
uniform 	mediump float _Threshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + (-vec3(_Threshold));
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
uniform 	mediump float _Threshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + (-vec3(_Threshold));
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
  GpuProgramID 97911
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
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
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
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
  GpuProgramID 147326
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat10_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
uniform 	mediump float _Radius;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
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
    u_xlat16_2.x = 1.0;
    u_xlat16_2.z = _Radius;
    u_xlat16_0 = u_xlat16_2.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat16_2.x = _Radius;
    u_xlat16_2.z = -1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_2.xxzz + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0 = u_xlat16_0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.zy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
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
  GpuProgramID 217565
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat10_0.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat16_0.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_1.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
  GpuProgramID 291770
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = (-vec2(vec2(_Radius, _Radius))) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = _MainTex_TexelSize.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_1.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_0.y = float(1.0);
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_1 = u_xlat16_0.yxxy * _MainTex_TexelSize.xyxy;
    u_xlat0 = u_xlat16_1 * u_xlat16_0.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_6.y = _Radius;
    u_xlat16_6.x = 0.0;
    u_xlat0 = u_xlat16_1 * u_xlat16_6.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat2.xy = vec2(vec2(_Radius, _Radius)) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
  GpuProgramID 344669
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
lowp vec3 u_xlat10_6;
lowp vec3 u_xlat10_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
lowp vec3 u_xlat10_6;
lowp vec3 u_xlat10_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
lowp vec3 u_xlat10_6;
lowp vec3 u_xlat10_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat10_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat10_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_18;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * _MainTex_TexelSize.xy;
    u_xlat16_18.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius));
    u_xlat1 = u_xlat16_18.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat3.xy = (-u_xlat16_0.xy) * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat2.xyz;
    u_xlat16_2.y = float(1.0);
    u_xlat16_2.z = float(-1.0);
    u_xlat16_2.xw = vec2(vec2(vec2(_Radius, _Radius)));
    u_xlat16_3 = u_xlat16_0.xyxy * u_xlat16_2.yxxy;
    u_xlat5.xy = u_xlat16_0.xy * vec2(vec2(_Radius, _Radius)) + vs_TEXCOORD0.xy;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat5.xy).xyz;
    u_xlat0 = u_xlat16_3 * u_xlat16_2.wzzw + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_4.xyz;
    u_xlat16_8.y = _Radius;
    u_xlat16_8.x = 0.0;
    u_xlat0 = u_xlat16_3 * u_xlat16_8.yxxy + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_4.xyz;
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