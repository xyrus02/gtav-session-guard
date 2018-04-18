@echo off

for /F "tokens=* USEBACKQ" %%F in (`powershell -nologo -noprofile -command "import-module '%~d0%~p0tools\pacman\modules\configuration.psm1';(new-PropertyContainer '%~d0%~p0config.json').getProperty('DefaultEnvironment')"`) DO (
  set ENV=%%F
)

powershell -nologo -command ".'%~d0%~p0tools\pacman\LoadEnvironment.ps1' -Silent -Environment '%ENV%'; %*"