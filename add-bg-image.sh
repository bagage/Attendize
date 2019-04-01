#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Expected image. Usage: $0 <image> [optional-name]"
	exit 1
fi
if [ $# = 1 ]; then
	name="$(basename $1)"
else
	name="$2".jpg
fi

cd $(dirname $0)

convert "$1" -resize 1280x public/assets/images/public/EventPage/backgrounds/"$name"
convert "$1" -resize 250x public/assets/images/public/EventPage/backgrounds/thumbs/"$name"

git add public/assets/images/public/EventPage && git commit -m "Add $name background image"