@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
CHCP 1251
CLS

REM SETLOCAL ENABLEEXTENSIONS
REM SET KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Ultimaker B.V."
REM SET VALUE_NAME="Ultimaker Cura"

REM REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Ultimaker B.V." /f "Ultimaker Cura" /k

ECHO ����������������������������������������������������������������������
ECHO ��������! ������ ������ ��� ������� ������� �� ������ ������ ����������
ECHO �� ����� %USERPROFILE%\APPDATA\ROAMING\CURA\%CURAVERSION%
ECHO ���� �� ������� ������� �����-���� �����, 
ECHO �� ��������� �� ����� ���, ��� ����������.
PAUSE
ECHO ����������������������������������������������������������������������
ECHO ����� ������ ���������:
ECHO ����������������������������������������������������������������������
:CHOOSECURAVERSION
ECHO �������� ������ ��������� Cura, ��� ������� ��������� ���������� ����������:
ECHO ������� 3 ��� Cura 4.3 - 4.3.X
ECHO ������� 4 ��� Cura 4.4 - 4.4.X
ECHO ������� 5 ��� Cura 4.5 - 4.5.X
CHOICE /C 3450 /N /M "������� 0 ��� ����, ����� ����������"
IF ERRORLEVEL 1 SET CURAVERSION=4.3
IF ERRORLEVEL 2 SET CURAVERSION=4.4
IF ERRORLEVEL 3 SET CURAVERSION=4.5
IF ERRORLEVEL 4 GOTO ENDOFTHESCRIPT
ECHO ����������������������������������������������������������������������
ECHO ������� ������ ��������� %CURAVERSION%
ECHO ����������������������������������������������������������������������
SET ROAMINGFOLDER=%USERPROFILE%\AppData\Roaming\cura\%CURAVERSION%
ECHO ����������������������������������������������������������������������
ECHO �������� ������ ������ ����������:
ECHO ����������������������������������������������������������������������
REM definitions
DEL /Q %ROAMINGFOLDER%\definitions\flyingbear_base.def.json
DEL /Q %ROAMINGFOLDER%\definitions\flyingbear_ghost4s.def.json
REM extruders
DEL /Q %ROAMINGFOLDER%\extruders\flyingbear_base_extruder_0.def.json
DEL /Q %ROAMINGFOLDER%\extruders\flyingbear_ghost4s_extruder_0.def.json
REM images
DEL /Q %ROAMINGFOLDER%\images\flying_bear.png
DEL /Q %ROAMINGFOLDER%\images\inverted.png
DEL /Q %ROAMINGFOLDER%\images\heated_bed.png
REM materials
RD /S /Q %ROAMINGFOLDER%\materials\FD_Plast
REM quality
RD /S /Q %ROAMINGFOLDER%\quality\flyingbear
REM variants
DEL /Q %ROAMINGFOLDER%\variants\flyingbear*
REM Local
RD /S /Q %USERPROFILE%\AppData\Local\cura
CLS

ECHO ����������������������������������������������������������������������
ECHO ����������� ����� ������
ECHO ����������������������������������������������������������������������
XCOPY /E /I /Y definitions %ROAMINGFOLDER%\definitions
XCOPY /E /I /Y extruders %ROAMINGFOLDER%\extruders
XCOPY /E /I /Y images %ROAMINGFOLDER%\images
XCOPY /E /I /Y materials %ROAMINGFOLDER%\materials
XCOPY /E /I /Y meshes %ROAMINGFOLDER%\meshes
IF NOT %CURAVERSION% == 4.5 (
    XCOPY /E /I /Y quality%CURAVERSION% %ROAMINGFOLDER%\quality
    XCOPY /E /I /Y variants%CURAVERSION% %ROAMINGFOLDER%\variants
) ELSE (
    XCOPY /E /I /Y quality %ROAMINGFOLDER%\quality
    XCOPY /E /I /Y variants %ROAMINGFOLDER%\variants
)

CLS
ECHO ����������������������������������������������������������������������
ECHO ���������� ���������
ECHO ����������������������������������������������������������������������

PAUSE

:ENDOFTHESCRIPT
