export THEME=$1
export THEME_FILE=custom-${THEME}-theme.yml

echo "INPUT 1=$1"
echo "THEME=$THEME"
echo "THEME_FILE=$THEME_FILE"

echo "cp custom-template-theme.yml $THEME_FILE"
cp custom-theme-template.yml $THEME_FILE

echo "CREATE custom-${THEME}-theme.yml"


echo "sed -i "s/VAR_THEME_VAR/$THEME/gi" $THEME_FILE"
sed -i "s/VAR_THEME_VAR/$THEME/gi" $THEME_FILE

sleep 2
echo ""
echo "DONE!"

