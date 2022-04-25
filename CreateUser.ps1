$csv = Import-Csv "C:\Users\raj\Desktop\Book1.csv"


foreach($LINE in $CSV)
{
$NewUser="$($LINE.USERNAME)"
$NewPass="$($LINE.PASSWORD)" 
$SecurePass=ConvertTo-SecureString –AsPlainText -Force -String "$NewPass"
New-LocalUser -Name $NewUser -Password $SecurePass
Set-LocalUser -Name $NewUser -PasswordNeverExpires $True
Set-LocalUser -Name $Newuser -UserMayChangePassword $False
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $Newuser
}