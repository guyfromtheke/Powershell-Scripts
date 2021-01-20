#this short script asks you to enter a name of which will query the source of an account lockout in Active Directory. 


$aduser = Read-Host "enter Ad username : "

Get-EventLog -LogName Security -InstanceId 4771 | Where-Object Message -match $aduser | Format-Table TimeGenerated,Message -AutoSize -Wrap