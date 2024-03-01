# --------------------------------------------------------------------------------------------
# This file needs to be copied into the BAS folder "projects" and executed from there
# --------------------------------------------------------------------------------------------
# The script will remove the old code from the eab-2024-04 repo and copy the new code 
# from the project $1 (the first argument) to the eab-2024-04 repo

# Script should 
if [ -z "$1" ]; then
  echo "Please provied the folder name for the app as a parameter! Exiting."
  exit 1
fi

BRANCHNAME=gen-joule-app
FOLDER_REPO=eab-2024-04
echo "# --------------------------------------------------------"
echo "# Delete existing repo"
echo "# --------------------------------------------------------"
rm -rf ${FOLDER_REPO}
echo "- deleted existing repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Clone repo https://github.com/demosbtp/eab-2024-04.git"
echo "# --------------------------------------------------------"
git clone https://github.com/demosbtp/eab-2024-04.git
echo "- cloned repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Copying the mtar from project $1 to ${FOLDER_REPO} repo"
echo "# --------------------------------------------------------"
rm -rf ${FOLDER_REPO}/src
mkdir -p ${FOLDER_REPO}/src
cp -rf $1/mta_archives/${1}_1.0.0.mtar  ${FOLDER_REPO}/src/app.mtar
echo "- copied mtar from project $1 to ${FOLDER_REPO} repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Create new branch ${BRANCHNAME}, commit and push the new code"
echo "# --------------------------------------------------------"
cd ${FOLDER_REPO}
git checkout -b $BRANCHNAME
git add .
git commit -m "feat: add CAP app by Joule" 
git push -u origin $BRANCHNAME
echo "- commited and pushed code to ${BRANCHNAME}"
echo "# --------------------------------------------------------"
echo "# Create pull request"
echo "# --------------------------------------------------------"
gh pr create -B main -f -l enhancement
cd ..
rm -rf ${FOLDER_REPO}
