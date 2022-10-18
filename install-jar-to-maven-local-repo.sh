# DOWNLOAD AND INSTALL asciidoctor-pdf-cjk-ext JAR TO LOCAL MAVEN REPO
# USEAGE:
#         ./install-jar-to-maven-local-repo.sh
#         YOU NEED CHANGE FONT_LANG=YOUR-LANG-CODE in this script file
#         EX: FONT_LANG=tc
#   OR
#         ./install-jar-to-maven-local-repo.sh YOUR-LANG-CODE
#         EX:
#         ./install-jar-to-maven-local-repo.sh jp
#

DOWNLOAD_BASE=https://github.com/life888888/asciidoctor-pdf-cjk-ext/releases/download/v0.1.0

TMP_DIR=$(mktemp -d -t asciidoctor-pdf-cjk-ext-example-$(date +%Y%m%d%H%M%S)-XXXX)

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
  DOWNLOAD_JAR_FILE_URL=${DOWNLOAD_BASE}/${JAR_FILE}
  echo "wget $DOWNLOAD_JAR_FILE_URL"
  wget $DOWNLOAD_JAR_FILE_URL
  
  echo ""
  echo "mvn install:install-file \\
  -Dfile=${JAR_FILE} \\
  -DgroupId=com.life888888.lab \\
  -DartifactId=pdf-ext-noto${FONT_NAME}-cjk-${FONT_LANG} \\
  -Dversion=0.1.0 \\
  -Dpackaging=jar"
  
   mvn install:install-file \
  -Dfile=${JAR_FILE} \
  -DgroupId=com.life888888.lab \
  -DartifactId=pdf-ext-noto${FONT_NAME}-cjk-${FONT_LANG} \
  -Dversion=0.1.0 \
  -Dpackaging=jar
  
echo ""
  
done

echo "DONE!"

