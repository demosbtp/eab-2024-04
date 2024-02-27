# --------------------------------------------------------------------------------------------
# This file needs to be copied into the BAS folder "projects" and executed from there
# --------------------------------------------------------------------------------------------
# The script will install gh on BAS and authenticate with the user's GitHub account

curl -sS https://webi.sh/gh | sh
source ~/.config/envman/PATH.env
gh auth login -w -p https
