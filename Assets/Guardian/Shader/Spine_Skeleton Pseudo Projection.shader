//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/Skeleton Pseudo Projection" {
Properties {
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_ProjectionTex ("Projection Texture", 2D) = "white" { }
_YOffset ("Y Offset", Range(0, 999)) = 0
}
SubShader {
 Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "False" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 14305
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ProjectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat10_1 = texture2D(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ProjectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat10_1 = texture2D(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ProjectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat10_1 = texture2D(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat16_1;
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
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat16_1;
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
uniform 	vec4 _ProjectionTex_ST;
uniform 	mediump float _YOffset;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat1.xy = vec2(u_xlat12) * u_xlat4.xy;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.yyyy + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[3].yzxw * in_POSITION0.wwww + u_xlat2.yzxw;
    u_xlat4.xy = u_xlat2.xy + (-hlslcc_mtx4x4unity_ObjectToWorld[3].yz);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + _YOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat3.y = u_xlat0.x + (-_YOffset);
    u_xlat0.x = u_xlat4.x + _YOffset;
    u_xlat0.x = min(u_xlat0.x, 0.0);
    u_xlat3.z = u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat2.z;
    u_xlat3.x = 0.0;
    u_xlat0.yz = hlslcc_mtx4x4unity_ObjectToWorld[3].yz;
    u_xlat4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xw = u_xlat4.yy * hlslcc_mtx4x4unity_MatrixVP[1].yz;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[0].yz * u_xlat4.xx + u_xlat1.xw;
    u_xlat4.xy = hlslcc_mtx4x4unity_MatrixVP[2].yz * u_xlat4.zz + u_xlat4.xy;
    gl_Position.yz = hlslcc_mtx4x4unity_MatrixVP[3].yz * u_xlat2.ww + u_xlat4.xy;
    u_xlat4.xy = u_xlat2.xx * hlslcc_mtx4x4unity_MatrixVP[1].xw;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[0].xw * u_xlat0.xx + u_xlat4.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixVP[2].xw * u_xlat2.yy + u_xlat0.xy;
    gl_Position.xw = hlslcc_mtx4x4unity_MatrixVP[3].xw * u_xlat2.ww + u_xlat0.xy;
    u_xlat1.z = in_POSITION0.y;
    u_xlat0.xy = u_xlat1.yz + vec2(0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * _ProjectionTex_ST.xy + _ProjectionTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_ProjectionTex, vs_TEXCOORD1.xy);
    SV_Target0 = vec4(u_xlat0) * u_xlat16_1;
    return;
}

#endif
"
}
}
}
}
}