set -e

VERSION=$(cat version | awk '{$1=$1;print}')
echo "publish version ${VERSION}"

sudo npm install -g @abtnode/cli

echo "publishing to staging blocklet registry"
npm run bundle
blocklet config registry ${STAGING_REGISTRY}
blocklet publish --developer-sk ${ABTNODE_DEV_STAGING_SK}

make release

