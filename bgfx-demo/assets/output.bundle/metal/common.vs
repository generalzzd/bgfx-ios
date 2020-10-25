VSH	    o><    #include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct xlatMtlMain_out
{
    float2 _entryPointOutput_v_texcoord0 [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct xlatMtlMain_in
{
    float3 a_position [[attribute(0)]];
    float2 a_texcoord0 [[attribute(1)]];
};

vertex xlatMtlMain_out xlatMtlMain(xlatMtlMain_in in [[stage_in]])
{
    xlatMtlMain_out out = {};
    out.gl_Position = float4(in.a_position, 1.0);
    out._entryPointOutput_v_texcoord0 = in.a_texcoord0;
    return out;
}

     