#!/bin/sh

schema="ez"
user="admin"
pass="publish"
host="localhost"

db="mysql"
out="output"
driver="lib/mysql-connector-java-5.1.13-bin.jar"
sp="lib/schemaSpy_5.0.0.jar"
meta="ez_dbmeta.xml"
fkgen="sql/fkeys_generated.sql"
fkman="sql/fkeys_manual.sql"
java=`which java`
mysql=""
sspy=""

sqlsetup()
{
mysql="mysql -p$pass -u $user --host=$host $schema"
}

cleanup()
{
sqlsetup
echo "Removing all foreign keys from db"

fksQueryResult=`echo \
"SELECT TABLE_NAME, CONSTRAINT_NAME" \
"FROM information_schema.TABLE_CONSTRAINTS" \
"WHERE CONSTRAINT_TYPE='FOREIGN KEY' AND TABLE_SCHEMA='$schema';"\
| $mysql`
declare -a fks
fks=($fksQueryResult)

for((i=2;i<${#fks[@]};i+=2)); do
  iinc=i+1
  tableName=${fks[$i]}
  keyName=${fks[$iinc]}
  echo "    Dropping $tableName: $keyName"
  echo "ALTER TABLE $tableName"\
       "DROP FOREIGN KEY $keyName;"\
    | $mysql 
done
}


addkeys()
{
sqlsetup
echo "Adding foreign keys from $fkgen"
$mysql < $fkgen
if [ $? -ne 0 ] ; then exit 1 ; fi

echo "Adding foreign keys from $fkman"
$mysql < $fkman
if [ $? -ne 0 ] ; then exit 1 ; fi
}


diagrams()
{
sqlsetup
echo "Running $sp"  
$java -jar $sp -host $host -t $db -db $schema -u $user -p $pass -o $out -dp $driver -meta $meta -hq -noads -norows $sspy
if [ $? -ne 0 ] ; then exit 1 ; fi
}


usage()
{
cat << EOF
usage: $0 options

Manage foreign keys and create diagrams with schemaSpy
Note that options depends on order, so for example
   -x: before -d
   -n: before -c 

OPTIONS:
   -h      Show this message
   -u      Override default user name ($user)
   -p      Override default password ($pass)
   -s      Override default hostname ($host)
   -n      Override default database name/schema ($schema)
   -x      Additional options to schemaSpy in quoted string
   -r      Removes all foreign keys from db
   -c      Creates foreign keys to db
   -d      Create diagrams with schemaSpy
   -a      Run all: rcd

EOF
}


while getopts "hu:p:s:n:x:rcda" OPTION
do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        u)
            user=$OPTARG
            ;;
        p)
            pass=$OPTARG
            ;;
        s)
            host=$OPTARG
            ;;
        n)
            schema=$OPTARG
            ;;
        x)
            sspy=$OPTARG
            ;;
        r)
            cleanup
            ;;
        c)
            addkeys
            ;;
        d)
            diagrams
            ;;
        a)
            cleanup
            addkeys
            diagrams
            ;;
        ?)
            usage
            exit
            ;;
    esac
done
