### sqlcmd connect
```sh
sqlcmd -S localhost -U SA
```

### sqlcmd connect and execute query
```sh
sqlcmd -S localhost -U SA -Q 'select @@VERSION'
```
