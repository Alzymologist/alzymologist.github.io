#!/bin/bash

function cleanup {
    echo "Cleaning up."
    /bin/rm -rf content/* 
    /bin/rm -rf public/* 
    /bin/rm -rf static/yeast-component-output 
}

trap cleanup EXIT

cleanup
cp -R content_fresh/* content 
cd yeast
cargo run --verbose
cp -R output/* ../static/yeast-component-output
cd .. 
zola serve
