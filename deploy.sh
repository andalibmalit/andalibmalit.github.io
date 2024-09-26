#!/bin/sh
hugo
git add *
git commit -m "Publishing to GitHub Pages"
git push origin master