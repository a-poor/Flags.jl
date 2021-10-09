using Test, Flags

@testset "Flags.jl" begin

f = Flag("a", 1, "hello world")
@test formathelp(f) == "  -a=1: hello world"

end
