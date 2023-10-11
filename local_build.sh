#!/bin/bash

function cleanup {
    echo "Cleaning up."
    /bin/rm -rf content/* 
    /bin/rm -rf public/* 
    /bin/rm -rf static/data/yeast/* 
}

trap cleanup EXIT

cleanup
cp -R fresh_content/* content 
cd yeast
cargo run --verbose
cat output/genealogy.dot | dot -Tsvg > output/genealogy.svg 
cp -R output/* ../static/data/yeast 
cd .. 
zola serve
