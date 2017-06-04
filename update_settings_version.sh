#!/bin/bash

# Add this script to a directory called "build_phases" in the root of your project.

# Add the following line of code in a build phase before the "Copy Bundle Resources"
# build phase:
#   $SRCROOT/build_phases/update_settings_version.sh

# Add the following line to your .gitignore file:
#   [your_project_directory_name]/Settings.bundle/

project_name="Inly"

rm -rfv $SRCROOT/$project_name/Settings.bundle/
cp -r $SRCROOT/build_phases/Settings.bundle/ $SRCROOT/$project_name/Settings.bundle/

version=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$INFOPLIST_FILE")

git=$(sh /etc/profile; which git)
build=$("$git" rev-list HEAD --count)

/usr/libexec/PlistBuddy "$SRCROOT/$project_name/Settings.bundle/Root.plist" -c "set PreferenceSpecifiers:0:DefaultValue $version ($build)"
