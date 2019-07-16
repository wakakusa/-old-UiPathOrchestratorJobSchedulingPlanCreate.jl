function plotplan1(plan::Array,scheduleplan::DataFrame;plotengine="gr")
  gr()

  xs = map(String,names(scheduleplan)[6:end] )
  ys = map(String,scheduleplan[:,:jobname])
  plot=Plots.heatmap(xs, ys, plan, legend=false,c=ColorGradient([:white,:blue]))
  gui(plot)
end

function plotplan2(plan::Array,scheduleplan::DataFrame;plotengine="gr")
  plotlyjs()

  xs = map(String,names(scheduleplan)[6:end] )
  ys = map(String,scheduleplan[:,:jobname])
  plot=Plots.heatmap(xs, ys, plan, legend=false,c=ColorGradient([:white,:blue]))
end

function exportplan(plan::Array,scheduleplan::DataFrame;ExcelFilePath::String="")
  if(ExcelFilePath=="")
    ExcelFilePath="UiPathOrchestratorJobSchedulingPlan.xlsx"
  end

  planwork=scheduleplan[6:end]
  for i in 1:size(plan)[2]
    planwork[:,i]=plan[:,i]
  end

  planwork=hcat(scheduleplan[1],planwork)

 XLSX.writetable(ExcelFilePath, REPORT_jobplan=( collect(DataFrames.eachcol(planwork)), DataFrames.names(planwork) )  )
end

function exportfullplan(plan::Array,r::Array,scheduleplan::DataFrame;ExcelFilePath::String="")
  if(ExcelFilePath=="")
    ExcelFilePath="UiPathOrchestratorJobSchedulingPlan.xlsx"
  end

  planwork=scheduleplan[6:end]
  for i in 1:size(plan)[2]
    planwork[:,i]=plan[:,i]
  end

  rwork=scheduleplan[6:end]
  for i in 1:size(plan)[2]
    rwork[:,i]=r[:,i]
  end

 XLSX.writetable(ExcelFilePath, REPORT_jobplan=( collect(DataFrames.eachcol(planwork)), DataFrames.names(planwork) ), REPORT_robotplan=( collect(DataFrames.eachcol(rwork)), DataFrames.names(rwork) ))
end

plotplan=plotplan2
