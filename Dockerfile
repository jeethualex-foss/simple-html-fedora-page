FROM fedora

# Install the application dependencies
RUN yum update -y
RUN yum install httpd httpd-tools -y

# Copy in the source code
RUN mkdir /deployments
COPY src /var/www/html
COPY bin /deployments

WORKDIR /deployments

EXPOSE 80

CMD ["sh","startup.sh"]