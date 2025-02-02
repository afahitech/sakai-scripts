#! /bin/bash
if [ "$BASH" = "" ] ;then echo "Please run with bash"; exit 1; fi

# If you want to change this file (and you should)
# Simply copy it to config.sh and make your changes
# there so git ignores your local copy.

# Check to see if we are overriden - but only do it once
if [ -f "config.sh" -a "$1" == "" ]
then
    echo "Taking configuration from local config.sh"
    source config.sh include
    return
    exit
elif [ "$1" == "" ]
then
    echo 
    echo "Using setup defaults from config-dist.php."
    echo "If you want to override configuration settings, copy"
    echo "config-dist.sh to config.sh and edit config.sh"
    echo
fi

# Settings start here
# Change GIT_REPO and replace "sakaiproject" with your git user name
# so that you checkout your forked sakai repository
GIT_REPO=https://github.com/sakaiproject/sakai.git

# Set this to the MYSQL root passsword.  MAMP's default
# is root so you can leave it alone if you are using MAMP
MYSQL_ROOT_PASSWORD=root

MYSQL=5.1.35
TOMCAT=9.0.21
THREADS=1

# Leave LOG_DIRECTORY value empty to leave the logs inside tomcat
# LOG_DIRECTORY=/var/www/html/sakai/logs/tomcat
LOG_DIRECTORY=
PORT=8080
SHUTDOWN_PORT=8005
MYSQL_DATABASE=sakai21
MYSQL_USER=sakaiuser
MYSQL_PASSWORD=sakaipass

# Defaults for Mac/MAMP MySQL
if [ -f "/Applications/MAMP/Library/bin/mysql" ] ; then
    MYSQL_SOURCE="jdbc:mariadb://127.0.0.1:8889/$MYSQL_DATABASE?useUnicode=true\&characterEncoding=UTF-8"
    MYSQL_COMMAND="/Applications/MAMP/Library/bin/mysql -S /Applications/MAMP/tmp/mysql/mysql.sock -u root --password=$MYSQL_ROOT_PASSWORD"

# Ubuntu / normal 3306 MariaDB 
else
    MYSQL_COMMAND="mysql -u root"
    MYSQL_SOURCE="jdbc:mariadb://127.0.0.1:3306/$MYSQL_DATABASE?useUnicode=true\&characterEncoding=UTF-8"
fi
