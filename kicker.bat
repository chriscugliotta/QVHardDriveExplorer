REM Hard drive enumerator
REM Kicker
REM Chris Cugliotta
REM May 18, 2012 

REM ===============
REM [1]  Parameters
REM ===============

REM Specify root directory
REM We will only enumerate files within this folder
REM To enumerate the entire hard drive, pick root = 'C:'
set root="C:"

REM WARNING:  The root path should be enclosed in double quotation marks.
REM In addition, the trailing character should NOT be a backslash.  For
REM instance, "C:\Users" is acceptable.  "C:\Users\" is not.

REM WARNING:  Do not edit anything beyond this point.



REM ===============
REM [2]  Initialize
REM ===============

REM Specify kicker file directory
set kicker="%~dp0"

REM Specify loop iteration script
REM This file should be placed in the same folder as 'kicker.bat'
set loop=%kicker%"\loop.bat"

REM Specify output file
REM This file will be created in the same folder as 'kicker.bat'
set output=%kicker%"\data.csv"

REM Initialize current directory
set directory=%root%

REM Initialize output header
echo Path^|,^|Name^|,^|Extension^|,^|Attributes^|,^|Drive^|,^|Size^|,^|LastModifiedDate > %output%



REM ==========
REM [3]  Loop
REM ==========

REM Call first iteration
call %loop% %loop% %output% "" %directory%
REM pause

