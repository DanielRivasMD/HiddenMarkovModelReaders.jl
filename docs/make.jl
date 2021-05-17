using HiddenMarkovModelReaders
using Documenter

DocMeta.setdocmeta!(HiddenMarkovModelReaders, :DocTestSetup, :(using HiddenMarkovModelReaders); recursive=true)

makedocs(;
    modules=[HiddenMarkovModelReaders],
    authors="DanielRivasMD <danielrivasmd@gmail.com> and contributors",
    repo="https://github.com/DanielRivasMD/HiddenMarkovModelReaders.jl/blob/{commit}{path}#{line}",
    sitename="HiddenMarkovModelReaders.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://DanielRivasMD.github.io/HiddenMarkovModelReaders.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/DanielRivasMD/HiddenMarkovModelReaders.jl",
)
