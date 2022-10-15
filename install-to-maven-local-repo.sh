export APP_DIR=`pwd`

# PLEASE CHANGE JAR_DIR TO THE DOWNLOAD JAR FOLDER
export JAR_DIR=$APP_DIR/releases

export PATH=$APP_DIR:$PATH

FONTS_FILE="data_fonts-list.txt"
LANGS_FILE="data_langs-list.txt"
echo "INSTALL JAR TO LOCAL MAVEN REPO"
while read -r LINE_FONT; do
    FONT_NAME="$LINE_FONT"
    while read -r LINE_LANG; do
         LANG_NAME="$LINE_LANG"
echo ""         
echo "mvn install:install-file \\
  -Dfile=${JAR_DIR}/pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME}.jar \\
  -DgroupId=com.life888888.lab \\
  -DartifactId=pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME} \\
  -Dversion=0.1.0 \\
  -Dpackaging=jar"
echo ""

 mvn install:install-file \
  -Dfile=${JAR_DIR}/pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME}.jar \
  -DgroupId=com.life888888.lab \
  -DartifactId=pdf-ext-noto${FONT_NAME}-cjk-${LANG_NAME} \
  -Dversion=0.1.0 \
  -Dpackaging=jar
         
    done < "$LANGS_FILE"
done < "$FONTS_FILE"
