//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/SkeletonGhost Character Grayscale" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_TextureFade ("Texture Fade Out", Range(0, 1)) = 0
_FadeColor ("Fade Color", Color) = (1,1,1,1)
_YOffset ("Y Offset", Range(0, 999)) = 0
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,1)
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
  GpuProgramID 42971
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
    u_xlatb9 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
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
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
    u_xlatb9 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
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
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
    u_xlatb9 = u_xlat1.y<0.0;
    u_xlatb1 = 0.0<u_xlat1.y;
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
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
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<0.0);
#else
    u_xlatb9 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
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
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<0.0);
#else
    u_xlatb9 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
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
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
    u_xlat3.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat3.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xy * in_POSITION0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<0.0);
#else
    u_xlatb9 = u_xlat1.y<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat1.y);
#else
    u_xlatb1 = 0.0<u_xlat1.y;
#endif
    u_xlat9 = u_xlatb9 ? -1.0 : float(0.0);
    u_xlat9 = (u_xlatb1) ? 1.0 : u_xlat9;
    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.yyyy + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat1.yzxw;
    u_xlat3.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat3.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat3.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat2.z = u_xlat0.x + u_xlat3.y;
    u_xlat0.x = u_xlat1.z;
    u_xlat2.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat3.xx + u_xlat2.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat3.zz + u_xlat3.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat1.ww + u_xlat3.xy;
    u_xlat3.xy = u_xlat1.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat1.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat1.ww + u_xlat0.xy;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
float u_xlat4;
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat4 = dot(u_xlat16_0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_0.w * _TintColor.w;
    u_xlat16_0.xyz = _TintColor.xyz + _TintColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat4);
    return;
}

#endif
"
}
}
}
}
}