using UiPathOrchestratorJobSchedulingPlanCreate
using DataFrames
using Test
using XLSX

@testset "UiPathOrchestratorJobSchedulingPlanCreate.jl" begin
    # Write your own tests here.
    jobname=Array{Any}(["スケジュール1","スケジュール2","スケジュール3","スケジュール4","スケジュール5","スケジュール6","スケジュール7","スケジュール8","スケジュール9","スケジュール10"])
    runtime=Array{Any}([30,60,15,15,30,45,30,15,60,30])
    Specifiedtime=Array{Any}([true,true,true,true,true,false,false,false,false,false])
#    JobStartTime=Array{Any}(["00:30:00",missing,missing,missing,missing,missing])
#    JobEndTime=Array{Any}([])
#    "00:00:00"=Array{Any}([missing,missing,missing,missing,missing,missing])
#    00:15:00=Array{Any}([missing,missing,missing,missing,missing,missing])
#    00:30:00=Array{Any}([])
#    00:45:00=Array{Any}([])
#    01:00:00=Array{Any}([])
#    01:15:00=Array{Any}([])
#    01:30:00=Array{Any}([])
#    01:45:00=Array{Any}([])
#    02:00:00=Array{Any}([])
    schedule=DataFrame(jobname=jobname,runtime=runtime,Specifiedtime=Specifiedtime)

    FilePath=joinpath(@__DIR__, "schedule.xlsx")
    @test UiPathOrchestratorJobSchedulingPlanCreate.readprerequisite(FilePath)[1][:,1:3] == schedule
    @test UiPathOrchestratorJobSchedulingPlanCreate.readprerequisite(FilePath)[2:5] == (3,15,6,9)
    
    output=DataFrames.DataFrame(XLSX.readtable(joinpath(@__DIR__, "scheduleoutput.xlsx"), "REPORT_jobplan")...)
    plan,r,runtime=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)
    @test adjustedresultcheck(plan,runtime) == convert(Matrix,output[:,2:end])
end
