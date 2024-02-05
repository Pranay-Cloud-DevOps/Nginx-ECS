#!/bin/bash

#ghp_WNMii -- Git PAT token
# gh auth login - we could use this to authenticate the user but it has additional prompts to be answered.

apt-get update && apt-get install -y jq git gh #Install necessary libraries on ubuntu machine

# GH_HOST=https://api.github.com/ - add your host here.

GH_PAT=ghp_WNMii # Insert correct PAT token here.

#list all orgs
orgs=$(gh api  /user/memberships/orgs  --jq '.[0].organization.login') || { echo "Error retrieving organizations" >&2; exit 1; }

#list repos from all orgs
for org in $orgs; do
    echo OrgName: $org
    repos=$(gh api orgs/$org/repos --jq '.[].name') || { echo "Error retrieving repo details" >&2; exit 1; }

    echo RepoName: $repos

    for repo in $repos; do
        # open_pr=$(gh pr list --state open) this can be used if running within the github directory.
         openpr=$(gh api /repos/$org/$repo/pulls?state=open | jq '.[] | {number, url}' -r )
        echo $openpr
    done
done
