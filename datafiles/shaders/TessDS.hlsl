// Domain Shader for Triangle Tessellation
// TODO: Implement domain shader for 3-control-point triangle patches

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

struct DS_out
{
	float4 Position : SV_POSITION;
	float3 Normal   : NORMAL0;
	float4 Color    : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

// TODO: Implement domain shader main function
// [domain("tri")]
// DS_out main(HS_ConstantData input, float3 domain : SV_DomainLocation, const OutputPatch<HS_out, 3> patch)