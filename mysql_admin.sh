figlet -c "MySQL / MariaDB Admin Tool" 2> /dev/null
if [[ ! "$?" -eq "0" ]];
then
	echo "Figlet not found. Please install figlet!"
	exit
fi

echo "" > log/mysql_admin.log
source functions/create_db
source functions/create_user
source functions/import_db
source functions/renew_AINC
source functions/delete_db
source functions/delete_user
source functions/export_db
source functions/del_table_content
source functions/query
source functions/renew_pass
source functions/select_sql
source functions/insert_sql

CHARS="/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|"
echo 'Please write MySQL / MariaDB Database Connection Info.'
read -p 'Database Host: ' DB_HOST
read -p 'Database Port: ' DB_PORT
read -p 'Database User: ' DB_USER
read -s -p 'Database Password: ' DB_PASS

#DEBUG MODE
#set -xv
echo ""

	mysql -u $DB_USER -p$DB_PASS -P $DB_PORT -h $DB_HOST -e "exit" 2> /dev/null

if [[ "$?" -eq "0" ]];
then
		for (( i = 1 ; i <= 25 ; i++ ));
		do
		    	echo -en "Checking connection to MySQL / MariaDB... ${CHARS:$i:1} \r"
		    	sleep 0.1
		done
	echo ""
	echo "Connection to $DB_HOST succeeded!"
		for (( i = 1 ; i <= 25 ; i++ ));
		do
		    	echo -en "Opening MySQL / MariaDB Admin Menu... ${CHARS:$i:1} \r"
		    	sleep 0.1
		done
#	while true
#	do
	echo ""
	sleep 1
	clear
	#TITLE
	figlet -c "MySQL / MariaDB Admin Tool"
	#Options
	echo -e "1) Create Database 					7) Delete Database"
	echo -e "2) Create User 						8) Delete User"
	echo -e "3) Import Database					9) Export Database"
	echo -e "4) Renew AUTO_INCREMENTAL				10) Delete table content"
	echo -e "5) SQL INSERT Query 					11) SQL SELECT Query"
	echo -e "6) Create new password for user\t			12) Custom SQL Query"
	echo ""
	echo 'If you choose SQL Query, then all queries will be saved in queries.txt file'
	#USER INPUT
	echo 'If you want to exit, write exit.'
	read -p 'Choose your option: ' OPT
	
	case "$OPT" in

	        1) create_db ;;

	        2) create_user ;;

	        3) import_db ;;

	        4) renew_AINC ;;

			5) insert_sql ;;

			6) renew_pass ;;

			7) delete_db ;;

			8) delete_user ;;

			9) export_db ;;

			10) del_table_content ;;
	        
			11) select_sql ;;

	        12) query ;;

			exit) exit ;;

	        *) echo "Invalid option. " ;;
	
	esac
		sed -i "s/${DB_PASS}/wQGCHUAnydc63pGy2FxANy6JNm4mhNGn/g" log/mysql_admin.log
#	done
else
		for (( i = 1 ; i <= 75 ; i++ ));
		do
		    	echo -en "Checking connection to MySQL / MariaDB... ${CHARS:$i:1} \r"
		    	sleep 0.1
		done
	echo ""
	echo "Connection failed!"
	echo ""
	sleep 0.5
	echo "Here's some troubleshooting tips:"
	echo "1. Check for port. telnet $DB_HOST $DB_PORT"
	echo "2. Add user to % hosts. Connect to your mariadb as root and write: CREATE USER 'someuser'@'%' IDENTIFIED BY 'some_pass'; "
	echo "3. Check for permissions."
	exit
fi