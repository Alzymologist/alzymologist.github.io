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

    REPO_URL="https://github.com/Evgenii-Barannik/yeast-1"
    REPO_DIR="yeast"

    curl https://sh.rustup.rs -sSf | sh -s -- -y # Cargo installation
    source "$HOME/.cargo/env"

    apt install graphviz # Graphviz installation

    mkdir $REPO_DIR
    git clone $REPO_URL $REPO_DIR
    cd $REPO_DIR
    cargo run --verbose
    cat genealogy.dot | dot -Tsvg > ../static/genealogy.svg 
    cd .. # Navigate back 
    cp -R $REPO_DIR/output/* static/ # Copy plots to the static directory
    zola build
fi