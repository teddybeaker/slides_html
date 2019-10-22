#!/bin/bash
PATH=$(npm bin):$PATH
DEST_FOLDER=_markup_tipps
ZIP_FILE_NAME=MarkupTipps.zip

# uncomment reference to font-awesome in slides
rm -rf $DEST_FOLDER
rm -rf $ZIP_FILE_NAME

reveal-md slides.md --css css/bluesky-it.css --static $DEST_FOLDER

# copy file from theme
cp -R theme $DEST_FOLDER/_assets

# copy images
cp -R images $DEST_FOLDER

# zip
zip -r $ZIP_FILE_NAME $DEST_FOLDER
