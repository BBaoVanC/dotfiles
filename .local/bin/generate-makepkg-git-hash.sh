#!/bin/sh -x

git -c core.abbrev=no archive --format tar HEAD | $1sum
