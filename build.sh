# !/bin/bash

if [ "$CF_PAGES_BRANCH" == "production" ]; then
  # Run the "production" script in `package.json` on the "production" branch
  # "production" should be replaced with the name of your Production branch

    zola build

elif [ "$CF_PAGES_BRANCH" == "preview" ]; then
  # Run the "staging" script in `package.json` on the "staging" branch
  # "staging" should be replaced with the name of your specific branch

    REPO_URL="https://github.com/Alzymologist/yeast"
    REPO_DIR="/yeast"
    SRC_SUBDIR="/src"
    
    git clone $REPO_URL $DEST_DIR
    cd $DEST_DIR$SRC_SUBDIR
    cargo run --verbose
    zola build
    
# This command clones the repository

fi