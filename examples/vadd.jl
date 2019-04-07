using CUDAdrv

using Test

dev = CuDevice(0)
ctx = CuContext(dev)

md = CuModuleFile(joinpath(@__DIR__, "vadd.ptx"))
vadd = CuFunction(md, "kernel_vadd")

dims = (3,4)
a = round.(rand(Float32, dims) * 100)
b = round.(rand(Float32, dims) * 100)
c = similar(a)

d_a = Mem.upload(a)
d_b = Mem.upload(b)
d_c = Mem.alloc(c)

len = prod(dims)
cudacall(vadd, Tuple{CuPtr{Cfloat},CuPtr{Cfloat},CuPtr{Cfloat}}, d_a, d_b, d_c; threads=len)

Mem.download!(c, d_c)
@test a+b ≈ c

destroy!(ctx)
