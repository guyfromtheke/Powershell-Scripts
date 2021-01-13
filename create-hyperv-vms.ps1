$vms = @{
    Name = 'svr1'
    Generation = '2'
    MemoryStartupBytes = '2GB'
    NewVHDPath = 'E:\SERVER - FARM\GFTKE - Homelab\svr1.vhdx'
    newVHDSizeBytes = '40GB'
    SwitchName = 'NAT-Switch'    
}

New-VM @vms

Add-VMDvdDrive `
-VMName $vms.Name `
-Path 'E:\SERVER - FARM\SW_DVD9_Win_Server_STD_CORE_2016_64Bit_English_-4_DC_STD_MLF_X21-70526 (1).iso'


Set-VMFirmware -VMName $vms.Name `
-FirstBootDevice ((Get-VMFirmware -VMName $vms.Name).BootOrder | Where-Object Device -Like *DvD*).Device