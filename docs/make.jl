push!(LOAD_PATH, "../src/")
using HiddenMarkovModelReaders
using Documenter

using HiddenMarkovModelReaders;
DocMeta.setdocmeta!(HiddenMarkovModelReaders, :DocTestSetup, :(using HiddenMarkovModelReaders); recursive = true);
doctest(HiddenMarkovModelReaders);

makedocs(;
    modules = [HiddenMarkovModelReaders],
    authors = "DanielRivasMD <danielrivasmd@gmail.com> and contributors",
    repo = "https://github.com/DanielRivasMD/HiddenMarkovModelReaders/blob/{commit}{path}#{line}",
    sitename = "HiddenMarkovModelReaders",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://DanielRivasMD.github.io/HiddenMarkovModelReaders",
        assets = String[]
    ),
    pages = [
        "Home" => "index.md",
    ]
)

deploydocs(;
    repo = "github.com/DanielRivasMD/HiddenMarkovModelReaders"
)
