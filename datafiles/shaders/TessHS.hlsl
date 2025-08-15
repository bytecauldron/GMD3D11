// Hull Shader for Triangle Tessellation
// TODO: Implement hull shader for 3-control-point triangle patches

struct VS_out
{
	float4 Position : SV_POSITION;
	float3 Normal   : NORMAL0;
	float4 Color    : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

struct HS_out
{
	float4 Position : SV_POSITION;
	float3 Normal   : NORMAL0;
	float4 Color    : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

struct HS_ConstantData
{
	float EdgeTess[3]        : SV_TessFactor;
	float InsideTess         : SV_InsideTessFactor;
};

// TODO: Implement constant hull shader function
// TODO: Implement control point hull shader function