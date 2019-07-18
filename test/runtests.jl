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

    InputFilePath=joinpath(@__DIR__, "schedule.xlsx")
    OutputFilePath=joinpath(@__DIR__, "scheduleoutput.xlsx")

    scheduleplan,robotn,run_unit_time,jobn,timen=UiPathOrchestratorJobSchedulingPlanCreate.readprerequisite(InputFilePath)
    @test scheduleplan[:,1:3] == schedule
    @test (robotn,run_unit_time,jobn,timen) == (6,15,10,9)
    
    output=DataFrames.DataFrame(XLSX.readtable(OutputFilePath, "REPORT_jobplan")...)
    plan,r,runtime=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)
    @test adjustedresultcheck(plan,runtime) == convert(Matrix,output[:,2:end])
    @test uipathorchestratorschedulrecreate(InputFilePath) == convert(Matrix,output[:,2:end])
    
    #ジョブスケジュール作成失敗の場合のテスト
    robotn=1
    plan,r,runtime=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)
    @test adjustedresultcheck(plan,runtime) == zeros(Int,jobn,timen)

end
