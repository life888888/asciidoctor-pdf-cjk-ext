@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM # DOWNLOAD AND INSTALL asciidoctor-pdf-cjk-ext ttf and theme TO local dir downloaded-resources
REM # USEAGE:
REM #         install-zip-to-downloaded-resources-dir
REM #         YOU NEED CHANGE FONT_LANG=YOUR-LANG-CODE in this script file
REM #         EX: FONT_LANG=tc
REM #   OR
REM #         install-zip-to-downloaded-resources-dir YOUR-LANG-CODE
REM #         EX:
REM #         install-zip-to-downloaded-resources-dir tc
REM #

REM # SAVE ZIP Under User Home DIR downloaded-resources
REM # CAN SHARE IT FOR MANY asciidoctor-pdf-cjk-ext-examples PROJECTS

SET APP_DIR=%CD%
SET TMP_DIR=%USERPROFILE%\downloaded-resources
MKDIR %TMP_DIR% 2> NUL
@ECHO THIS FOLDER CREATE BY asciidoctor-pdf-cjk-ext-examples >> %TMP_DIR%\README.txt
@ECHO SAVE DOWNLOAD asciidoctor-pdf-cjk-ext FONTS AND THEMES >>  %TMP_DIR%\README.txt
@ECHO DO NOT KILL XXXX.zip.save >>  %TMP_DIR%\README.txt
@ECHO XXXX.zip.save IS AVOID DOWNLOAD XXXX.zip AGAIN! >> %TMP_DIR%\README.txt

SET DOWNLOAD_BASE=https://github.com/life888888/asciidoctor-pdf-cjk-ext/releases/download/v0.1.1

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
    SET FONT_NAME=!NOTO_FONTS[%%i]!
    @ECHO FONT_NAME=!FONT_NAME!
    SET ZIP_FILE=noto!FONT_NAME!-cjk-%FONT_LANG%.zip
    @ECHO ZIP_FILE=!ZIP_FILE!
    IF EXIST "!ZIP_FILE!.save" (
       @ECHO !ZIP_FILE! is existing!
    ) ELSE (
       @ECHO !ZIP_FILE! not found!
       SET DOWNLOAD_ZIP_FILE_URL=%DOWNLOAD_BASE%/!ZIP_FILE!
       @ECHO curl -LJO !DOWNLOAD_ZIP_FILE_URL!
       curl -LJO !DOWNLOAD_ZIP_FILE_URL!
       REM # TODO -CHECK CURL OK
       @ECHO OK > !ZIP_FILE!.save
       TAR -xf !ZIP_FILE!
       DEL !ZIP_FILE!
    )
)

CD %APP_DIR%
ENDLOCAL
@ECHO DONE!
