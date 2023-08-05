# !/bin/bash
REPO_DIR="yeast"

/bin/rm -rf static/data/yeast/* # cleanup folder for yeast data
/bin/rm -rf content/* # cleanup folder for content
cp -R fresh_content/* content # Copy fresh content files
cd $REPO_DIR
cargo run --verbose
cat output/genealogy.dot | dot -Tsvg > output/genealogy.svg 
cp -R output/* ../static/data/yeast # Copy plots to the static directory
cd .. # Navigate back 
zola serve