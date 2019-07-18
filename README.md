# UiPathOrchestratorJobSchedulingPlanCreate

[![Build Status](https://travis-ci.org/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.svg?branch=master)](https://travis-ci.org/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate)
[![Coveralls](https://coveralls.io/repos/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate/badge.svg?branch=master)](https://coveralls.io/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate)

## これは何？
uipath Orchestatorで効率的なジョブ実行（必要最低限のロボットで実行）ができるようにジョブのタイムスケジュールを作成するプログラムです

## インストール方法
] add https://github.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.git  
でプログラムがインストールされます

## 使い方
ファイル　./test/schedule.xlsxをコピーして修正してください。  
ExcelFilePathにはコピーしたschedule.xlsxまでのフルパスを指定してください

scheduleplan,robotn,run_unit_time,jobn,timen=readprerequisite(ExcelFilePath)  
plan,r,runtime=uipathorchestratorschedulreadjustment(scheduleplan,robotn,run_unit_time,jobn,timen)  
plan=adjustedresultcheck(plan,runtime)  
plotplan2(plan,scheduleplan)  

## 今後の計画
計算結果のExcel出力などなど
