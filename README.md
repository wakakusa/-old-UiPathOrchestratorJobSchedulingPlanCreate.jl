# UiPathOrchestratorJobSchedulingPlanCreate.jl

[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE)
[![Build Status](https://travis-ci.org/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl.svg?branch=master)](https://travis-ci.org/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl)
[![Coveralls](https://coveralls.io/repos/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl/badge.svg?branch=master)](https://coveralls.io/github/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.jl)


## これは何？
Uipath Orchestatorで効率的なジョブ実行（必要最低限のロボットで実行）ができるようにジョブのタイムスケジュールを作成するプログラムです

## インストール方法
julia>]  
(v1.1) add https://github.com/wakakusa/UiPathOrchestratorJobSchedulingPlanCreate.git  
でプログラムがインストールされます。括弧内の数字は、利用しているバージョンが表示されます。

## 使い方
ファイル　schedule.xlsxをコピーして修正してください。  
ExcelFilePathにはコピーしたschedule.xlsxまでのフルパスを指定してください

uipathorchestratorschedulrecreate(InputFilePath,"parameters","schedule")
を実行してください

## 今後の計画
最適なロボット数の算出
