#!/bin/bash

# Build script for serving static content instead of php files

DEST="./public_html"
html=".html"

mkdir -p "$DEST/"

# Execute all php files and save them as html
for f in *.php; 
do
	php $f | sed 's:\(<a.*href=".*\)\.php\(".*</a>\):\1\.html\2:g' > "$DEST/${f/.php/$html}";
	echo "Processing $f into ${f/.php/$html}..";
done

#Copy all CSS files
for f in *.css; 
do
	cat $f > "$DEST/$f";
	echo "Processing $f file..";
done

#Copy all img files
for f in "$img/*.png"; 
do
	cat $f > "$DEST/$img/$f";
	echo "Processing $f file..";
done

#Copy all img files
for f in *.jpg; 
do
	cat $f > "$DEST/$img/$f";
	echo "Processing $f file..";
done

echo "Process complete." ;