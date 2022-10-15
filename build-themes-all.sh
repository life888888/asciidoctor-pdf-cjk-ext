source build-base.sh

# Noto Font CJK: 1 = Build , 0 = None
# * Noto Sans CJK
# * Noto Sans Mono CJK
# * Noto Serif CJK
export BUILD_FONT_FS_SANS=1
export BUILD_FONT_FS_SANSMONO=1
export BUILD_FONT_FS_SERIF=1

# Languages: 1 = Build , 0 = None
# * SC (Simplified Chinese)
# * TC (Traditional Chinese)
# * HK (Hong Kong)
# * JP (Japanese)
# * KR (Korean)
export BUILD_FONT_LANG_SC=1
export BUILD_FONT_LANG_TC=1
export BUILD_FONT_LANG_HK=1
export BUILD_FONT_LANG_JP=1
export BUILD_FONT_LANG_KR=1


export PATH=`pwd`:$PATH


# build-theme-fs-lang.sh input parameter
# $1 export FONT_FAM_U="Sans Mono"
# $2 export FONT_FAM_F="SansMono"
# $3 export FONT_FAM_L=sansmono
# $4 export FONT_LANG_U=TC
# $5 export FONT_LANG_L=tc
# $6 export SRC_ZIP_FILE=$6
# $7 export SRC_BASE_URL=$7
export B_SRC_BASE_URL=$SRC_CJK_FONTS_URL
if [ $BUILD_FONT_FS_SANS -eq 1 ]
then
  echo "BUILD FONT - NOTO SANS CJK START"
  export B_FONT_FAM_U="Sans"
  export B_FONT_FAM_F="Sans"
  export B_FONT_FAM_L="sans"

  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG_U=HK
      export B_FONT_LANG_L=hk
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
      
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG_U=JP
      export B_FONT_LANG_L=jp
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL

  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG_U=KR
      export B_FONT_LANG_L=kr
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL

      
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG_U=SC
      export B_FONT_LANG_L=sc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL 
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG_U=TC
      export B_FONT_LANG_L=tc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo ""
  echo "BUILD FONT - NOTO SANS CJK END"   
fi
echo "#####"
echo ""

if [ $BUILD_FONT_FS_SANSMONO -eq 1 ]
then
  echo "BUILD FONT - NOTO SANS MONO CJK START"
  export B_FONT_FAM_U="Sans Mono"
  export B_FONT_FAM_F="SansMono"
  export B_FONT_FAM_L="sansmono"
  
  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG_U=HK
      export B_FONT_LANG_L=hk
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG_U=JP
      export B_FONT_LANG_L=jp
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL   
  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG_U=KR
      export B_FONT_LANG_L=kr
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG_U=SC
      export B_FONT_LANG_L=sc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG_U=TC
      export B_FONT_LANG_L=tc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo ""
  echo "BUILD FONT - NOTO SANS MONO CJK END"  
fi
echo "#####"
echo ""

if [ $BUILD_FONT_FS_SERIF -eq 1 ]
then
  echo "BUILD FONT - NOTO SERIF CJK START"
  export B_FONT_FAM_U="Serif"
  export B_FONT_FAM_F="Serif"
  export B_FONT_FAM_L="serif"
  
  if [ $BUILD_FONT_LANG_HK -eq 1 ]
  then
      echo "BUILD FONT LANG- HK"
      export B_FONT_LANG_U=HK
      export B_FONT_LANG_L=hk
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_JP -eq 1 ]
  then
      echo "BUILD FONT LANG- JP"
      export B_FONT_LANG_U=JP
      export B_FONT_LANG_L=jp
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL

  fi 
  echo ""
    
  if [ $BUILD_FONT_LANG_KR -eq 1 ]
  then
      echo "BUILD FONT LANG- KR"
      export B_FONT_LANG_U=KR
      export B_FONT_LANG_L=kr
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
      
  fi
  echo ""
  
  if [ $BUILD_FONT_LANG_SC -eq 1 ]
  then
      echo "BUILD FONT LANG- SC"
      export B_FONT_LANG_U=SC
      export B_FONT_LANG_L=sc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
      
  fi
  echo "" 
  
  if [ $BUILD_FONT_LANG_TC -eq 1 ]
  then
      echo "BUILD FONT LANG- TC"
      export B_FONT_LANG_U=TC
      export B_FONT_LANG_L=tc
      export B_SRC_ZIP_FILE=Noto${B_FONT_FAM_F}CJK-${B_FONT_LANG_U}.zip
      echo "build-theme-fs-lang.sh \"$B_FONT_FAM_U\" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL"
      build-theme-fs-lang.sh "$B_FONT_FAM_U" $B_FONT_FAM_F $B_FONT_FAM_L $B_FONT_LANG_U $B_FONT_LANG_L $B_SRC_ZIP_FILE $B_SRC_BASE_URL
      
  fi
  echo ""
  echo "BUILD FONT - NOTO SERIF CJK END" 
fi
echo "#####"
echo ""

