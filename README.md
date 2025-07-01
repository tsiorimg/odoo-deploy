# Docker
## Installation
```bash
curl -fsSL https://raw.githubusercontent.com/tsiorimg/odoo-deploy/main/install_docker.sh | sudo bash
```
# Odoo 18 Docker Setup

This repository contains the configuration for running **Odoo 18** with **PostgreSQL 15** using **Docker Compose**.

## 📂 Project Structure

```
.
├── addons/                 # Custom Odoo addons
├── config/
│   ├── odoo.conf           # Odoo configuration file
│   ├── requirements.txt    # Python dependencies
├── .env                    # Environment variables
├── .gitignore              # Ignore files for Git
├── docker-compose.yml      # Docker Compose file
└── README.md               # Documentation
```
---

## 🛠️ Requirements

### **Docker and Docker Compose**
Make sure you have Docker and Docker Compose installed on your system.

- **Docker**: Install from [Docker official site](https://docs.docker.com/get-docker/)
- **Docker Compose**: Install from [Docker Compose official site](https://docs.docker.com/compose/install/)

Check if Docker is installed:
```bash
docker --version
```
Check if Docker Compose is installed:
```bash
docker-compose --version
```
---

## 🚀 How to Use

### 1️⃣ **Setup Environment Variables**
Create a `.env` file in the root directory and add the following:
```ini
POSTGRES_PASSWORD=your_password
```

### 2️⃣ **Run Odoo with Docker Compose**
Start the containers:
```bash
docker-compose up -d 
```

### 3️⃣ **Access Odoo**
- **Web Interface:** [http://localhost:8069](http://localhost:8069)
- **Odoo Login:** Create a new database from the interface.

### 4️⃣ **Stop and Remove Containers**
To stop the services:
```bash
docker-compose down
```

---

## 🛠️ Configuration

### **Odoo Configuration (`config/odoo.conf`)**
```ini
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = yourMasterPassword
db_host = postgres_15
db_port = 5432
db_user = odoo
```

### **Docker Compose Services (`docker-compose.yml`)**
- **Odoo 18** runs on port `8069`.
- **PostgreSQL 15** is used as the database.
- `db_password` is fetched from the `.env` file.

---

## 🔧 Troubleshooting

### **Database Connection Issues**
- Make sure the database container is running:  
  ```bash
  docker ps
  ```
- Check logs for errors:  
  ```bash
  docker-compose logs -f
  ```

---

## 📜 License
This project is open-source and available under the LGPLv3 License.
