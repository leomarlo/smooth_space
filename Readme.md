# Smooth Spaces Website

This repository contains files and scripts for the artistic research project website. The host is set up on a ubuntu machine with an apache webserver installed and php installed as well. Furthermore the stack includes a mysql database, which is accessed through a PDO object. 

# Testing

For testing purposes we have created dockerizations of the stack. 

## Environment Variables

One needs to create a *./.db.env* file in the main directory containing:

```
MYSQL_DATABASE=<<database name>>
MYSQL_ONETIME_PASSWORD=<<empty string is false>>
MYSQL_USER=<<username>>
MYSQL_PASSWORD=<<password>>
```

One also needs to create a *./app/.env* file and copy the same entries:

```
MYSQL_HOST=localhost
MYSQL_USER=<<username>>
MYSQL_PW=<<password>>
MYSQL_DB=<<database name>>
```

## MediaWiki 
### Skins and Gitmodules

The currently used skins are inside a subdirectory `app/w/skins/Tweeki`, which is also a git submodule. To load it, run 
`git submodule update --init --recursive` and then `git submodule update --recursive --merge`.

### LocalSettings

when uploading the files to the MDW-server comment out the name `"dbapp"` and instead write `"localhost"` in the `app/w/LocalSettings.php` script:

```
// $wgDBserver = "dbapp";
$wgDBserver = "localhost";
```

likewise also comment out `$wgServer = "http://localhost:8080"` which is exclusively for local testing.

```
## The protocol and server name to use in fully-qualified URLs
// $wgServer = "http://localhost:8080";
$wgServer = "http://the-smooth.space";
```

Then you push the changes to the remote server using the `sftp` protocol. 

```
$ sftp mdw:/PUBLIC/webserver/www/atlas-of-smooth-spaces
```

or use a client software to do it.

Then change the things back in the LocalSettings.php script, so you can develop locally.

## Database dump

There are some of the recent database dumps in the `db/backup` folder.
You can run the `./initialize-sql.sh` script in the root folder. It will create an initialization sql script when running docker. To make more recent backups, just export the current state of the database into the backup folder. I typically use the `phpmyadmin`, which is incidentally also started with the docker-compose statement. You can find it on `localhost:8081`. If that port is used somehow, you could change the ports in the `docker-compose.yml` file.  


## Docker

We show now how to start the docker containers. Before starting them you need to run the `./initialize-sql.sh` script so that the database is using the most recent version of the databse dumps. Alternatively you could run the `./docker-up.sh` script, which combines the two steps. If you do not have the rights to run `docker compose` you need to `sudo` any of these commands including the following:

```bash
docker-compose up --build -d
```

and docker-compose down after testing is finished
```bash
docker-compose down
```

## User Interface

To connect to the sql database we use the *phpmyadmin* database client. It is exposed on 
```
localhost:8081
```

To see the website go to 
```
localhost:8080
```

## Contact

leonhard.horstmeyer@gmail.com
