#!/bin/bash
rm -rf dist
mkdir dist

cat *.scad | grep -v "include <" > dist/dungeon_customizer.scad
cp stl/*.stl dist
cp *.png dist
