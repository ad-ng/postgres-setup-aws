#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install PostgreSQL 16 and related packages
echo "Installing PostgreSQL 16 and contrib packages..."
sudo apt install postgresql-16 postgresql-contrib-16 -y

# Start and enable PostgreSQL service
echo "Starting and enabling PostgreSQL service..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Configure PostgreSQL to allow remote connections
echo "Configuring PostgreSQL to allow remote connections..."
sudo sed -i "s/listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/16/main/postgresql.conf

# Enable pgAdmin connections (optional step)
echo "Enabling pgAdmin connections..."
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf

# Restart PostgreSQL service
echo "Restarting PostgreSQL service..."
sudo systemctl restart postgresql

# Set the password for the postgres system user to 'admin123'
echo "Setting password for the 'postgres' system user to 'admin123'..."
echo "postgres:admin123" | sudo chpasswd

# Set the password for the postgres database user to 'admin123'
echo "Setting password for the 'postgres' database user to 'admin123'..."
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'admin123';"

echo "PostgreSQL setup is complete!"
