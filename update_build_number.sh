#!/bin/bash

# Add this script to a directory called "build_phases" in the root of your project.

# Add the following line of code in a build phase at the end of your build phases:
#   $SRCROOT/build_phases/update_build_number.sh

# It might be helpful to your team to replace the build number in the Info.plist file with
# a note, such as "build number set from script."

git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)

target_plist="$TARGET_BUILD_DIR/$INFOPLIST_PATH"
dsym_plist="$DWARF_DSYM_FOLDER_PATH/$DWARF_DSYM_FILE_NAME/Contents/Info.plist"

for plist in "$target_plist" "$dsym_plist"; do
    if [ -f "$plist" ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
    fi
done
