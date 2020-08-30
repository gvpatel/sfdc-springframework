$From = "gaurang.patel@lexisnexis.com"
$To = "gvpatel@gmail.com"
$Attachment = "C:\Users\patelgv\dataloader\v49.0.0\status\error082820094419205.csv"
$Subject = "Here's the Email Subject"
$Body = "This is what I want to say"
$SMTPServer = "smtp.gmail.com"
$dataloader = "C:\Users\patelgv\dataloader\v49.0.0\bin\process.bat"
$dlconfig = "C:\Users\patelgv\dataloader\v49.0.0\configsPOC"
$dlLogFolder = "C:\Users\patelgv\dataloader\v49.0.0\status\" 

$sfuser = "gvpatel_2020@gmail.com"
$sfpassword = "EncryptedKey"
$sfurl = "https://login.salesforce.com"
$dbconnectstring = "jdbc connect string"
$dbuser = "user"
$dbpassword = "password"

set-location "C:\Users\patelgv\dataloader\v49.0.0\bin"
Set-Content -Path $dlconfig"\currentdatetime.txt" -Value $(Get-Date).ToString('yyyy-MM-ddTHH:mm:ss.000Z')
Get-Content $dlconfig\process-conf-templ.xml | Foreach-Object{$_ -replace '#LAST_EXTRACT_RUN_DATE_TIME#',(Get-Content $dlconfig\$processname)} | Foreach-Object{$_ -replace  '#SFUSERNAME#', $sfuser} | Foreach-Object{$_ -replace  '#PASSWORD#', $sfpassword} | Foreach-Object{$_ -replace  '#SFURL#', $sfurl} | set-content $dlconfig"\process-conf.xml"
Get-Content $dlconfig\database-conf-templ.xml | Foreach-Object{$_ -replace '#LAST_EXTRACT_RUN_DATE_TIME#',(Get-Content $dlconfig\$processname)} | Foreach-Object{$_ -replace  '#DBUSERNAME#', $dbuser} | Foreach-Object{$_ -replace  '#DBPASSWORD#', '"$dbpassword"'} | Foreach-Object{$_ -replace  '#DBCONNECTSTRING#', $dbconnectstring} | set-content $dlconfig"\database-conf.xml"
Set-Content -Path $dlconfig\$processname -Value ((Get-Content $dlconfig"\currentdatetime.txt"))