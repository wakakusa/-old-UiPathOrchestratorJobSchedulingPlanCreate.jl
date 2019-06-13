using UiPathOrchestratorJobSchedulingPlanCreate
using DataFrames
using Test

@testset "UiPathOrchestratorJobSchedulingPlanCreate.jl" begin
    # Write your own tests here.
    jobname=Array{Any}(["スケジュール1","スケジュール2","スケジュール3","スケジュール4","スケジュール5","スケジュール6"])
    runtime=Array{Any}([30,30,15,15,30,45,])
    Specifiedtime=Array{Any}([true,false,false,true,false,true])
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
end
