FSH	o><     common_texColorSampler��   common_texColorTexture��   common_texColor         #include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct xlatMtlMain_out
{
    float4 bgfx_FragData0 [[color(0)]];
};

struct xlatMtlMain_in
{
    float2 v_texcoord0 [[user(locn0)]];
};

fragment xlatMtlMain_out xlatMtlMain(xlatMtlMain_in in [[stage_in]], texture2d<float> common_texColor [[texture(0)]], sampler common_texColorSampler [[sampler(0)]])
{
    xlatMtlMain_out out = {};
    out.bgfx_FragData0 = float4(common_texColor.sample(common_texColorSampler, in.v_texcoord0).xyz, 1.0);
    return out;
}

    