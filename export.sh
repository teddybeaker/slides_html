#!/bin/bash
PATH=$(npm bin):$PATH
DEST_FOLDER=19baselone_markup-tipps

# uncomment reference to font-awesome in slides
rm -rf $DEST_FOLDER

reveal-md slides.md --css theme/css/font-awesome.min.css,css/bluesky-it.css --static $DEST_FOLDER

# copy file from theme
cp -R theme $DEST_FOLDER/_assets

# copy images
mkdir $DEST_FOLDER/theme
cp -R theme/images $DEST_FOLDER/theme/images
cp -R images $DEST_FOLDER
