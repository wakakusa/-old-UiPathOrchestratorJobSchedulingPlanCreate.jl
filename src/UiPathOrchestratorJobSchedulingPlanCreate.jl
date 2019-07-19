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

function uipathorchestratorschedulrecreate(ExcelFilePath::String;exportplan::Bool=false,ExportExcelFilePath::String="")
  scheduleplan,robotn,run_unit_time,jobn,timen=readprerequisite(ExcelFilePath)
  plan,r,runtime=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)
  plan=adjustedresultcheck(plan,runtime,scheduleplan)
  plotplan2(plan)

  if(exportplan)
    exportplan(plan,r,ExcelFilePath=ExportExcelFilePath)
  end

  return plan

end

export uipathorchestratorschedulrecreate,readprerequisite,uipathorchestratorschedulreadjustment,adjustedresultcheck
export exportplan,plotplan,plotplan1,plotplan2
end # module
