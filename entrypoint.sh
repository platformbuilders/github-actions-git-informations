#!/bin/sh -l

echo ${GITHUB_REF#refs/heads/}
echo ${GITHUB_SHA::7}
echo ${GITHUB_REF#refs/*/}

REF=${GITHUB_REF#refs/heads/}
COMMIT_ID=${GITHUB_SHA::7}

if [[ "$REF" == "develop" ]]; then
    printf "Branch name: $REF \nCommit ID: $COMMIT_ID"
    echo "RELEASE_VERSION=$COMMIT_ID" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=develop" >> $GITHUB_ENV

elif [[ $REF == *"tags"* ]]; then
    printf "New tag: tag::${GITHUB_REF#refs/*/}"
    echo "RELEASE_VERSION=tag::${GITHUB_REF#refs/*/}" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=release" >> $GITHUB_ENV
fi
