# Docker Host-Like Environment Command Reference

```bash
###############################################################################
#
# Docker Host-Like Environment Command Reference
# Author: Md Toriqul Islam
# Description: Essential commands for managing the Docker host-like environment
# Note: This is a reference script. Do not execute directly.
#
###############################################################################

#------------------------------------------------------------------------------
# Container Build and Setup
#------------------------------------------------------------------------------

# Build the Docker image
docker build -t my_host_like_env .

# Run the container with port mappings
docker run -d --name my_container \
    -p 80:80 \
    -p 3306:3306 \
    my_host_like_env

#------------------------------------------------------------------------------
# Service Management
#------------------------------------------------------------------------------

# Access container shell
docker exec -it my_container /bin/bash

# Check service status through supervisorctl
docker exec my_container supervisorctl status

# Restart specific services
docker exec my_container supervisorctl restart nginx
docker exec my_container supervisorctl restart mysql

#------------------------------------------------------------------------------
# Monitoring and Logs
#------------------------------------------------------------------------------

# View Nginx logs
docker exec my_container tail -f /var/log/nginx/access.log
docker exec my_container tail -f /var/log/nginx/error.log

# View MySQL logs
docker exec my_container tail -f /var/log/mysql/error.log

# Monitor container resources
docker stats my_container

#------------------------------------------------------------------------------
# Database Management
#------------------------------------------------------------------------------

# Access MySQL CLI
docker exec -it my_container mysql -uroot -p

# Backup database
docker exec my_container mysqldump -u root -p [database_name] > backup.sql

# Restore database
docker exec -i my_container mysql -u root -p [database_name] < backup.sql

#------------------------------------------------------------------------------
# Container Lifecycle
#------------------------------------------------------------------------------

# Stop container
docker stop my_container

# Start container
docker start my_container

# Remove container
docker rm -f my_container

# Clean up unused resources
docker system prune -a

###############################################################################
# End of Command Reference
###############################################################################
```