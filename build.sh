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
    zola build
    ls
fi