function plotplan1(plan::Array,scheduleplan::DataFrame;plotengine="gr")
  gr()

  xs = map(String,names(scheduleplan)[6:end] )
  ys = map(String,scheduleplan[:,:jobname])
  plot=Plots.heatmap(xs, ys, plan, legend=false,c=ColorGradient([:white,:blue]))
end

function plotplan2(plan::Array,scheduleplan::DataFrame;plotengine="gr")
  plotlyjs()

  xs = map(String,names(scheduleplan)[6:end] )
  ys = map(String,scheduleplan[:,:jobname])
  plot=Plots.heatmap(xs, ys, plan, legend=false,c=ColorGradient([:white,:blue]))
end

function exportplan(plan::Array,r::Array;ExcelFilePath::String="")
  if ExcelFilePath=="" 
    ExcelFilePath="UiPathOrchestratorJobSchedulingPlan.xlsx"
  end

 XLSX.writetable(ExcelFilePath, REPORT_A=( collect(DataFrames.eachcol(plan)), DataFrames.names(plan) ), REPORT_B=( collect(DataFrames.eachcol(r)), DataFrames.names(r) ))
end

plotplan=plotplan2
