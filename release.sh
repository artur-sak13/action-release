#!/bin/bash
# Actions requires a node_modules dir https://github.com/actions/toolkit/blob/master/docs/javascript-action.md#publish-a-releasesv1-action
# It is recommended not to check these in https://github.com/actions/toolkit/blob/master/docs/action-versioning.md#recommendations

git checkout releases/v1 # If this branch already exists, omit the -b flag
rm -rf node_modules
npm install --production
git add -f node_modules
git commit -m node_modules
git push origin releases/v1

git push origin :refs/tags/v1
git tag -fa v1 -m "Update v1 tag"
git push origin v1
git checkout master
