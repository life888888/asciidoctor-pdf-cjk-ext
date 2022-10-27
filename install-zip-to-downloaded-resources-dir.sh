# DOWNLOAD AND INSTALL asciidoctor-pdf-cjk-ext ttf and theme TO local dir downloaded-resources
# USEAGE:
#         ./install-zip-to-downloaded-resources-dir.sh
#         YOU NEED CHANGE FONT_LANG=YOUR-LANG-CODE in this script file
#         EX: FONT_LANG=tc
#   OR
#         ./install-zip-to-downloaded-resources-dir.sh YOUR-LANG-CODE
#         EX:
#         ./install-zip-to-downloaded-resources-dir.sh tc
#

# SAVE ZIP Under User Home DIR downloaded-resources
# CAN SHARE IT FOR MANY asciidoctor-pdf-cjk-ext-examples PROJECTS

mkdir -p ~/downloaded-resources
TMP_DIR=~/downloaded-resources
echo "THIS FOLDER CREATE BY asciidoctor-pdf-cjk-ext-examples" >> $TMP_DIR/README.txt
echo "SAVE DOWNLOAD asciidoctor-pdf-cjk-ext FONTS AND THEMES" >> $TMP_DIR/README.txt
echo "DO NOT KILL XXXX.zip.save" >> $TMP_DIR/README.txt
echo "XXXX.zip.save IS AVOID DOWNLOAD XXXX.zip AGAIN!" >> $TMP_DIR/README.txt

DOWNLOAD_BASE=https://github.com/life888888/asciidoctor-pdf-cjk-ext/releases/download/v0.1.0

# FONT LANGUAGE CODE
# sc (Simplified Chinese)
# tc (Traditional Chinese)
# hk (Hong Kong)
# jp (Japanese)
# kr (Korean)

FONT_LANG=tc

if [ -z "$1" ]
then
      echo ""
else
      FONT_LANG=$1
      echo "SET FONT_LANG=$1"
fi

echo "FONT_LANG=$FONT_LANG"

NOTO_FONTS=("sans" "sansmono" "serif")

echo "cd $TMP_DIR"
cd $TMP_DIR
echo ""

for FONT_NAME in ${NOTO_FONTS[@]}; do
  ZIP_FILE=noto${FONT_NAME}-cjk-${FONT_LANG}.zip
  if [ ! -f "${ZIP_FILE}.save" ]; then
    echo "$ZIP_FILE not found!"
    DOWNLOAD_ZIP_FILE_URL=${DOWNLOAD_BASE}/${ZIP_FILE}
    echo "wget $DOWNLOAD_ZIP_FILE_URL"
    wget $DOWNLOAD_ZIP_FILE_URL
    touch ${ZIP_FILE}.save    
    # overwrite existing file with no prompt
    # unzip -o ${ZIP_FILE}
    # not overwrite existing file with no prompt    
    unzip -n ${ZIP_FILE}    
    rm ${ZIP_FILE}
  else
    echo "$ZIP_FILE is existing!"
  fi
done

echo "DONE!"
