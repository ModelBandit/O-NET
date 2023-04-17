//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/SkeletonGhost Character No Bend" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_TextureFade ("Texture Fade Out", Range(0, 1)) = 0
_FadeColor ("Fade Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 65527
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
    u_xlatb12 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat10_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat10_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat10_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
    u_xlatb12 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat10_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat10_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat10_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
    u_xlatb12 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat10_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat10_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat10_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.y<0.0);
#else
    u_xlatb12 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat16_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.y<0.0);
#else
    u_xlatb12 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat16_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4.x;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx * u_xlat1.xy;
    u_xlat4.xy = u_xlat4.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.y<0.0);
#else
    u_xlatb12 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat12 = u_xlatb12 ? -1.0 : float(0.0);
    u_xlat12 = (u_xlatb1) ? 1.0 : u_xlat12;
    u_xlat4.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat4.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.y = u_xlat1.y;
    u_xlat2.xz = hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat3.xyz = u_xlat2.xyz + (-hlslcc_mtx4x4unity_ObjectToWorld[3].xyz);
    u_xlat3.w = u_xlat0.x * u_xlat3.y;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat3.xwz;
    u_xlat4.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixVP[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[0].y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixVP[2].y * u_xlat0.z + u_xlat0.x;
    gl_Position.y = hlslcc_mtx4x4unity_MatrixVP[3].y * u_xlat1.w + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xzw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xzw * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xzw * u_xlat1.zzz + u_xlat0.xyz;
    gl_Position.xzw = hlslcc_mtx4x4unity_MatrixVP[3].xzw * u_xlat1.www + u_xlat0.xyz;
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
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
void main()
{
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(_TextureFade));
    u_xlat16_3 = vs_COLOR0 * _Color;
    u_xlat16_3 = u_xlat16_1.wwww * u_xlat16_3;
    u_xlat16_1.w = u_xlat16_1.w * u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
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