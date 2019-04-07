@testset "errors" begin

let
    ex = CuError(0)
    @test CUDAdrv.name(ex) == "SUCCESS"
    @test CUDAdrv.description(ex) == "no error"
    
    io = IOBuffer()
    showerror(io, ex)
    str = String(take!(io))

    @test occursin("0", str)
    @test occursin("no error", str)
end

let
    ex = CuError(0, "foobar")
    
    io = IOBuffer()
    showerror(io, ex)
    str = String(take!(io))

    @test occursin("foobar", str)
end

end
