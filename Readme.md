# Smooth Spaces Website

This reposity contains files and scripts for the artistic research project website. The host is set up on a ubuntu machine with an apache webserver installed and php installed as well. Furthermore the stack includes a mysql database, which is accessed through a PDO object. 

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


## Database dump

You have to copy the database dump into the main directory and import it from the *phpmyadmin* service. 


## Docker

Then docker-compose up the services:

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
