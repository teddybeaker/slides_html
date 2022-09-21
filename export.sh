#!/bin/bash
PATH=$(npm bin):$PATH
DEST_FOLDER=semantic_markup

# uncomment reference to font-awesome in slides
rm -rf $DEST_FOLDER

npx reveal-md slides.md --css css/slide-example-styles.css --static $DEST_FOLDER

