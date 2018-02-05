### sqlcmd connect
```sh
sqlcmd -S localhost -U SA
sqlcmd -S localhost -U SA -PN*****1234
sqlcmd -S localhost -U SA -Pn****s
```
### sqlcmd connect and execute query
```sh
sqlcmd -S localhost -U SA -Q 'select @@VERSION'
sqlcmd -S localhost -U SA -Q 'select @@VERSION' -PN*****1234
sqlcmd -S localhost -U SA -Q 'select @@VERSION' -Pn****s
```
### osql connect and execute query
```sh
osql -S sqlservername -E
osql -S localhost -E
```
