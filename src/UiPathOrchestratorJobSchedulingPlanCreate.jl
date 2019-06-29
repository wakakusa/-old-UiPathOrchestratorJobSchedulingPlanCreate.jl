module UiPathOrchestratorJobSchedulingPlanCreate
  using LinearAlgebra
  using JuMP
  using Cbc
  using XLSX
  using DataFrames
  using Plots
  using GR
  using PlotlyJS

include("core.jl")
include("output.jl")

function uipathorchestratorschedulrecreate(ExcelFilePath::String)
  scheduleplan,robotn,run_unit_time,jobn,timen=readprerequisite(ExcelFilePath)
  plan,r=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)
  plotplan2(plan,scheduleplan)
end

end # module
