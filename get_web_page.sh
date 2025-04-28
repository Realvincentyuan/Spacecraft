#!/bin/bash

# Running this shell script will retrieve the blog content from Ghost and save it to the docs folder

# Define urls and https
from_url=http://localhost:2368
to_url=https://realvincentyuan.github.io/Spacecraft

# Copy blog content
# wget -r -nH -P docs -E -T 2 -np -k ${from_url}/
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent -e robots=off -U mozilla --convert-links --no-cookies ${from_url}/



# Copy 404 page
wget --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links --content-on-error --timestamping ${from_url}/404.html

# Copy sitemaps
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap.xsl
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap.xml
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-pages.xml
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-posts.xml
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-authors.xml
wget --recursive --no-host-directories --directory-prefix=docs --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-tags.xml

# Small fix for images' srcset property
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,srcset="/content,srcset="../content,g' {} +; 
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpegg,jpeg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpegeg,jpeg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpegpeg,jpeg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpgg,jpg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpgpg,jpg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,jpgjpg,jpg,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,pngg,png,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,pngng,png,g' {} +;
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,pngpng,png,g' {} +;

# Replace localhost with real domain
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e "s,http://${from_url},https://${to_url},g" {} +; 
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e "s,${from_url},${to_url},g" {} +
LC_ALL=C find ./docs -type f -not -wholename *.git* -exec sed -i '' -e 's,http://www.gravatar.com,https://www.gravatar.com,g' {} +


# Commit changes
git add --all docs/*
git commit -m 'Update blogs'
git push origin main