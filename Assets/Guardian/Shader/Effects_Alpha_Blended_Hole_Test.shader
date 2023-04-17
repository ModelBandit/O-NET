//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effects/Alpha_Blended_Hole_Test" {
Properties {
_x1 ("x1", Range(-2, 2)) = 0.5
_y1 ("y1", Range(-2, 2)) = 0.5
_x2 ("x2", Range(-2, 2)) = -2
_y2 ("y2", Range(-2, 2)) = -2
_x3 ("x3", Range(-2, 2)) = -2
_y3 ("y3", Range(-2, 2)) = -2
_range1 ("range1", Range(0, 1)) = 0.1
_range2 ("range2", Range(0, 1)) = 0
_range3 ("range3", Range(0, 1)) = 0
_hardness ("hardness", Range(0, 1)) = 0.1
_fitAspectRatio ("fitAspectRatio", Range(0, 1)) = 0
_mainTex ("MainTexture", 2D) = "white" { }
_tex1Time ("MainTimeMultipier", Float) = 1
_tex1Speed ("MainSpeed", Float) = 0.1
_subTex ("SubTexutre", 2D) = "black" { }
_tex2Time ("SubTimeMultipier", Float) = 1
_tex2Speed ("SubSpeed", Float) = 0.1
_offset ("Offset", Vector) = (0,0,0,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  GpuProgramID 13247
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
uniform lowp sampler2D _mainTex;
uniform lowp sampler2D _subTex;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat10_2 = texture2D(_mainTex, u_xlat2.xy);
    u_xlat10_2.w = u_xlat0.x * (-u_xlat10_2.w) + u_xlat10_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat10_1 = texture2D(_subTex, u_xlat3.xy);
    u_xlat10_1.w = u_xlat0.x * (-u_xlat10_1.w) + u_xlat10_1.w;
    SV_Target0 = u_xlat10_1 + u_xlat10_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
uniform lowp sampler2D _mainTex;
uniform lowp sampler2D _subTex;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat10_2 = texture2D(_mainTex, u_xlat2.xy);
    u_xlat10_2.w = u_xlat0.x * (-u_xlat10_2.w) + u_xlat10_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat10_1 = texture2D(_subTex, u_xlat3.xy);
    u_xlat10_1.w = u_xlat0.x * (-u_xlat10_1.w) + u_xlat10_1.w;
    SV_Target0 = u_xlat10_1 + u_xlat10_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
uniform lowp sampler2D _mainTex;
uniform lowp sampler2D _subTex;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat10_2 = texture2D(_mainTex, u_xlat2.xy);
    u_xlat10_2.w = u_xlat0.x * (-u_xlat10_2.w) + u_xlat10_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat10_1 = texture2D(_subTex, u_xlat3.xy);
    u_xlat10_1.w = u_xlat0.x * (-u_xlat10_1.w) + u_xlat10_1.w;
    SV_Target0 = u_xlat10_1 + u_xlat10_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _mainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _subTex;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.x<u_xlat0.y);
#else
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
#endif
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.z<u_xlat0.y);
#else
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat16_2 = texture(_mainTex, u_xlat2.xy);
    u_xlat16_2.w = u_xlat0.x * (-u_xlat16_2.w) + u_xlat16_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_subTex, u_xlat3.xy);
    u_xlat16_1.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0 = u_xlat16_1 + u_xlat16_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _mainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _subTex;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.x<u_xlat0.y);
#else
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
#endif
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.z<u_xlat0.y);
#else
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat16_2 = texture(_mainTex, u_xlat2.xy);
    u_xlat16_2.w = u_xlat0.x * (-u_xlat16_2.w) + u_xlat16_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_subTex, u_xlat3.xy);
    u_xlat16_1.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0 = u_xlat16_1 + u_xlat16_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _mainTex_ST;
uniform 	vec4 _subTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _mainTex_ST.xy + _mainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _subTex_ST.xy + _subTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 unity_OrthoParams;
uniform 	float _x1;
uniform 	float _y1;
uniform 	float _x2;
uniform 	float _y2;
uniform 	float _x3;
uniform 	float _y3;
uniform 	float _range1;
uniform 	float _range2;
uniform 	float _range3;
uniform 	float _hardness;
uniform 	float _fitAspectRatio;
uniform 	vec3 _offset;
uniform 	float _tex1Time;
uniform 	float _tex2Time;
uniform 	float _tex1Speed;
uniform 	float _tex2Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _mainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _subTex;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = unity_OrthoParams.x / unity_OrthoParams.y;
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _fitAspectRatio * u_xlat4.x + u_xlat0.x;
    u_xlat1.yz = vs_TEXCOORD2.xy + (-vec2(_x3, _y3));
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat4.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + (-_range3);
    u_xlat0.y = u_xlat4.x + _hardness;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_x1, _x2, _y1, _y2));
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.z = dot(u_xlat1.yw, u_xlat1.yw);
    u_xlat0.xz = sqrt(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + (-vec2(_range1, _range2));
    u_xlat0.xz = u_xlat0.xz + vec2(vec2(_hardness, _hardness));
    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_hardness, _hardness, _hardness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.x<u_xlat0.y);
#else
    u_xlatb12 = u_xlat0.x<u_xlat0.y;
#endif
    u_xlat12 = (u_xlatb12) ? u_xlat0.x : u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.z<u_xlat0.y);
#else
    u_xlatb1 = u_xlat0.z<u_xlat0.y;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat0.z : u_xlat0.y;
    u_xlat0.x = (u_xlatb0) ? u_xlat12 : u_xlat4.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _hardness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = _Time.yyy * vec3(_tex1Time, _offset.x, _offset.y);
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat4.xy = u_xlat4.yz * vec2(9.99999975e-05, 9.99999975e-05);
    u_xlat12 = u_xlat1.x * _tex1Speed + u_xlat4.x;
    u_xlat1.x = u_xlat2.x * _tex1Speed + u_xlat4.y;
    u_xlat5.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.x = u_xlat12 + u_xlat5.x;
    u_xlat2.y = u_xlat1.x + u_xlat5.y;
    u_xlat16_2 = texture(_mainTex, u_xlat2.xy);
    u_xlat16_2.w = u_xlat0.x * (-u_xlat16_2.w) + u_xlat16_2.w;
    u_xlat12 = _Time.y * _tex2Time;
    u_xlat1.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat4.x = u_xlat1.x * (-_tex2Speed) + u_xlat4.x;
    u_xlat4.y = u_xlat3.x * (-_tex2Speed) + u_xlat4.y;
    u_xlat3.xy = u_xlat4.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_subTex, u_xlat3.xy);
    u_xlat16_1.w = u_xlat0.x * (-u_xlat16_1.w) + u_xlat16_1.w;
    SV_Target0 = u_xlat16_1 + u_xlat16_2;
    return;
}

#endif
"
}
}
}
}
}