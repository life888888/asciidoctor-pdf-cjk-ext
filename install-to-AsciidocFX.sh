export APP_DIR=`pwd`

# PLEASE CHANGE JAR_DIR TO THE DOWNLOAD JAR FOLDER
export JAR_DIR=$APP_DIR/releases


export PATH=$APP_DIR:$PATH

# PLEASE CHANGE AsciidocFX_DIR TO YOUR ASCIIDOCFX INSTALL FOLDER
export AsciidocFX_DIR=/home/demo/TOOLS/AsciidocFX

FONTS_FILE="data_fonts-list.txt"

# PLEASE CHANGE data_langs-list.txt CONTENT, ONLY KEEP YOUR LANGUAGE , EX: tc
LANGS_FILE="data_langs-list.txt"

echo "INSTALL JAR TO ASCIIDOCFX LIB FOLDER"
while read -r LINE_FONT; do
    FONT_NAME="$LINE_FONT"
    while read -r LINE_LANG; do
         LANG_NAME="$LINE_LANG"

echo ""
echo "cp ${JAR_DIR}/pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME}.jar ${AsciidocFX_DIR}/lib/"
echo ""
cp ${JAR_DIR}/pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME}.jar ${AsciidocFX_DIR}/lib/

    done < "$LANGS_FILE"
done < "$FONTS_FILE"
