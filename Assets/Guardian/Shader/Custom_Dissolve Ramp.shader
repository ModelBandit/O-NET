//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Dissolve Ramp" {
Properties {
[Header(Main Texture Variables)] _MainTex ("Main Texture", 2D) = "white" { }
[Header(Dissolve Variables)] _DissolveTex ("Dissolve Texture", 2D) = "white" { }
_DissolveXSpeed ("Dissolve UV X Speed", Float) = 0
_DissolveYSpeed ("Dissolve UV Y Speed", Float) = 0
[Header(Second Dissolve Variables)] _SecondDissolveTex ("Second Dissolve Texture", 2D) = "white" { }
_SecondDissolveXSpeed ("Second Dissolve UV X Speed", Float) = 0
_SecondDissolveYSpeed ("Second Dissolve UV Y Speed", Float) = 0
_DissolveMaskTex ("Dissolve Mask Texture", 2D) = "white" { }
_DissolveMaskXSpeed ("Dissolve Mask UV X Speed", Float) = 0
_DissolveMaskYSpeed ("Dissolve Mask UV Y Speed", Float) = 0
_DissolveMaskThreshold ("Dissolve Mask (based on uv.y) Threshold", Range(0, 1)) = 0
_DissolveRampTex ("Dissolve Ramp", 2D) = "white" { }
[Header(Blend Modes)] [Enum(UnityEngine.Rendering.BlendMode)] _BlendA ("Blending Factor A", Float) = 5
[Enum(UnityEngine.Rendering.BlendMode)] _BlendB ("Blending Factor B", Float) = 10
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  GpuProgramID 61202
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp float in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _SecondDissolveTex;
uniform lowp sampler2D _DissolveRampTex;
uniform lowp sampler2D _DissolveMaskTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat10_5 = texture2D(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat10_5 * u_xlat10_0;
    u_xlat10_0 = texture2D(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat10_0 + (-vs_TEXCOORD0.z);
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
    u_xlat16_2.y = 0.0;
    u_xlat10_3.xyz = texture2D(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat10_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat10_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
    u_xlati0.xy = ivec2(op_and(ivec2(u_xlatb0.xy) * -1, ivec2(1, 1)));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
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
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp float in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _SecondDissolveTex;
uniform lowp sampler2D _DissolveRampTex;
uniform lowp sampler2D _DissolveMaskTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat10_5 = texture2D(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat10_5 * u_xlat10_0;
    u_xlat10_0 = texture2D(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat10_0 + (-vs_TEXCOORD0.z);
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
    u_xlat16_2.y = 0.0;
    u_xlat10_3.xyz = texture2D(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat10_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat10_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
    u_xlati0.xy = ivec2(op_and(ivec2(u_xlatb0.xy) * -1, ivec2(1, 1)));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
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
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp float in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _SecondDissolveTex;
uniform lowp sampler2D _DissolveRampTex;
uniform lowp sampler2D _DissolveMaskTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat10_5 = texture2D(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat10_5 * u_xlat10_0;
    u_xlat10_0 = texture2D(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat10_0 + (-vs_TEXCOORD0.z);
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
    u_xlat16_2.y = 0.0;
    u_xlat10_3.xyz = texture2D(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat10_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat10_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
    u_xlati0.xy = ivec2(op_and(ivec2(u_xlatb0.xy) * -1, ivec2(1, 1)));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
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
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp float in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SecondDissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveRampTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveMaskTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat16_5 = texture(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_0;
    u_xlat16_0 = texture(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0 + (-vs_TEXCOORD0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1<u_xlat16_6);
#else
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vs_TEXCOORD0.z<u_xlat16_1);
#else
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
#endif
    u_xlat16_2.y = 0.0;
    u_xlat16_3.xyz = texture(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(_DissolveMaskThreshold<vs_TEXCOORD0.y);
#else
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
#endif
    u_xlati0.xy = ivec2((uvec2(u_xlatb0.xy) * 0xFFFFFFFFu) & uvec2(1u, 1u));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
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
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp float in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SecondDissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveRampTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveMaskTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat16_5 = texture(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_0;
    u_xlat16_0 = texture(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0 + (-vs_TEXCOORD0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1<u_xlat16_6);
#else
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vs_TEXCOORD0.z<u_xlat16_1);
#else
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
#endif
    u_xlat16_2.y = 0.0;
    u_xlat16_3.xyz = texture(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(_DissolveMaskThreshold<vs_TEXCOORD0.y);
#else
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
#endif
    u_xlati0.xy = ivec2((uvec2(u_xlatb0.xy) * 0xFFFFFFFFu) & uvec2(1u, 1u));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
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
uniform 	mediump float _DissolveXSpeed;
uniform 	mediump float _DissolveYSpeed;
uniform 	mediump float _DissolveMaskXSpeed;
uniform 	mediump float _DissolveMaskYSpeed;
uniform 	mediump float _SecondDissolveXSpeed;
uniform 	mediump float _SecondDissolveYSpeed;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _SecondDissolveTex_ST;
uniform 	vec4 _DissolveMaskTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp float in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    u_xlat0.xy = _Time.yy * vec2(_SecondDissolveXSpeed, _SecondDissolveYSpeed);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = in_TEXCOORD0.xy * _SecondDissolveTex_ST.xy + _SecondDissolveTex_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1 = _Time.yyyy * vec4(_DissolveXSpeed, _DissolveYSpeed, _DissolveMaskXSpeed, _DissolveMaskYSpeed);
    u_xlat1 = fract(u_xlat1);
    vs_TEXCOORD1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = in_TEXCOORD0.x;
    u_xlat0.y = in_TEXCOORD0.y + in_TEXCOORD1;
    u_xlat0.xy = u_xlat0.xy * _DissolveMaskTex_ST.xy + _DissolveMaskTex_ST.zw;
    vs_TEXCOORD3.xy = u_xlat1.zw + u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _DissolveMaskThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SecondDissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveRampTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveMaskTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
ivec2 u_xlati0;
bvec2 u_xlatb0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
float u_xlat10;
mediump float u_xlat16_11;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat16_5 = texture(_SecondDissolveTex, vs_TEXCOORD2.xy).x;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_0;
    u_xlat16_0 = texture(_DissolveMaskTex, vs_TEXCOORD3.xy).x;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0 + (-vs_TEXCOORD0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_11 = vs_TEXCOORD0.z * vs_TEXCOORD0.w;
    u_xlat16_11 = max(u_xlat16_11, 0.00100000005);
    u_xlat16_2.x = u_xlat16_6 / u_xlat16_11;
    u_xlat16_6 = u_xlat16_11 + vs_TEXCOORD0.z;
    u_xlat16_6 = u_xlat16_6 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1<u_xlat16_6);
#else
    u_xlatb0.x = u_xlat16_1<u_xlat16_6;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vs_TEXCOORD0.z<u_xlat16_1);
#else
    u_xlatb5 = vs_TEXCOORD0.z<u_xlat16_1;
#endif
    u_xlat16_2.y = 0.0;
    u_xlat16_3.xyz = texture(_DissolveRampTex, u_xlat16_2.xy).xyz;
    u_xlat10 = (u_xlatb5) ? -1.0 : -0.0;
    u_xlat16_1 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_4.xyz * vs_COLOR0.xyz + vec3(u_xlat10);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + u_xlat5.xyz;
    SV_Target0.xyz = u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(_DissolveMaskThreshold<vs_TEXCOORD0.y);
#else
    u_xlatb0.y = _DissolveMaskThreshold<vs_TEXCOORD0.y;
#endif
    u_xlati0.xy = ivec2((uvec2(u_xlatb0.xy) * 0xFFFFFFFFu) & uvec2(1u, 1u));
    u_xlati0.x = u_xlati0.y * u_xlati0.x;
    SV_Target0.w = float(u_xlati0.x);
    return;
}

#endif
"
}
}
}
}
}