### MSSQL 2017 Ubuntu 18.04 Dependency
```sh
sudo apt install libjemalloc1
sudo apt install libc++1
sudo apt install libsss-nss-idmap0
sudo apt install gawk
sudo apt install libsasl2-modules-gssapi-mit 
```

### Allow Port 1433 Ubuntu Linux for SQL Server
```sh
sudo ufw enable
sudo ufw allow 1433
```
