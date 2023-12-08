year=$(date +"%Y")
month=$(date +"%m")
day=$(date +"%d")

filepath=(~/Pictures/Screenshots/$year/$month/$day)

mkdir -p $filepath

if [ $1 == "full" ]
then
	flameshot full -c -p  $filepath
elif [ $1 == "gui" ]
then
	flameshot gui -c -p  $filepath
elif [ $1 == "ocr" ]
then
	#https://gist.github.com/QuentinN42/53396a9cfc341e780da0d123a7e753b7

	TMPDIR=$(mktemp -d -t ocr-XXXXXXXXXX)
	trap "rm -rf $TMPDIR" EXIT
	cd "$TMPDIR"
	flameshot gui -r > img.png
	tesseract -c page_separator="" --oem 1 img.png text -l chi_sim
	#https://github.com/gumblex/tessdata_chi better than normal model
	xclip -sel clip text.txt
fi
