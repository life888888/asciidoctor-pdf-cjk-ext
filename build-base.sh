export APP_DIR=`pwd`
# export TOOL_SCRIPT_DIR=$APP_DIR/tool-scripts
export LOCAL_CACHE_DIR=$APP_DIR/local-cache
export RELEASES_DIR=$APP_DIR/releases
# CHANGE USE_LOCAL=0 DOWNLOAD FROM URL
# CHANGE USE_LOCAL=1 COPY FROM LOCAL_CACHE_DIR
export USE_LOCAL=1

mkdir -p $LOCAL_CACHE_DIR
mkdir -p $RELEASES_DIR
mkdir -p $RELEASES_DIR/Sans
mkdir -p $RELEASES_DIR/SansMono
mkdir -p $RELEASES_DIR/Serif



export SRC_CJK_FONTS_URL=https://github.com/life888888/cjk-fonts-ttf/releases/download/v0.1.0

export SansCJK_SC_ZIP=NotoSansCJK-SC.zip
export SansCJK_TC_ZIP=NotoSansCJK-TC.zip
export SansCJK_HK_ZIP=NotoSansCJK-HK.zip
export SansCJK_JP_ZIP=NotoSansCJK-JP.zip
export SansCJK_KR_ZIP=NotoSansCJK-KR.zip


export SansMonoCJK_SC_ZIP=NotoSansMonoCJK-SC.zip
export SansMonoCJK_TC_ZIP=NotoSansMonoCJK-TC.zip
export SansMonoCJK_HK_ZIP=NotoSansMonoCJK-HK.zip
export SansMonoCJK_JP_ZIP=NotoSansMonoCJK-JP.zip
export SansMonoCJK_KR_ZIP=NotoSansMonoCJK-KR.zip


export SerifCJK_SC_ZIP=NotoSerifCJK-SC.zip
export SerifCJK_TC_ZIP=NotoSerifCJK-TC.zip
export SerifCJK_HK_ZIP=NotoSerifCJK-HK.zip
export SerifCJK_JP_ZIP=NotoSerifCJK-JP.zip
export SerifCJK_KR_ZIP=NotoSerifCJK-KR.zip



