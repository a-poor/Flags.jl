module Flags


export Flag, FlagParser, BoolFlag, parse, formathelp, printhelp


struct Flag
    name::String
    default::Any
    usage::String
end

Flag(
    name::String, 
    default=nothing, 
    usage=""
) = Flag(name, default, usage)


function BoolFlag(name::String, usage::String)::Flag
    Flag(name, false, usage)
end


function formathelp(flag::Flag)::String
    if length(flag.name) == 1
        f = "-$(flag.name)"
    else
        f = "--$(flag.name)"
    end

    if flag.default === nothing
        d = ""
    else
        d = "=$(flag.default)"
    end

    """  $f$d: $(flag.usage)"""
end


struct FlagParser
    name::String
    flags::Vector{Flag}

    FlagParser(name="", flags=Vector{Flag}()) = new(name, flags)
end


function printhelp(parser::FlagParser)
    if length(parser.name) > 0
        name = parser.name
    else
        name = PROGRAM_FILE
    end
    
    println("Usage of $name:")
    for flag in parser.flags
        println(formathelp(flag))
    end
end


function parse(parser::FlagParser, args::Vector{String})
    
end


end # module
