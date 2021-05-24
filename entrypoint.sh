#!/bin/sh -l

echo ${GITHUB_REF#refs/heads/}
echo ${GITHUB_SHA::7}
echo ${GITHUB_REF#refs/*/}

echo "##[set-output name=branch;]$(echo ${GITHUB_REF#refs/heads/})"
echo "::set-output name=COMMIT_ID::${GITHUB_SHA::7}"
echo "::set-output name=tag::${GITHUB_REF#refs/*/}"
