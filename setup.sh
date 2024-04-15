#!/bin/bash
ORIGINAL_URL="git@github.com:elft-net/lfs528-cka.git"
NEW_URL=$(git remote get-url origin)
# NOTE: sed -i '' is required on MacOS but breaks on Linux, on Linux use -i'' without space instead DONE
# NOTE: The Repo wasn't cloned using HTTPS but used ssh instead which might cause issues
grep -rl $ORIGINAL_URL | grep -v README.md | xargs sed -i'' "s|$ORIGINAL_URL|$NEW_URL|g"
git add .
git commit -m "Switch repository to $NEW_URL"
git push
