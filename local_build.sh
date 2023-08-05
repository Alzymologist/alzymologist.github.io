# !/bin/bash
REPO_DIR="yeast"

cd $REPO_DIR
cargo run --verbose
cat output/genealogy.dot | dot -Tsvg > output/genealogy.svg 
cp -R output/* ../static/data/yeast # Copy plots to the static directory
cd .. # Navigate back 
zola serve