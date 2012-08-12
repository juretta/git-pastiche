#!/bin/bash

# vim :set ft=sh

set -u

# Show the changes on the remote that would be pulled in.
# The script fetches all the changes first.
#
# If this script is in your $PATH it can be called like this:
#
#   git incoming
#
# The script requires git and ruby to be installed on your system.
#
# Copied from: https://raw.github.com/juretta/bin/master/git-incoming

# Return the name of the current branch
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

function tracking_branch {
  branch_name=$1
  git for-each-ref --format='%(refname:short) %(upstream:short)' refs/heads | grep -e "${branch_name}\$" | awk '{print $2}'
}

# Are we tracking a remote branch?
TRACKING=$(tracking_branch ${CURRENT_BRANCH})

if [ -z "${TRACKING//[[:space:]]/}" ]; then
    echo "The current branch '${CURRENT_BRANCH}' does not track an upstream branch"
    exit -1
fi

# What's the name of the remote?
REMOTE=$(git config branch.${CURRENT_BRANCH}.remote)

# Log options
OPTS="--pretty=oneline --abbrev-commit --decorate"

# URL of the remote we are tracking
REMOTE_URL=$(git config --get remote.${REMOTE}.url)

# Fetch the changes from the remote.
echo "Fetching changes from '"${REMOTE}"' (${REMOTE_URL})"
git fetch -q

# E.g. for 'master':
#  git log master..origin/master
CHANGES=$(env PAGER="" git log --color --exit-code $OPTS ${CURRENT_BRANCH}..${TRACKING})
if [ $? -eq 0 ]; then
    echo "No changes on ${REMOTE} that are not already available on this branch."
else
    echo "Changes on ${REMOTE}:"
    echo "${CHANGES}"
fi

