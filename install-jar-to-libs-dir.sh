# DOWNLOAD AND INSTALL asciidoctor-pdf-cjk-ext JAR TO local dir libs
# USEAGE:
#         ./install-jar-to-libs-dir.sh
#         YOU NEED CHANGE FONT_LANG=YOUR-LANG-CODE in this script file
#         EX: FONT_LANG=tc
#   OR
#         ./install-jar-to-libs-dir.sh YOUR-LANG-CODE
#         EX:
#         ./install-jar-to-libs-dir.sh tc
#

# SAVE JAR Under Project DIR libs
# export APP_DIR=`pwd`
# mkdir -p $APP_DIR/libs
# TMP_DIR=$APP_DIR/libs

# SAVE JAR Under User Home DIR libs
# CAN SHARE IT FOR MANY asciidoctor-pdf-cjk-ext-examples PROJECTS

mkdir -p ~/libs
TMP_DIR=~/libs
echo "THIS FOLDER CREATE BY asciidoctor-pdf-cjk-ext-examples" >> $TMP_DIR/README.txt
echo "SAVE DOWNLOAD JAR" >> $TMP_DIR/README.txt

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
  JAR_FILE=pdf-ext-noto${FONT_NAME}-cjk-${FONT_LANG}.jar
  if [ ! -f $JAR_FILE ]; then
    echo "$JAR_FILE not found!"
    DOWNLOAD_JAR_FILE_URL=${DOWNLOAD_BASE}/${JAR_FILE}
    
    if [[ $OSTYPE == 'darwin'* ]]; then
       echo "macOS"
       echo "curl -LJO $DOWNLOAD_JAR_FILE_URL"
       curl -LJO $DOWNLOAD_JAR_FILE_URL
    else
       echo "linux"
       echo "wget $DOWNLOAD_JAR_FILE_URL"
       wget $DOWNLOAD_JAR_FILE_URL
    fi
  else
    echo "$JAR_FILE is existing!"
  fi
done

echo "DONE!"

