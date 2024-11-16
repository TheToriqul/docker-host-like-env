# 🐳 Docker Host-Like Environment

[![GitHub](https://img.shields.io/badge/GitHub-Docker_Host_Like_Env-blue?style=flat&logo=github)](https://github.com/TheToriqul/docker-host-like-env)
[![GitHub stars](https://img.shields.io/github/stars/TheToriqul/docker-host-like-env?style=social)](https://github.com/TheToriqul/docker-host-like-env/stargazers)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=flat&logo=nginx&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=flat&logo=mysql&logoColor=white)

## 📋 Overview

This project demonstrates my journey in creating a sophisticated Docker container environment that mimics a traditional host setup. Through this implementation, I've developed a deep understanding of containerization principles and multi-service orchestration using Docker. The environment runs multiple services (Nginx, MySQL) managed by Supervisord, showcasing practical containerization skills in a real-world scenario.

## 🏗 Technical Architecture

The project implements a layered architecture where multiple services coexist within a single container, managed by Supervisord as the process manager.

```mermaid
graph TD
    A[Docker Container] --> B[Supervisord]
    B --> C[Nginx Web Server]
    B --> D[MySQL Database]
    C --> E[Port 80]
    D --> F[Port 3306]
    
    style A fill:#1a73e8,stroke:#0d47a1,stroke-width:2px,color:white
    style B fill:#4caf50,stroke:#2e7d32,stroke-width:2px,color:white
    style C fill:#00acc1,stroke:#006064,stroke-width:2px,color:white
    style D fill:#fb8c00,stroke:#ef6c00,stroke-width:2px,color:white
    style E fill:#78909c,stroke:#546e7a,stroke-width:2px,color:white
    style F fill:#78909c,stroke:#546e7a,stroke-width:2px,color:white
```

## 💻 Technical Stack

- **Base System**: Ubuntu Latest
- **Process Manager**: Supervisord
- **Web Server**: Nginx
- **Database**: MySQL Server
- **Container Runtime**: Docker

## ⭐ Key Features

1. Multi-Service Container Management
   - Supervisord process orchestration
   - Automated service recovery
   - Unified logging system

2. Web Server Configuration
   - Nginx server setup
   - Static content serving
   - Custom configuration capability

3. Database Implementation
   - MySQL server integration
   - Persistent storage support
   - Secure default configuration

4. Process Management
   - Service health monitoring
   - Automatic restart capabilities
   - Process isolation

5. Networking
   - Port mapping and exposure
   - Inter-service communication
   - Network isolation

6. Logging and Monitoring
   - Centralized logging
   - Service status monitoring
   - Debug capabilities

## 📚 Learning Journey

### Technical Mastery:

1. Docker container lifecycle management
2. Multi-process containerization patterns
3. Service orchestration with Supervisord
4. Container networking principles
5. Docker image optimization techniques

### Professional Development:

1. System architecture design
2. Service reliability engineering
3. Documentation best practices
4. Problem-solving methodology
5. Infrastructure as Code principles

## 🔄 Future Enhancements

<details>
<summary>View Planned Improvements</summary>

1. Implement container health checks
2. Add Redis caching layer
3. Enhance logging with ELK stack
4. Implement automated backups
5. Add monitoring with Prometheus
6. Develop CI/CD pipeline integration
</details>

## ⚙️ Installation

<details>
<summary>View Installation Details</summary>

### Prerequisites

- Docker Engine installed
- Git for repository cloning
- 4GB RAM minimum
- 10GB free disk space

### Setup Steps

1. Clone the repository:
```bash
git clone https://github.com/TheToriqul/docker-host-like-env.git
cd docker-host-like-env
```

2. Build the Docker image:
```bash
docker build -t my_host_like_env .
```

3. Run the container:
```bash
docker run -d --name my_container -p 80:80 -p 3306:3306 my_host_like_env
```

### Configuration

```env
MYSQL_ROOT_PASSWORD=your_secure_password
NGINX_PORT=80
MYSQL_PORT=3306
```

</details>

## 📫 Contact

- 📧 Email: toriqul.int@gmail.com
- 📱 Phone: +65 8936 7705, +8801765 939006

## 🔗 Project Links

- [GitHub Repository](https://github.com/TheToriqul/docker-host-like-env)
- [Documentation](https://github.com/TheToriqul/docker-host-like-env/wiki)

## 👏 Acknowledgments

- [Poridhi for excellent labs](https://poridhi.io/)
- Docker community for extensive documentation
- Open source contributors for inspiration

---

Feel free to explore, modify, and build upon this configuration as part of my learning journey. You're also welcome to learn from it, and I wish you the best of luck!