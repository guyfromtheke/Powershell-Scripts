#get the last logon time for a user in the domain

$username = Read-Host "Enter Name : ?"
    $dc = (Get-AddomainController).Name
        foreach ($dc in $dcs)
         {
          $hostname = $dc
          $user = Get-ADUser $username -server $hostname -properties LastLogon
          $isexpired = $user.lastlogon
          
          if (-not ($isexpired)) {$isexpired = 0 }
          if (($isexpired -eq 0) -or ($isexpired -gt [DateTime]::MaxValue.Ticks))
          {
              $lastLogon = "user never logged In"
          }
          else
           {
           $Date = [DateTime]$isexpired 
           $lastLogon = $Date.AddYears(1600).ToLocalTime()  
          }
        }
        Write-Host $username "Last logged on at:" $lastLogon

#Credit to Mastering Active Directory book - with a little edits to fit my homelab env.