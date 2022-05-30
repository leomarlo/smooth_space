#! /bin/bash

cat db/use-website-database.sql db/backup/atlas-of-smooth-spaces.sql db/create-and-use-wiki-database.sql db/backup/atlas-of-smooth-spaces-wiki.sql > db/init/init.sql
