using Documenter, UiPathOrchestratorJobSchedulingPlanCreate

# Build documentation.
# ====================

makedocs(
    # options
    modules = [UiPathOrchestratorJobSchedulingPlanCreate],
    doctest = false,
    clean = false,
    sitename = "UiPathOrchestratorJobSchedulingPlanCreate.jl",
    format = Documenter.HTML(),
    pages = Any[
        "Introduction" => "index.md",
        "User Guide" => Any[
            "Getting Started" => "man/getting_started.md",
            "API" => "man/api.md",
            "Excel File" => "man/excel.md"
        ]
    ]
)

# Deploy built documentation from Travis.
# =======================================

deploydocs(
    # options
    repo = "github.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl.git",
    target = "build",
    deps = nothing,
    make = nothing,
)
