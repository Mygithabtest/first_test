#!/bin/bash

# Documentation build script for GitHub Pages
# Usage: ./scripts/build-docs.sh

set -e  # Exit on any error

echo "🚀 Building release documentation..."

# Validate required environment variables
if [[ -z "$VERSION" || -z "$BUILD_NUMBER" || -z "$COMMIT_SHA" || -z "$ACTOR" || -z "$REPOSITORY" || -z "$RUN_ID" ]]; then
    echo "❌ Error: Missing required environment variables"
    echo "Required: VERSION, BUILD_NUMBER, COMMIT_SHA, ACTOR, REPOSITORY, RUN_ID"
    exit 1
fi

# Copy docs folder to _site
echo "📁 Copying documentation templates..."
cp -r docs/ _site/

# Replace placeholders in HTML files with actual values
echo "🔄 Processing template variables..."

echo "  → Replacing {{VERSION}} with $VERSION"
find _site -name "*.html" -type f -exec sed -i "s/{{VERSION}}/$VERSION/g" {} \;

echo "  → Replacing {{BUILD_NUMBER}} with $BUILD_NUMBER"
find _site -name "*.html" -type f -exec sed -i "s/{{BUILD_NUMBER}}/$BUILD_NUMBER/g" {} \;

echo "  → Replacing {{COMMIT_SHA}} with $COMMIT_SHA"
find _site -name "*.html" -type f -exec sed -i "s/{{COMMIT_SHA}}/$COMMIT_SHA/g" {} \;

echo "  → Replacing {{ACTOR}} with $ACTOR"
find _site -name "*.html" -type f -exec sed -i "s/{{ACTOR}}/$ACTOR/g" {} \;

echo "  → Replacing {{REPOSITORY}} with $REPOSITORY"
find _site -name "*.html" -type f -exec sed -i "s|{{REPOSITORY}}|$REPOSITORY|g" {} \;

echo "  → Replacing {{RUN_ID}} with $RUN_ID"
find _site -name "*.html" -type f -exec sed -i "s/{{RUN_ID}}/$RUN_ID/g" {} \;

echo "  → Replacing {{TIMESTAMP}} with current timestamp"
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
find _site -name "*.html" -type f -exec sed -i "s/{{TIMESTAMP}}/$TIMESTAMP/g" {} \;

echo "✅ Documentation prepared for version $VERSION"
echo "📋 Generated files:"
ls -la _site/

echo "🎉 Documentation build completed successfully!"