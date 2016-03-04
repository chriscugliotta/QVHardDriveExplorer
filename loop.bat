REM Hard drive enumerator
REM Loop iteration
REM Chris Cugliotta
REM May 18, 2012 


REM ================
REM [1]  Read inputs
REM ================

REM Loop iteration script
set loop=%1
REM Output file
set output=%2
REM Parent directory
set parent=%3
REM Current directory
set directory=%4

REM Iteration entry logging
REM echo Now entering %directory% >> %output%

REM Change directory
cd %directory%
if %directory%=="C:" cd "C:\"
if %directory%=="D:" cd "D:\"
if %directory%=="E:" cd "E:\"
if %directory%=="F:" cd "F:\"
if %directory%=="G:" cd "G:\"


REM ==============
REM [2]  File loop
REM ==============

REM If we're stuck in an infinite loop, abandon ship
REM echo "cd"="%cd%" >> %output%
REM echo parent="%parent%" >> %output%
if not %parent%=="" if not "%cd%"==%directory% goto recursionExit

REM Enumerate all files in current directory
for %%i in (%directory%\*) do echo %%i^|,^|%%~ni^|,^|%%~xi^|,^|%%~ai^|,^|%%~di^|,^|%%~zi^|,^|%%~ti >> %output%


REM ================
REM [3]  Folder loop
REM ================

REM for /f "usebackq tokens=*" %i in (`dir /b /a:d`) do echo %i

REM Enable delayed variable expansion... whatever that means...
setLocal enableDelayedExpansion

REM Loop through child folders
for /f "usebackq tokens=*" %%i in (`dir /b /a:d`) do (
  REM Remove quotes
  set nextDirectory=!directory:"=!
  REM Concatenate child folder
  set nextDirectory=!nextDirectory!\%%i
  REM Add quotes
  set nextDirectory="!nextDirectory!"
  REM 'Next step' logging
  REM echo currDirectory=!directory! >> %output%
  REM echo nextDirectory=!nextDirectory! >> %output%
  REM pause  
  REM Recursive step
  REM if not !nextDirectory!=="C:\$Recycle.Bin" if not !nextDirectory!=="C:\app" call %loop% %loop% %output% !directory! !nextDirectory!
  call %loop% %loop% %output% !directory! !nextDirectory!
  REM echo Just finished a call >> %output%
  REM echo cd="%cd%" >> %output%
  REM echo Now directory=!directory! >> %output%
  REM Return to sibling folder
  set directory="%cd%"
  if !directory!=="C:\" set directory="C:"
  if !directory!=="D:\" set directory="D:"
  if !directory!=="E:\" set directory="E:"
  if !directory!=="F:\" set directory="F:"
  if !directory!=="G:\" set directory="G:"
)

goto finalExit
 
:recursionExit
REM echo Just skipped recursion >> %output%

:finalExit

