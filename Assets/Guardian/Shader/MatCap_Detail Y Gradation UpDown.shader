//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MatCap/Detail Y Gradation UpDown" {
Properties {
_Color ("Tint Color", Color) = (0.5,0.5,0.5,1)
_MainTex ("Base (RGB)", 2D) = "white" { }
_MatCap ("MatCap (RGB)", 2D) = "white" { }
[MaterialToggle(SHEAR)] _EnableShear ("Enable Shear", Float) = 0
_ShearOffset ("Shear Offset", Float) = -999
_GradStart ("Gradation Start Y", Float) = 0
_GradEnd ("Gradation End Y", Float) = 0
_GradStart2 ("Gradation Start Y 2", Float) = 0
_GradEnd2 ("Gradation End Y 2", Float) = 0
_GradColor ("Gradation Color", Color) = (1,1,1,0)
}
SubShader {
 LOD 300
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "BASE"
  LOD 300
  Tags { "LIGHTMODE" = "ALWAYS" "RenderType" = "Opaque" }
  GpuProgramID 2446
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<u_xlat0.x);
#else
    u_xlatb6 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<u_xlat0.x);
#else
    u_xlatb6 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-vec2(_GradStart, _GradStart2));
    u_xlat16_2.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<u_xlat0.x);
#else
    u_xlatb6 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlatb4 = -100.0<_ShearOffset;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb8 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlatb4 = -100.0<_ShearOffset;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb8 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
    u_xlatb4 = -100.0<_ShearOffset;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlatb8 = 0.0<u_xlat0.x;
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _Color;
    u_xlat10_1 = texture2D(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(-100.0<_ShearOffset);
#else
    u_xlatb4 = -100.0<_ShearOffset;
#endif
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<u_xlat0.x);
#else
    u_xlatb8 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(-100.0<_ShearOffset);
#else
    u_xlatb4 = -100.0<_ShearOffset;
#endif
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<u_xlat0.x);
#else
    u_xlatb8 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Shear;
uniform 	float _ShearOffset;
uniform 	mediump float _GradStart;
uniform 	mediump float _GradEnd;
uniform 	mediump float _GradStart2;
uniform 	mediump float _GradEnd2;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump float vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_CameraToWorld[2].y * 10.0 + _WorldSpaceCameraPos.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(-100.0<_ShearOffset);
#else
    u_xlatb4 = -100.0<_ShearOffset;
#endif
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat4 = (u_xlatb4) ? _ShearOffset : u_xlat1.y;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4;
    u_xlat0.x = u_xlat0.x * _Shear;
    u_xlat4 = u_xlat1.x + (-_WorldSpaceCameraPos.x);
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat1.xy = u_xlat1.yy + (-vec2(_GradStart, _GradStart2));
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat8 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat0;
    u_xlat16_3.xy = (-vec2(_GradStart, _GradStart2)) + vec2(_GradEnd, _GradEnd2);
    u_xlat0.xy = u_xlat1.xy / u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<u_xlat0.x);
#else
    u_xlatb8 = 0.0<u_xlat0.x;
#endif
    vs_TEXCOORD2 = (u_xlatb8) ? u_xlat0.x : u_xlat0.y;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	mediump vec4 _GradColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_1 = texture(_MatCap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_0 * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat16_0 = (-u_xlat16_0) * vec4(3.0, 3.0, 3.0, 3.0) + _GradColor;
    SV_Target0 = vec4(vs_TEXCOORD2) * u_xlat16_0 + u_xlat16_1;
    return;
}

#endif
"
}
}
}
}
Fallback "Diffuse"
}