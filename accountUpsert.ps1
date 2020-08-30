$processname = "accountUpsert.txt"

. C:\Users\patelgv\dataloader\v49.0.0\configsPOC\globalparamPOC.ps1

& $dataloader $dlconfig accountUpsert

. C:\Users\patelgv\dataloader\v49.0.0\bin\CheckError.ps1

CheckErrorFile ("{0}error082820094419205.csv" -f $dlLogFolder)

& $dataloader $dlconfig accountStage

CheckErrorFile ("{0}error082820094419205.csv" -f $dlLogFolder)

pause