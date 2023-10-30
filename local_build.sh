#!/bin/bash

function cleanup {
    printf "\nCleaning up."
    /bin/rm -rf content/* 
    /bin/rm -rf public/* 
    /bin/rm -rf static/yeast-component-output 
}

trap cleanup EXIT

cleanup
cp -R content_fresh/* content 

cd yeast_component
cargo run 
cp -R output/* ../static/yeast-component-output
cd .. 
zola serve
