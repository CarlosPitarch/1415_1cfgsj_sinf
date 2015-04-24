#!/bin/bash

# Script to convert all mage files from a directory (parameter) into png format file
# it also reduces size

# Sanity checks 



if [ $# -ne 2 ]
then
	echo "Wrong parameters"
	echo "Usage: imgkonvert.sh -a -b -c -d"
	exit 1
fi

oplenght=${#2}

#check $2

if [ $oplenght -gt 1 ]
then
	echo "Wrong. You can't execut more than 1 convert."
	exit 3
fi

if [ $oplenght -lt 1 ]
then
	echo "Wrong. You need 1 convert."
	exit 4
fi
	

#check 
pattern='^[abcd]{1,4}$'
pattern1='^[bcd]*a?[bcd]*$' 
pattern2='^[acd]*b?[acd]*$' 
pattern3='^[abd]*c?[abd]*$' 
pattern4='^[abc]*d?[abc]*$' 


if [[ ! $2 =~ $pattern ]] || [[ ! $2 =~ $pattern1 ]] || [[ ! $2 =~ $pattern2 ]] || [[ ! $2 =~ $pattern3 ]] || [[ ! $2 =~ $pattern4 ]]
then
 echo "same convert"
 exit 2
fi


# Main code

ls -1 $1/*.png > imagefiles

echo " a= 100x100 "
echo " b= 200x200 "
echo " c= 300x300 "
echo " d= 400x400 "


cat imagefiles

case $2 in
     a )

	while read imgfile 
	do
		echo "IMG file: $imgfile"
		lengthname=${#imgfile}
		namefile=${imgfile:0:$lengthname-4}
		convert "$imgfile" -resize 100x100 "$namefile.jpg"
	
	done < imagefiles
	;;
     b )

	while read imgfile 
	do
		echo "IMG file: $imgfile"
		lengthname=${#imgfile}
		namefile=${imgfile:0:$lengthname-4}
		convert "$imgfile" -resize 200x200 "$namefile.jpg"
	
	done < imagefiles
	;;
     c )

	while read imgfile 
	do
		echo "IMG file: $imgfile"
		lengthname=${#imgfile}
		namefile=${imgfile:0:$lengthname-4}
		convert "$imgfile" -resize 300x300 "$namefile.jpg"
	
	done < imagefiles
	;;
     d ) 

	while read imgfile 
	do
		echo "IMG file: $imgfile"
		lengthname=${#imgfile}
		namefile=${imgfile:0:$lengthname-4}
		convert "$imgfile" -resize 400x400 "$namefile.jpg"
	
	done < imagefiles
        ;;
     * )
         echo "Wrong"
        ;;
esac
rm imagefiles
exit 0






