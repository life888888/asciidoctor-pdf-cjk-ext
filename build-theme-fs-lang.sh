# $1 export FONT_FAM_U="Sans Mono"
# $2 export FONT_FAM_F="SansMono"
# $3 export FONT_FAM_L=sansmono
# $4 export FONT_LANG_U=TC
# $5 export FONT_LANG_L=tc
# $6 export SRC_ZIP_FILE=$6
# $7 export SRC_BASE_URL=$7

export FONT_FAM_U="$1"
export FONT_FAM_F=$2
export FONT_FAM_L=$3

echo "FONT_FAM_U=\"$1\""
echo "FONT_FAM_F=$2"
echo "FONT_FAM_L=$3"

export FONT_LANG_U=$4
export FONT_LANG_L=$5

echo "FONT_LANG_U=$4"
echo "FONT_LANG_L=$5"

export SRC_ZIP_FILE=$6
echo "SRC_ZIP_FILE=$6"

export SRC_BASE_URL=$7
echo "SRC_BASE_URL=$7"

export TMP_DIR=$(mktemp -d -t asciidoctor-pdf-cjk-exts-$(date +%Y%m%d%H%M%S)-XXXX)

export SRC_FILE_URL=$SRC_BASE_URL/$SRC_ZIP_FILE
export LOCAL_CACHE_ZIP="$LOCAL_CACHE_DIR/$SRC_ZIP_FILE"

export FONT_NAME="Noto ${FONT_FAM_U} CJK ${FONT_LANG_U}"
export FONT_NAME_L=noto${FONT_FAM_L}-cjk-${FONT_LANG_L}

export FILE0=LICENSE
export FILE1=Noto${FONT_FAM_F}CJK${FONT_LANG_L}-Regular.ttf
export FILE2=Noto${FONT_FAM_F}CJK${FONT_LANG_L}-Bold.ttf
export FILE3=Noto${FONT_FAM_F}CJK${FONT_LANG_L}-Italic.ttf
export FILE4=Noto${FONT_FAM_F}CJK${FONT_LANG_L}-BoldItalic.ttf

export FILE1_N=${FONT_NAME_L}-normal.ttf
export FILE2_N=${FONT_NAME_L}-bold.ttf
export FILE3_N=${FONT_NAME_L}-italic.ttf
export FILE4_N=${FONT_NAME_L}-bold_italic.ttf

export THEME_TEMPLATE_FILE1=template_default-ext-theme.yml
export THEME_TEMPLATE_FILE2=template_default-theme.yml
export THEME_TEMPLATE_FILE3=template_theme.yml
export THEME_NAME=default-ext-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}
export THEME_FILE1=default-ext-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-theme.yml
export THEME_FILE2=default-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-theme.yml
export THEME_FILE3=noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-theme.yml

export THEME_PDF_1_TEMPLATE_FILE1=template_default-ext-pdf-1-theme.yml
export THEME_PDF_1_TEMPLATE_FILE2=template_default-pdf-1-theme.yml
export THEME_PDF_1_TEMPLATE_FILE3=template_pdf-1-theme.yml
export THEME_PDF_1_NAME=default-ext-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-pdf-1
export THEME_PDF_1_FILE1=default-ext-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-pdf-1-theme.yml
export THEME_PDF_1_FILE2=default-noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-pdf-1-theme.yml
export THEME_PDF_1_FILE3=noto${FONT_FAM_L}-cjk-${FONT_LANG_L}-pdf-1-theme.yml

echo "THEME_PDF_1_TEMPLATE_FILE1=$THEME_PDF_1_TEMPLATE_FILE1"
echo "THEME_PDF_1_TEMPLATE_FILE2=$THEME_PDF_1_TEMPLATE_FILE2"
echo "THEME_PDF_1_TEMPLATE_FILE3=$THEME_PDF_1_TEMPLATE_FILE3"
echo "THEME_PDF_1_NAME=$THEME_PDF_1_NAME"
echo "THEME_PDF_1_FILE1=$THEME_PDF_1_FILE1"
echo "THEME_PDF_1_FILE2=$THEME_PDF_1_FILE2"
echo "THEME_PDF_1_FILE3=$THEME_PDF_1_FILE3"


export LICENSE_FILE1=LICENSE
export LICENSE_FILE2=LICENSE-asciidoctor-pdf
export LICENSE_FILE3=LICENSE-asciidoctor-pdf-cjk-kai_gen_gothic

export LOCAL0=$LOCAL_CACHE_DIR/$FILE0
export LOCAL1=$LOCAL_CACHE_DIR/$FILE1
export LOCAL2=$LOCAL_CACHE_DIR/$FILE2
export LOCAL3=$LOCAL_CACHE_DIR/$FILE3
export LOCAL4=$LOCAL_CACHE_DIR/$FILE4

export JAR_FILE=pdf-ext-${FONT_NAME_L}.jar
export ZIP_FILE=${FONT_NAME_L}.zip

export TMP_DIR=$(mktemp -d -t ${THEME_NAME}-$(date +%Y%m%d%H%M%S)-XXXX)

echo "CREATE TMP_DIR=$TMP_DIR"
mkdir -p $TMP_DIR/data/fonts
mkdir -p $TMP_DIR/data/themes

cp $LICENSE_FILE1 $TMP_DIR/data/themes/
cp $LICENSE_FILE2 $TMP_DIR/data/themes/
cp $LICENSE_FILE3 $TMP_DIR/data/themes/

cp theme-templates/${THEME_TEMPLATE_FILE1} $TMP_DIR/data/themes/${THEME_FILE1}
cp theme-templates/${THEME_TEMPLATE_FILE2} $TMP_DIR/data/themes/${THEME_FILE2}
cp theme-templates/${THEME_TEMPLATE_FILE3} $TMP_DIR/data/themes/${THEME_FILE3}
cp theme-templates/${THEME_PDF_1_TEMPLATE_FILE1} $TMP_DIR/data/themes/${THEME_PDF_1_FILE1}
cp theme-templates/${THEME_PDF_1_TEMPLATE_FILE2} $TMP_DIR/data/themes/${THEME_PDF_1_FILE2}
cp theme-templates/${THEME_PDF_1_TEMPLATE_FILE3} $TMP_DIR/data/themes/${THEME_PDF_1_FILE3}


if [ ! -f "$LOCAL_CACHE_ZIP" ]; then
    echo "$LOCAL_CACHE_ZIP does not exist."
    echo "DOWNLOAD $SRC_FILE_URL TO $LOCAL_CACHE_DIR"
    echo "wget -P \"$LOCAL_CACHE_DIR\" \"$SRC_FILE_URL\""
    wget -P "$LOCAL_CACHE_DIR" "$SRC_FILE_URL"
    sync
    sleep 1
    sync
fi



echo "COPY $LOCAL_CACHE_ZIP TO $TMP_DIR"
echo "cp \"$LOCAL_CACHE_ZIP\" \"$TMP_DIR/\" "
cp "$LOCAL_CACHE_ZIP" "$TMP_DIR/" 

sync
sleep 1
sync

cd $TMP_DIR
echo ""
echo "UNZIP FILE $SRC_ZIP_FILE"
echo "unzip \"$SRC_ZIP_FILE\""
unzip "$SRC_ZIP_FILE"
echo ""

sync
sleep 1
sync



# RENAME
mv $FILE0 $TMP_DIR/data/fonts/$FILE0
mv $FILE1 $TMP_DIR/data/fonts/$FILE1_N
mv $FILE2 $TMP_DIR/data/fonts/$FILE2_N
mv $FILE3 $TMP_DIR/data/fonts/$FILE3_N
mv $FILE4 $TMP_DIR/data/fonts/$FILE4_N

# CREATE THEME FROM TEMPLATE FILE
cd $TMP_DIR/data/themes
echo "CREATE $THEME_FILE1"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_FILE1
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_FILE1
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_FILE1
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_FILE1
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_FILE1

echo "CREATE $THEME_FILE2"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_FILE2
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_FILE2
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_FILE2
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_FILE2
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_FILE2

echo "CREATE $THEME_FILE3"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_FILE3
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_FILE3
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_FILE3
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_FILE3
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_FILE3


echo "CREATE $THEME_PDF_1_FILE1"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_PDF_1_FILE1
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_PDF_1_FILE1
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_PDF_1_FILE1
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_PDF_1_FILE1
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_PDF_1_FILE1

echo "CREATE $THEME_PDF_1_FILE2"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_PDF_1_FILE2
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_PDF_1_FILE2
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_PDF_1_FILE2
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_PDF_1_FILE2
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_PDF_1_FILE2

echo "CREATE $THEME_PDF_1_FILE3"
sed -i "s/VAR_FONT_NAME_VAR/$FONT_NAME/gi" $THEME_PDF_1_FILE3
sed -i "s/VAR_FILE1_N_VAR/$FILE1_N/gi" $THEME_PDF_1_FILE3
sed -i "s/VAR_FILE2_N_VAR/$FILE2_N/gi" $THEME_PDF_1_FILE3
sed -i "s/VAR_FILE3_N_VAR/$FILE3_N/gi" $THEME_PDF_1_FILE3
sed -i "s/VAR_FILE4_N_VAR/$FILE4_N/gi" $THEME_PDF_1_FILE3

sleep 1
sync

# COPY RESULT TO WK
cd $TMP_DIR/
echo "cp -r data $RELEASES_DIR/$FONT_FAM_F/$FONT_LANG_U/"
cp -r data $RELEASES_DIR/$FONT_FAM_F/$FONT_LANG_U/



# CREATE jar
cd $TMP_DIR/
# use jdk 8 build can let jdk 8+ use
echo "CREATE JAR FILE $JAR_FILE"
jar cf $JAR_FILE data/*
sync
sleep 5
mv $JAR_FILE $RELEASES_DIR/

# CREATE zip
cd $TMP_DIR/data
echo "CREATE ZIP FILE $ZIP_FILE"
zip -r $ZIP_FILE *
sync
sleep 5
mv $ZIP_FILE $RELEASES_DIR


echo "DONE!"
