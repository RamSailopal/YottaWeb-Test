#!/bin/bash
cp -f statsmaster.html overallstats.html
awk --file awkscript $(find -name '*.html' ! -name statsmaster.html ! -name overallstats.html | sort)  >> overallstats.html
