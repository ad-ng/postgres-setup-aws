# postgres-setup-aws
AWS Postgres 16 setup on ubuntu ec2 instance

### step 1: update and upgrade
after setting up your instance the very first step is to update and upgrade your os 

 ```
    sudo apt update
    sudo apt upgrade -y
   ```

### step 2: install postgres and server

```

    sudo apt install postgresql-16 postgresql-contrib-16 -y

```

and you have to make sure that postgresql service has started successfully by running

```
    sudo systemctl start postgresql
    sudo systemctl enable postgresql

```   

### step 3: Configure PostgreSQL 16
Edit postgresql.conf to allow remote connections by changing listen_addresses to *:

```

    sudo vim /etc/postgresql/16/main/postgresql.conf

```
in your vim editor you can use this command to locate listen easily

```
   /listen

```   

after locating listen you can hit letter i to enter in insert mode and change 

```
    listen_addresses = '*'

```




