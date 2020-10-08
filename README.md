# MySQL Admin Tool

MySQL / MariaDB administration tool to simplify routine job.
# Features
- Create/Drop/Import/Export databases 
- Create/Drop users
- Insert Information into databases
- Create new password for user
- Renew AUTO_INCREMENT columns 
- Delete table content
- Automated SELECT Query
- Use your own SQL Queries

## Installation

### Clone repository
```
git clone https://github.com/KostLinux/MySQL-Admin/
```
### Start the configuration script
```
bash configure.sh
```
**NB!** If you want to use insert tool, you need to insert information to 
- mysql/columns/column_names.txt 
- mysql/columns/column_values.txt 

**AUTO_INCREMENT VALUES ARE NOT NEEDED!** 

**If you inserted password, then use chmod 600 to these files.**

EXAMPLE:
```
# vim mysql/columns/column_names.txt

username
password
email
phone

# vim mysql/columns/column_values.txt

testing
testing_pass
testing_mail
53932422

# chmod 600 mysql/columns/column_{names,values}.txt
```

### Start MySQL Admin Tool
```
mysql-admin
```

# Author
* **Christofher** - *Initial work* - [KostLinux](https://github.com/KostLinux)

# License
This repository is licensed under the MIT License- see the [LICENSE](LICENSE.md) file for details.
