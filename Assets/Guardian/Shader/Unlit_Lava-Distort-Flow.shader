//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Lava-Distort-Flow" {
Properties {
_DistortX ("Distortion in X", Range(0, 2)) = 1
_DistortY ("Distortion in Y", Range(0, 2)) = 0
_AnimationRateX ("AnimationRate In X", Range(0, 1)) = 0
_AnimationRateY ("AnimationRate In Y", Range(0, 1)) = 0
_Distort ("_Distort A", 2D) = "white" { }
_LavaTex ("_LavaTex RGB", 2D) = "white" { }
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 4950
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
uniform lowp sampler2D _Distort;
uniform lowp sampler2D _LavaTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat10_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat10_0 = texture2D(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat10_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
uniform lowp sampler2D _Distort;
uniform lowp sampler2D _LavaTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat10_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat10_0 = texture2D(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat10_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
uniform lowp sampler2D _Distort;
uniform lowp sampler2D _LavaTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat10_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat10_0 = texture2D(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat10_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
UNITY_LOCATION(0) uniform mediump sampler2D _Distort;
UNITY_LOCATION(1) uniform mediump sampler2D _LavaTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat16_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat16_0 = texture(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat16_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
UNITY_LOCATION(0) uniform mediump sampler2D _Distort;
UNITY_LOCATION(1) uniform mediump sampler2D _LavaTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat16_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat16_0 = texture(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat16_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LavaTex_ST;
uniform 	mediump vec4 _Distort_ST;
uniform 	mediump float _AnimationRateX;
uniform 	mediump float _AnimationRateY;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb4;
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
    u_xlat0.xy = _Time.yy * vec2(_AnimationRateX, _AnimationRateY);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Distort_ST.xy + _Distort_ST.zw;
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
uniform 	mediump float _DistortX;
uniform 	mediump float _DistortY;
UNITY_LOCATION(0) uniform mediump sampler2D _Distort;
UNITY_LOCATION(1) uniform mediump sampler2D _LavaTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Distort, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xy = (-u_xlat16_0.xx) * vec2(_DistortX, _DistortY) + vs_TEXCOORD1.xy;
    u_xlat16_0 = texture(_LavaTex, u_xlat16_1.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
}
}
}