FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD password


# Derived from official mysql image (our base image)
FROM mysql
# Add a database
ENV MYSQL_DATABASE test-db
ENV MYSQL_USER=dbuser
ENV MYSQL_PASSWORD=dbpassword

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
EXPOSE 3306
CMD echo "This is a test." | wc -
CMD ["mysqld"]
