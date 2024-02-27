# --------------------------------------------------------------------------------------------
# This file needs to be copied into the BAS folder "projects" and executed from there
# --------------------------------------------------------------------------------------------
# The script will remove the old code from the eab-2024-04 repo and copy the new code 
# from the project $1 (the first argument) to the eab-2024-04 repo
echo "# --------------------------------------------------------"
echo "# Delete existing repo"
echo "# --------------------------------------------------------"
rm -rf eab-2024-04
echo "- deleted existing repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Clone repo https://github.com/demosbtp/eab-2024-04.git"
echo "# --------------------------------------------------------"
git clone https://github.com/demosbtp/eab-2024-04.git
echo "- cloned repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Cleaning up eab-2024-04 repo"
echo "# --------------------------------------------------------"
rm -rf eab-2024-04/src/*
mkdir -p eab-2024-04/src/app
mkdir -p eab-2024-04/src/db
mkdir -p eab-2024-04/src/srv
echo "- deleted previous code"
echo ""
echo "# --------------------------------------------------------"
echo "# Copying code from project $1 to eab-2024-04 repo"
echo "# --------------------------------------------------------"
cp -rf $1/app        eab-2024-04/src
cp -rf $1/db         eab-2024-04/src
cp -rf $1/srv        eab-2024-04/src
cp -f  $1/*.json     eab-2024-04/src
cp -f  $1/.eslintrc  eab-2024-04/src
cp -f  $1/.gitignore eab-2024-04/src
echo "- copied code from project $1 to eab-2024-04 repo"
echo ""
echo "# --------------------------------------------------------"
echo "# Checkout code and create a PR for the changes"
echo "# --------------------------------------------------------"
cd eab-2024-04
git checkout -b eab-demo2024-04
git add .
git commit -m "feat: add CAP app by Joule" 
git push -u origin eab-demo2024-04
gh pr create -B main -f -l enhancement