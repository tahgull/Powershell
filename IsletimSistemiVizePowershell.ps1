 Get-Service | Where-Object {$_.DependentServices} |
    Format-List -Property Name, DependentServices, @{
      Label="Services"; Expression={$_.dependentservices.count}
    }

     Get-NetTCPConnection -State Listen |
        Select-Object -Property  LocalAddress,
                                 LocalPort,
                                 RemoteAddress,
                                 RemotePort,
                                @{name='Process';expression={(Get-Process -Id $_.OwningProcess).Name}},
                                CreationTime |
        Format-Table -AutoSize

$output += Get-NetTCPConnection 


$output | Out-File -FilePath./output.txt
   