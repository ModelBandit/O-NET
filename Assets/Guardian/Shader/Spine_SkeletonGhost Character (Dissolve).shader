//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/SkeletonGhost Character (Dissolve)" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_TextureFade ("Texture Fade Out", Range(0, 1)) = 0
_FadeColor ("Fade Color", Color) = (1,1,1,1)
_YOffset ("Y Offset", Range(0, 999)) = 0
[Header(Dissolve)] _DissolveTex ("Dissolve Texture", 2D) = "white" { }
_DirectionTex ("Dissolve Direction Texture", 2D) = "white" { }
_DissolveProgress ("Dissolve Progress", Range(0, 1)) = 0
[Header(Wave)] _WaveSpeed ("Wave Speed", Float) = 0
_WaveLength ("Wave Length", Float) = 0
_Amplitude ("Amplitude", Float) = 0
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
  GpuProgramID 7472
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _DirectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _DirectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _DirectionTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat10_0, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DirectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = texture(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat16_0.x = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DirectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = texture(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat16_0.x = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _YOffset;
uniform 	mediump float _WaveLength;
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _Amplitude;
uniform 	mediump vec4 _DissolveTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
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
    u_xlat3.x = _WaveLength * 6.28318548;
    u_xlat6.x = (-_WaveSpeed) * _Time.y + in_POSITION0.y;
    u_xlat3.x = u_xlat6.x * u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = _Amplitude * u_xlat3.x + in_POSITION0.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat6.x;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].x * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat6.x;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].x * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat6.x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[3].x * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat6.x;
    u_xlat6.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xy = u_xlat6.xx * u_xlat1.xy;
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
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
uniform 	mediump float _DissolveProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DirectionTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    u_xlat16_0.x = texture(_DirectionTex, vs_TEXCOORD0.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
    u_xlat16_1.x = _DissolveProgress * 2.0 + -1.0;
    u_xlat16_1.x = u_xlat0 + (-u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat16_0.x = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat0 = max(u_xlat16_0.x, 0.00100000005);
    u_xlat0 = min(u_xlat0, 0.999000013);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat0<u_xlat16_1.x;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_0 = _FadeColor + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_0 = vec4(_TextureFade) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0;
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