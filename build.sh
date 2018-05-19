#!/bin/bash

LESS_DIR=./static/assets/less
LESS_FILE=style.less
CSS_DIR=./static/assets/css
CSS_FILE=style.min.css
CSS_TMP_FILE=tmp.css

echo -e "\033[0;32mBuilding public assets...\033[0m"

# transpile less to temp css
echo -e "\033[0;32m- Transpiling css...\033[0m"
lessc $LESS_DIR/$LESS_FILE > $CSS_DIR/$CSS_TMP_FILE

# uglify temp css to final css
echo -e "\033[0;32m- Uglifying css...\033[0m"
uglifycss $CSS_DIR/$CSS_TMP_FILE > $CSS_DIR/$CSS_FILE

# delete temp css
rm -f $CSS_DIR/$CSS_TMP_FILE
