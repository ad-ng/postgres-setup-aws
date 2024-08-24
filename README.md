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
sudo vi /etc/postgresql/16/main/postgresql.conf
```
in your vim editor you can use this command to locate listen easily type:

```
/listen
```   

after locating listen you can hit letter i to enter in insert mode and change and uncomment 


```
listen_addresses = '*'
```

### step 4: enabling pg admin connection
this step is optional but very crucial in case you would like to connect you postgres db to pg admin which enables you to interact with your db using GUI

```
sudo vi /etc/postgresql/16/main/pg_hba.conf
```

move all the way down and insert 

```
host    all             all             0.0.0.0/0               md5
```

Allow PostgreSQL port through the firewall:

```
sudo ufw allow 5432/tcp
```

then after this you can restart your postgres services by running

```
sudo systemctl restart postgresql
```   

### step 5: change password for postgres user
when you install a postgres database it automatically creates the postgres user, who is the one to manage it by default so to be able to switch to that user you need a password

``` 
sudo passwd postgres
```   

# step 6: change the password for your database
in the previous step we changed password for user called postgres "a user in ubuntu os"

but here we going to change password for a user called postgres inside our database 
postgres is default user but you can change it of you want

we first have to switch to that user

```
su - postgres
```

then run

```
sudo -u postgres psql
```

to change password 

```
ALTER USER postgres PASSWORD 'passwordYouWant';
```

then exit 

```
\q
```


# NOW you have a your db set you can access it any where you want as long as your security group is accepting traffic from that source



