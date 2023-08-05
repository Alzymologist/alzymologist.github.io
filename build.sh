# !/bin/bash

if [ "$CF_PAGES_BRANCH" == "main" ]; then
  # Run the "production" script in `package.json` on the "production" branch
  # "production" should be replaced with the name of your Production branch

    echo "Building from main 🔥"
    zola build

elif [ "$CF_PAGES_BRANCH" == "dev-main" ]; then
  # Run the "staging" script in `package.json` on the "staging" branch
  # "staging" should be replaced with the name of your specific branch

    echo "Building from dev-main 🔥"
    zola build

elif [ "$CF_PAGES_BRANCH" == "feature-main" ]; then
  # Run the "staging" script in `package.json` on the "staging" branch
  # "staging" should be replaced with the name of your specific branch

    echo "Building from feature-main 🔥"

    curl https://sh.rustup.rs -sSf | sh -s -- -y # Cargo installation
    source "$HOME/.cargo/env"
    apt install graphviz # Graphviz installation
    
    REPO_DIR="yeast"
    REPO_URL="https://github.com/Alzymologist/yeast"
    REPO_BRANCH="feature-2"

    mkdir content
    cp -R fresh_content/* content # Copy fresh content files
    mkdir $REPO_DIR
    git clone --branch $REPO_BRANCH $REPO_URL $REPO_DIR
    cd $REPO_DIR
    cargo run --verbose
    cat output/genealogy.dot | dot -Tsvg > output/genealogy.svg 
    cp -R output/* ../static/data/yeast # Copy plots to the static directory
    cd .. # Navigate back 
    zola build
fi
