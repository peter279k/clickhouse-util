# ClickHouse Util

[![test](https://github.com/peter279k/clickhouse-util/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/peter279k/clickhouse-util/actions/workflows/test.yml)

# Introduction

Since clickhouse-client is useful command, but it cannot be convenient for users to run commands.

For instance, creating the database need to run one or more commands and this util can run one command at once.

It also has some features about advanced checking. Such as auth setting file checking and so on.

# Usage

- Install ClickHouse DB on Ubuntu 18.04 and 20.04

```Bash
./installer.sh
```

- Creating database auth file and sample settings are as follows:

```Bash
localadmin@clickhouse01:~/clickhouse-util$ cat auth.txt.example
ip_address=
port_number=
password=
db_name=
localadmin@clickhouse01:~/clickhouse-util$
```

- Create database
  - If auth file is not set, it will use the `./auth.txt` file path by default.

```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./create_database.sh --help
Creating Database is started!
Usage: ./create_database.sh database_name [auth_file_path]
```

- Create table
  - If auth file is not set, it will use the `./auth.txt` file path by default.

```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./create_table.sh --help
Creating table is started...
Usage: ./create_table.sh table_query_file [auth_file_path]
localadmin@clickhouse01:~/clickhouse-util$
```

- Drop database
  - If auth file is not set, it will use the `./auth.txt` file path by default.
```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./drop_database.sh --help
Drop Database is started!
Usage: ./drop_database.sh database_name [auth_file_path]
localadmin@clickhouse01:~/clickhouse-util$
```

- Drop table
  - If auth file is not set, it will use the `./auth.txt` file path by default.
```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./drop_table.sh --help
Dropping table is started...
Usage: ./drop_table.sh table_name [auth_file_path]
localadmin@clickhouse01:~/clickhouse-util$
```

- Import data from specific data format file
  - If auth file is not set, it will use the `./auth.txt` file path by default.
```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./import_data.sh --help
Importing data is started...
Usage: ./import_data.sh table_name data_file data_format [auth_file_path]
localadmin@clickhouse01:~/clickhouse-util$
```

- Export data to specific data format file
  - If auth file is not set, it will use the `./auth.txt` file path by default.
```Bash
localadmin@clickhouse01:~/clickhouse-util$ ./export_data.sh --help
Exporting data is started...
Usage: ./export_data.sh table_name data_format outfile_path [auth_file_path]
localadmin@clickhouse01:~/clickhouse-util$
```

# Development Test

- Ensuring the Docker command is available on targeted test host.
- Running development ClickHouse server with `docker run --name clickhouse -p 9000:9000 -p 8123:8123 -d yandex/clickhouse-server` command where default password is blank.
- Running `cd tests/ && git clone https://github.com/kward/shunit2` command to install shUnit2.
- Running `./run_tests.sh` command to execute some tests.


# Future features

- Using cURL to make HTTP supported
