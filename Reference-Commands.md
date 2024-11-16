# Docker Host-Like Environment Command Reference Guide

- [Image Building and Management](#image-building-and-management)
- [Container Creation and Runtime](#container-creation-and-runtime)
- [Service Management and Process Control](#service-management-and-process-control)
- [Networking and Port Management](#networking-and-port-management)
- [Logging and Monitoring](#logging-and-monitoring)
- [Database Operations](#database-operations)
- [Container Maintenance and Cleanup](#container-maintenance-and-cleanup)
- [Debugging and Troubleshooting](#debugging-and-troubleshooting)
- [Security and Access Control](#security-and-access-control)
- [Performance Optimization](#performance-optimization)

> **Author**: Md Toriqul Islam  
> **Description**: Comprehensive command reference for Docker host-like environment  
> **Learning Focus**: Container lifecycle, service management, and monitoring  
> **Note**: This is a reference guide. Do not execute commands directly without understanding their implications.

## Image Building and Management

### Basic Build Commands
```bash
# Build image with no cache (useful for fresh builds during development)
docker build --no-cache -t my_host_like_env .

# Build image with specific platform support
docker build --platform linux/amd64 -t my_host_like_env .
```

### Advanced Build Options
```bash
# Build with build arguments
docker build \
    --build-arg MYSQL_VERSION=8.0 \
    --build-arg NGINX_VERSION=1.20 \
    -t my_host_like_env .

# Tag image for version control
docker tag my_host_like_env my_host_like_env:v1.0
docker tag my_host_like_env my_host_like_env:latest
```

## Container Creation and Runtime

### Basic Container Creation
```bash
# Basic container run with essential mappings
docker run -d --name my_container \
    -p 80:80 \
    -p 3306:3306 \
    my_host_like_env
```

### Advanced Container Configuration
```bash
# Advanced container run with resource limits and volumes
docker run -d --name my_container \
    -p 80:80 \
    -p 3306:3306 \
    --memory="2g" \
    --cpus="2" \
    -v mysql_data:/var/lib/mysql \
    -v nginx_config:/etc/nginx/conf.d \
    --restart unless-stopped \
    my_host_like_env

# Run with environment variables
docker run -d --name my_container \
    -e MYSQL_ROOT_PASSWORD=secure_password \
    -e NGINX_WORKER_PROCESSES=auto \
    my_host_like_env
```

## Service Management and Process Control

### Supervisord Management
```bash
# Service status and control
docker exec my_container supervisorctl status
docker exec my_container supervisorctl stop all
docker exec my_container supervisorctl start all
docker exec my_container supervisorctl restart all

# Individual service management
docker exec my_container supervisorctl stop nginx
docker exec my_container supervisorctl start nginx
docker exec my_container supervisorctl restart mysql
```

### Process Inspection
```bash
docker exec my_container ps aux
docker exec my_container top
docker exec my_container pstree
```

## Networking and Port Management

### Network Operations
```bash
# Network creation and inspection
docker network create my_network
docker network inspect my_network
docker network ls

# Container network management
docker network connect my_network my_container
docker network disconnect my_network my_container
```

### Port Management
```bash
# Port mapping inspection
docker port my_container
docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' my_container
```

## Logging and Monitoring

### Container Logs
```bash
# View container logs
docker logs my_container
docker logs -f my_container
docker logs --since 5m my_container
docker logs --tail 100 my_container
```

### Service-Specific Logs
```bash
# Access service logs
docker exec my_container tail -f /var/log/nginx/access.log
docker exec my_container tail -f /var/log/nginx/error.log
docker exec my_container tail -f /var/log/mysql/error.log
```

### Resource Monitoring
```bash
# Monitor container resources
docker stats my_container
docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"
```

## Database Operations

### MySQL Access and Management
```bash
# MySQL CLI access
docker exec -it my_container mysql -uroot -p

# Full backup
docker exec my_container mysqldump -u root -p --all-databases > full_backup.sql

# Single database backup with options
docker exec my_container mysqldump -u root -p \
    --single-transaction \
    --quick \
    --lock-tables=false \
    [database_name] > database_backup.sql
```

### Database Restore Operations
```bash
# Restore full backup
docker exec -i my_container mysql -u root -p < full_backup.sql

# Restore single database
docker exec -i my_container mysql -u root -p [database_name] < database_backup.sql
```

## Container Maintenance and Cleanup

### Container Lifecycle
```bash
# Basic lifecycle commands
docker stop my_container
docker start my_container
docker restart my_container
docker rm -f my_container
```

### Resource Cleanup
```bash
# Remove stopped containers
docker container prune

# Remove unused images
docker image prune -a

# Remove unused volumes
docker volume prune

# Remove all unused resources
docker system prune -a --volumes
```

## Debugging and Troubleshooting

### Container Inspection
```bash
# Inspect container details
docker inspect my_container
docker inspect -f '{{.State.Status}}' my_container
docker inspect -f '{{.NetworkSettings.IPAddress}}' my_container

# Process investigation
docker top my_container
docker exec my_container ps aux
docker exec my_container netstat -tulpn
```

### Container Access
```bash
# Shell access
docker exec -it my_container /bin/bash
docker exec -it my_container /bin/sh
```

## Security and Access Control

### User Management
```bash
# User operations
docker exec -it my_container useradd -m newuser
docker exec -it my_container passwd newuser

# File permissions
docker exec my_container chown -R www-data:www-data /var/www/html
docker exec my_container chmod -R 755 /var/www/html
```

### Service Security
```bash
# Security checks
docker exec my_container nginx -t
docker exec my_container mysql_secure_installation
```

## Performance Optimization

### Cache and Resource Management
```bash
# Cache management
docker exec my_container sync; echo 3 > /proc/sys/vm/drop_caches

# Service optimization
docker exec my_container nginx -s reload
docker exec my_container mysqladmin flush-hosts

# Resource limits adjustment
docker update --memory="4g" --cpus="4" my_container
```

## Learning Notes

1. Always use resource limits in production environments
2. Implement proper logging and monitoring strategies
3. Regular backup scheduling is crucial
4. Understand networking implications
5. Security should be a primary concern
6. Performance optimization is an ongoing process

---

> 💡 **Best Practice**: Always test commands in a development environment before applying them to production systems.

> ⚠️ **Warning**: Some commands may require root/sudo privileges. Use with caution.

> 📝 **Note**: Commands may need to be adjusted based on your specific environment and requirements.