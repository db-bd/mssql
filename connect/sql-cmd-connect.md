### sqlcmd connect
```sh
sqlcmd -S localhost -U SA
sqlcmd -S localhost -U SA -PN*****1234
```

### sqlcmd connect and execute query
```sh
sqlcmd -S localhost -U SA -Q 'select @@VERSION'
sqlcmd -S localhost -U SA -Q 'select @@VERSION' -PN*****1234
```
