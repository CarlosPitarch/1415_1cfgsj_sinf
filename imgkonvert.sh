#!/bin/bash

# Script to convert all mage files from a directory (parameter) into png format file
# it also reduces size

# Sanity checks ?

pattern='^[0-9]{3}x[0-9]{3}$'

# headboard

echo ""
echo "###########################################################"
echo "######### Photo converter (png to another format) #########"
echo "###########################################################"
echo ""

# Main code

echo -n "-Input resolution (3 digits): "
read Resolution

echo -n "-Input photo format: "
echo ""
echo "--------------------------------------------------------"
echo "| Suggested formats: bmp - gif - png - jpeg - jpg -tif |"
echo "--------------------------------------------------------"
echo ""
read format
echo ""
echo "-Conversion in progress..."

if [[ "$Resolution" =~ $pattern ]]; then

ls -1 $1/*.png > imagefiles
cat imagefiles
while read imgfile 
do
	echo "IMG file: $imgfile"
	lengthname=${#imgfile}
	namefile=${imgfile:0:$lengthname-4}
	convert "$1/$imgfile" -resize $Resolution "$namefile.$format"
	#mogrify -resize 200x200 *.png
	#mogrify -format png *.jpg

done < imagefiles
rm imagefiles
echo "-Done!!!"

else
echo "-Wrong resolution"
fi

exit 0
