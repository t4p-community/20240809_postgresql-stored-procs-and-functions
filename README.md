# Learn How to Program Stored Procedures and Functions in PostgreSQL 

Welcome to the Learn How to Program Stored Procedures and Functions in PostgreSQL training event!

## Getting Started

**IMPORTANT:** A PostgreSQL database is required for this training session. Because of the limited time for today's session, we will not cover setting up a PostgreSQL database during the session. So, we have included instructions below for setting up a database on your own following the session.

To code along with the instructor, create a fork of this repository, then create a GitHub Codespace on the fork. The `Fork` button is in the upper-right-hand corner of this page. Once forked, create the green `Code` button on your forked version to access the ability to create a Codespace.

GitHub provides a generous amount of free time for Codespaces each month (currently, 120 hours). You are responsible for any charges incurred if you exceed the free time. You can monitor your usage in the GitHub settings.

**IMPORTANT:** Because of the limited time for the course, if you run into setup problems, it will not be possible to provide individual support. If you have trouble setting up a local environment, we recommend using Codespaces. If you cannot set up a programming environment, please watch the class, and you can code along with the class recording later.

## Run a PostgreSQL Database in Docker

Install Docker Desktop from [Docker Hub](https://www.docker.com/products/docker-desktop).

To run a PostgreSQL database in Docker, use the following command. Replace `YOUR_PASSWORD` with a password of your choice.

```bash
docker run --name postgres -e POSTGRES_PASSWORD=YOUR_PASSWORD -d -p 5432:5432 postgres
```

You can connect to the database using the following command. Replace `YOUR_PASSWORD` with the password you chose. The `-W` flag will prompt you for the password.

```bash
psql -h localhost -U postgres -d postgres -W
```

## Create and Populate the PostgreSQL Database

This repository includes a `dvdrental.tar.zip` file in the `data` folder containing a PostgreSQL database dump. To create the database, you must unzip and restore the file.

To unzip the file, run the following command in a terminal (or use a GUI tool to unzip the file).

```bash
unzip dvdrental.tar.zip
```

Create the database using the following command. Replace `DATABASE_HOST_NAME` with the hostname of your PostgreSQL server.

```bash
createdb -h DATABASE_HOST_NAME -U postgres dvdrental
```

Next, restore the database using the following command. Replace `DATABASE_HOST_NAME` with the hostname of your PostgreSQL server.

```bash
pg_restore -h DATABASE_HOST_NAME -U postgres -d dvdrental ./dvdrental.tar
```

## Get Codespace IP Address for Database Firewall

To connect to the database through the Codespace environment, you will probably need to whitelist the IP address of the Codespace environment. To do this, run the following command in a terminal.

```bash
local_ip=$(curl -s https://api64.ipify.org)
```

Then print the IP address, and register it with the firewall management software of your cloud provider.

```bash
echo $local_ip
```

## Courseware

Code examples are located in the `projects` folder.

Docs:
- [Anatomy of a PostgreSQL Function](./docs/AnatomyOfAPostgreSQLFunction.md)
- [Anatomy of a PostgreSQL Stored Procedure](./docs/AnatomyOfAPostgreSQLStoredProcedure.md)
- [PostgreSQL Functions versus Stored Procedures](./docs/PostgreSQLFunctionsVersusStoredProcs.md)
- [PostgreSQL Functions versus Views](./docs/PostgreSQLFunctionsVersusViews.md)
- [PostgreSQL Query Planner, Functions, and Stored Procedures](./docs/PostgreSQLQueryPlannerAndFunctionsAndStoredProcedures.md)
- [PostgreSQL Functions and Query Planner](./docs/PostgreSQLFunctionsAndQueryPlanner.md)

## License

The programming code authored by the instructor in this repository is made available under the [MIT license](LICENSE).

<br><br>
Course content and teaching is provided by:<br>

[![Training 4 Programmers Logo](https://imagedelivery.net/VKawrzTPdVOU6XYN26Rvmg/1d56b364-4858-4cc6-84d5-89e14ce8e100/public "Training 4 Programmers Logo")](https://www.training4programmers.com)