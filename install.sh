#!/bin/bash
wget -q http://xld.googlecode.com/files/xld-20131102.dmg
hdiutil mount xld-20131102.dmg 
cp  -R /Volumes/XLD\ 20131102/XLD.app /Applications/
cp xld /usr/local/bin/
xld -h
