# UiPathOrchestratorJobSchedulingPlanCreate

[![Build Status](https://travis-ci.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl.svg?branch=master)](https://travis-ci.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl)
[![Codecov](https://codecov.io/gh/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl)
[![Coveralls](https://coveralls.io/repos/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl/badge.svg?branch=master)](https://coveralls.io/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl?branch=master)

## これは何？
uipath Orchestatorで効率的なジョブ実行（必要最低限のロボットで実行）ができるようにジョブのタイムスケジュールを作成するプログラムです

## インストール方法
] add https://github.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.git  
でプログラムがインストールされます

## 使い方
ファイル　./test/schedule.xlsxをコピーして修正してください。  
ExcelFilePathにはコピーしたschedule.xlsxまでのフルパスを指定してください

using UiPathOrchestratorJobSchedulingPlanCreate
ExcelFilePath=/home/wakakusa/schedule.xlsx
UiPathOrchestratorJobSchedulingPlanCreate.uipathorchestratorschedulrecreate(ExcelFilePath)

## 今後の計画
計算結果のExcel出力などなど