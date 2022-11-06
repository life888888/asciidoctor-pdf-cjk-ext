@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM # DOWNLOAD AND INSTALL asciidoctor-pdf-cjk-ext JAR TO LOCAL MAVEN REPO
REM # USEAGE:
REM #         install-jar-to-maven-local-repo
REM #         YOU NEED CHANGE FONT_LANG=YOUR-LANG-CODE in this script file
REM #         EX: FONT_LANG=tc
REM #   OR
REM #         install-jar-to-maven-local-repo YOUR-LANG-CODE
REM #         EX:
REM #         install-jar-to-maven-local-repo jp
REM #

SET APP_DIR=%CD%
SET TMP_DIR=%TEMP%\libs
MKDIR %TMP_DIR% 2> NUL

@ECHO  "THIS FOLDER CREATE BY asciidoctor-pdf-cjk-ext-examples" >> %TMP_DIR%\README.txt
@ECHO  "SAVE DOWNLOAD JAR" >> %TMP_DIR%\README.txt

SET DOWNLOAD_BASE=https://github.com/life888888/asciidoctor-pdf-cjk-ext/releases/download/v0.1.0

REM # FONT LANGUAGE CODE
REM # sc (Simplified Chinese)
REM # tc (Traditional Chinese)
REM # hk (Hong Kong)
REM # jp (Japanese)
REM # kr (Korean)

SET FONT_LANG=tc

IF [%1]==[] (
@ECHO 
) else (
SET FONT_LANG=%1
@ECHO SET FONT_LANG=%1
)

@ECHO FONT_LANG=%FONT_LANG%

@ECHO CD %TMP_DIR%
CD %TMP_DIR%

SET NOTO_FONTS[0]=sans
SET NOTO_FONTS[1]=sansmono
SET NOTO_FONTS[2]=serif

FOR %%i IN (0,1,2) DO (
   CALL:myGetFunc !NOTO_FONTS[%%i]!,%FONT_LANG%
)

CD %APP_DIR%
ENDLOCAL
@ECHO DONE!
ECHO.&PAUSE&GOTO:EOF

:myGetFunc
::       -- %~1: FONT_NAME
::       -- %~2: FONT_LANG
SETLOCAL

SET FONT_NAME=%~1
SET FONT_LANG=%~2

ECHO %FONT_NAME%
ECHO %FONT_LANG%

SET JAR_FILE=pdf-ext-noto%FONT_NAME%-cjk-%FONT_LANG%.jar
@ECHO JAR_FILE=%JAR_FILE%
IF EXIST "%JAR_FILE%" (
   @ECHO %JAR_FILE% is existing!
) ELSE (
@ECHO %JAR_FILE% not found!
SET DOWNLOAD_JAR_FILE_URL=%DOWNLOAD_BASE%/%JAR_FILE%
@ECHO curl -LJO %DOWNLOAD_JAR_FILE_URL%
curl -LJO %DOWNLOAD_JAR_FILE_URL%
mvn install:install-file -Dfile=%JAR_FILE% -DgroupId=com.life888888.lab -DartifactId=pdf-ext-noto%FONT_NAME%-cjk-%FONT_LANG% -Dversion=0.1.0 -Dpackaging=jar
)
SET JAR_FILE=
SET DOWNLOAD_JAR_FILE_URL=
ENDLOCAL
GOTO:EOF


