#!/bin/bash

version=$1
site=$2

if [ "$site" == "" ]; then
	site="yolanda"
fi

echo "Switching $site to $version"

# move controlled wp-content
mv /sites/$site/wp-content /sites/$site/wp-content-real
mv /sites/$site/wpcontent-bu /sites/$site/wp-content

# switch
svn revert -R /sites/$site
svn switch http://core.svn.wordpress.org/$version /sites/$site

# move wp-content back
mv /sites/$site/wp-content /sites/$site/wpcontent-bu
mv /sites/$site/wp-content-real /sites/$site/wp-content
