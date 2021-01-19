#! /bin/sh

VERSION=0.18.2

docker  mage build . -t rascal:$VERSION --memory=4Gb
docker push usethesource/rascal:$VERSION
