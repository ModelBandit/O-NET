//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/SkeletonGhost Character" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_TextureFade ("Texture Fade Out", Range(0, 1)) = 0
_FadeColor ("Fade Color", Color) = (1,1,1,1)
_YOffset ("Y Offset", Range(0, 999)) = 0
[MaterialToggle(SHEAR)] _EnableShear ("Enable Shear", Float) = 0
[MaterialToggle(CUSTOM_LIGHTING)] _EnableCustomLighting ("Enable Custom Lighting", Float) = 0
_ShearOffset ("Shear Offset", Float) = -999
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
  GpuProgramID 34564
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "CUSTOM_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "CUSTOM_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "CUSTOM_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
    u_xlatb15 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CUSTOM_LIGHTING" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CUSTOM_LIGHTING" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CUSTOM_LIGHTING" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat5.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat5.x;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat5.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat5.x;
    u_xlat5.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xz;
    u_xlat5.xy = u_xlat5.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat1.x<0.0);
#else
    u_xlatb15 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat15 = u_xlatb15 ? -1.0 : float(0.0);
    u_xlat15 = (u_xlatb1) ? 1.0 : u_xlat15;
    u_xlat1.xz = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat5.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat5.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat5.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.xy = u_xlat5.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat5.xx + u_xlat3.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat5.zz + u_xlat5.xy;
    u_xlat3.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat5.xy;
    u_xlat5.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat5.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    u_xlat3.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat3;
    u_xlat0.x = u_xlat3.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat3.xw * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlat16_4.xy = u_xlat0.xy / u_xlat3.ww;
    vs_TEXCOORD2.xy = u_xlat16_4.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
Keywords { "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
Keywords { "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
Keywords { "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
Keywords { "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
Keywords { "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
    u_xlatb18 = u_xlat1.x<0.0;
    u_xlatb1 = 0.0<u_xlat1.x;
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlatb0 = -100.0<_ShearOffset;
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	int _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightIndexTexture;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
ivec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
int u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


int _LightStartIdxArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightStartIdxArr[i];
#else
#define d_ar _LightStartIdxArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _LightPosArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightPosArr[i];
#else
#define d_ar _LightPosArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _LightColorArrDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _LightColorArr[i];
#else
#define d_ar _LightColorArr
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19]; else if (i == 20) return d_ar[20]; else if (i == 21) return d_ar[21]; else if (i == 22) return d_ar[22]; else if (i == 23) return d_ar[23]; else if (i == 24) return d_ar[24]; else if (i == 25) return d_ar[25]; else if (i == 26) return d_ar[26]; else if (i == 27) return d_ar[27]; else if (i == 28) return d_ar[28]; else if (i == 29) return d_ar[29]; else if (i == 30) return d_ar[30]; else if (i == 31) return d_ar[31]; else if (i == 32) return d_ar[32]; else if (i == 33) return d_ar[33]; else if (i == 34) return d_ar[34]; else if (i == 35) return d_ar[35]; else if (i == 36) return d_ar[36]; else if (i == 37) return d_ar[37]; else if (i == 38) return d_ar[38]; else if (i == 39) return d_ar[39]; else if (i == 40) return d_ar[40]; else if (i == 41) return d_ar[41]; else if (i == 42) return d_ar[42]; else if (i == 43) return d_ar[43]; else if (i == 44) return d_ar[44]; else if (i == 45) return d_ar[45]; else if (i == 46) return d_ar[46]; else if (i == 47) return d_ar[47]; else if (i == 48) return d_ar[48]; else if (i == 49) return d_ar[49]; else if (i == 50) return d_ar[50]; else if (i == 51) return d_ar[51]; else if (i == 52) return d_ar[52]; else if (i == 53) return d_ar[53]; else if (i == 54) return d_ar[54]; else if (i == 55) return d_ar[55]; else if (i == 56) return d_ar[56]; else if (i == 57) return d_ar[57]; else if (i == 58) return d_ar[58]; else if (i == 59) return d_ar[59]; else if (i == 60) return d_ar[60]; else if (i == 61) return d_ar[61]; else if (i == 62) return d_ar[62]; else if (i == 63) return d_ar[63]; else if (i == 64) return d_ar[64]; else if (i == 65) return d_ar[65]; else if (i == 66) return d_ar[66]; else if (i == 67) return d_ar[67]; else if (i == 68) return d_ar[68]; else if (i == 69) return d_ar[69]; else if (i == 70) return d_ar[70]; else if (i == 71) return d_ar[71]; else if (i == 72) return d_ar[72]; else if (i == 73) return d_ar[73]; else if (i == 74) return d_ar[74]; else if (i == 75) return d_ar[75]; else if (i == 76) return d_ar[76]; else if (i == 77) return d_ar[77]; else if (i == 78) return d_ar[78]; else if (i == 79) return d_ar[79]; else if (i == 80) return d_ar[80]; else if (i == 81) return d_ar[81]; else if (i == 82) return d_ar[82]; else if (i == 83) return d_ar[83]; else if (i == 84) return d_ar[84]; else if (i == 85) return d_ar[85]; else if (i == 86) return d_ar[86]; else if (i == 87) return d_ar[87]; else if (i == 88) return d_ar[88]; else if (i == 89) return d_ar[89]; else if (i == 90) return d_ar[90]; else if (i == 91) return d_ar[91]; else if (i == 92) return d_ar[92]; else if (i == 93) return d_ar[93]; else if (i == 94) return d_ar[94]; else if (i == 95) return d_ar[95]; else if (i == 96) return d_ar[96]; else if (i == 97) return d_ar[97]; else if (i == 98) return d_ar[98]; else if (i == 99) return d_ar[99]; else if (i == 100) return d_ar[100]; else if (i == 101) return d_ar[101]; else if (i == 102) return d_ar[102]; else if (i == 103) return d_ar[103]; else if (i == 104) return d_ar[104]; else if (i == 105) return d_ar[105]; else if (i == 106) return d_ar[106]; else if (i == 107) return d_ar[107]; else if (i == 108) return d_ar[108]; else if (i == 109) return d_ar[109]; else if (i == 110) return d_ar[110]; else if (i == 111) return d_ar[111]; else if (i == 112) return d_ar[112]; else if (i == 113) return d_ar[113]; else if (i == 114) return d_ar[114]; else if (i == 115) return d_ar[115]; else if (i == 116) return d_ar[116]; else if (i == 117) return d_ar[117]; else if (i == 118) return d_ar[118]; else if (i == 119) return d_ar[119]; else if (i == 120) return d_ar[120]; else if (i == 121) return d_ar[121]; else if (i == 122) return d_ar[122]; else if (i == 123) return d_ar[123]; else if (i == 124) return d_ar[124]; else if (i == 125) return d_ar[125]; else if (i == 126) return d_ar[126]; else if (i == 127) return d_ar[127];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat10_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  ivec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = int(0);
    u_xlatu0.w = int(0);
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = int(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0DynamicIndex(int(u_xlatu6)));
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + _LightStartIdxArrDynamicIndex(int(u_xlatu6));
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArrDynamicIndex(u_xlati6).w * _LightPosArrDynamicIndex(u_xlati6).w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArrDynamicIndex(u_xlati6).xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArrDynamicIndex(u_xlati6).www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
        u_xlat16_3.w = u_xlat16_3.w;
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CUSTOM_LIGHTING" "SHEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	float _Shear;
uniform 	float _ShearOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xz;
    u_xlat6.xy = u_xlat6.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1.x<0.0);
#else
    u_xlatb18 = u_xlat1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.x);
#else
    u_xlatb1 = 0.0<u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? -1.0 : float(0.0);
    u_xlat18 = (u_xlatb1) ? 1.0 : u_xlat18;
    u_xlat1.xz = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat6.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat6.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-100.0<_ShearOffset);
#else
    u_xlatb0 = -100.0<_ShearOffset;
#endif
    u_xlat0.x = (u_xlatb0) ? _ShearOffset : hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat18 = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat18 = (-_WorldSpaceCameraPos.x) + hlslcc_mtx4x4unity_ObjectToWorld[3].x;
    u_xlat4.x = u_xlat0.x * u_xlat18 + u_xlat2.z;
    u_xlat0.x = u_xlat6.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat6.y;
    u_xlat3.x = 0.0;
    u_xlat4.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat6.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat0.xx + u_xlat6.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat0.xy;
    u_xlat3.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat4.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat3.xy;
    u_xlat0.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat3.xy;
    vs_TEXCOORD1.xyz = u_xlat2.zxy;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_5.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD2.xy = u_xlat16_5.xy * vec2(0.25, 0.25);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.yw = in_POSITION0.yw;
    u_xlat0.x = dot(u_xlat1, u_xlat1);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
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
vec4 ImmCB_0[4];
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LightPosArr[128];
uniform 	mediump vec4 _LightColorArr[128];
uniform 	uint _LightStartIdxArr[4];
uniform 	mediump vec4 _Color;
uniform 	mediump float _TextureFade;
uniform 	mediump vec4 _FadeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightIndexTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
int u_xlati6;
uint u_xlatu6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(_TextureFade));
    u_xlat16_2 = vs_COLOR0 * _Color;
    u_xlat16_2 = u_xlat16_0.wwww * u_xlat16_2;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat16_0.w * u_xlat16_2.w;
    u_xlat0.xy = vs_TEXCOORD2.xy * _ScreenParams.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0 = texelFetch(_LightIndexTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w));
    u_xlatb3 = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_26 = u_xlat16_4.y + u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_4.z + u_xlat16_26;
    u_xlat16_26 = u_xlat16_4.w + u_xlat16_26;
    u_xlat16_12.x = (u_xlatb3.y) ? float(2.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb3.z) ? float(4.0) : float(0.0);
    u_xlat16_12.z = (u_xlatb3.w) ? float(8.0) : float(0.0);
    u_xlat16_4.x = u_xlat16_12.x + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.y + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_12.z + u_xlat16_4.x;
    u_xlat16_12.x = dot(vs_NORMAL0.xyz, vs_NORMAL0.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_NORMAL0.xyz;
    u_xlat16_3 = u_xlat16_1;
    u_xlat16_5 = u_xlat16_4.x;
    u_xlat16_13 = 0.0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat16_13>=u_xlat16_26);
#else
        u_xlatb6 = u_xlat16_13>=u_xlat16_26;
#endif
        if(u_xlatb6){break;}
        u_xlat16_21 = log2(u_xlat16_5);
        u_xlatu6 = uint(u_xlat16_21);
        u_xlat16_21 = dot(vec4(1.0, 2.0, 4.0, 8.0), ImmCB_0[int(u_xlatu6)]);
        u_xlat16_5 = (-u_xlat16_21) + u_xlat16_5;
        u_xlat16_21 = dot(u_xlat0, ImmCB_0[int(u_xlatu6)]);
        u_xlat16_21 = u_xlat16_21 * 31.5;
        u_xlati14 = int(u_xlat16_21);
        u_xlati6 = u_xlati14 + int(_LightStartIdxArr[int(u_xlatu6)]);
        u_xlat14.xyz = (-vs_TEXCOORD1.xyz) + _LightPosArr[u_xlati6].xyz;
        u_xlat16_21 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat16_29 = _LightPosArr[u_xlati6].w * _LightPosArr[u_xlati6].w;
        u_xlat16_29 = u_xlat16_21 / u_xlat16_29;
        u_xlat16_7.x = (-u_xlat16_29) + 1.0;
        u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
        u_xlat16_29 = u_xlat16_29 + 1.0;
        u_xlat16_29 = u_xlat16_7.x / u_xlat16_29;
        u_xlat16_21 = inversesqrt(u_xlat16_21);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * u_xlat14.xyz;
        u_xlat16_21 = dot(u_xlat16_12.xyz, u_xlat16_7.xyz);
        u_xlat16_21 = max(u_xlat16_21, 0.0);
        u_xlat16_7.xyz = vec3(u_xlat16_21) * _LightColorArr[u_xlati6].xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColorArr[u_xlati6].www;
        u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
        u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
        u_xlat16_3.w = u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
        u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
        u_xlat16_13 = u_xlat16_13 + 1.0;
    }
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    SV_Target0 = u_xlat16_0 * u_xlat16_3;
    return;
}

#endif
"
}
}
}
}
}