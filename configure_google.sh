#!/bin/bash

mkdir -p $SRCROOT/BlazinRewards/container/
rm -vf $SRCROOT/BlazinRewards/container/* $SRCROOT/BlazinRewards/GoogleService-Info.plist
cp $SRCROOT/google_configurations/$1/GTM*.json $SRCROOT/BlazinRewards/container/
cp $SRCROOT/google_configurations/$1/GoogleService-Info.plist $SRCROOT/BlazinRewards/
