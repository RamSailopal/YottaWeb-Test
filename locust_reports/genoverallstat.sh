#!/bin/bash
cp -f statsmaster.html overallstats.html
awk --file awkscript *.html  >> overallstats.html
