# Working with Databases

## 1. Running Multiple Containers in a Single Image

You can run multiple containers within a single image. To get started, pull the PostgreSQL 12 image from Docker Hub:

```sh
docker pull postgres:12-alpine
```

Then, run the container:

```sh
docker exec -it <container_name> /bin/sh
```


## 2. Managing Your Database with PostgreSQL
Schema migration is an essential task that often needs to be performed throughout the application's lifetime 
to adapt to new business requirements.

For efficient schema migration, you can use the golang-migrate tool.
Link provided: https://github.com/golang-migrate/migrate


## 3. Performing CRUD Operations in Golang

In your application, you'll need to implement CRUD operations:

- Create (C): Insert new records into the database.
- Read (R): Select or search for records in the database.
- Update (U): Modify specific fields of a record in the database.
- Delete (D): Remove records from the database.

While GORM is a popular high-level object-relational mapping library for Golang, it may run slowly under heavy loads. For better performance, consider using SQLC, which offers automatic code generation and full support for PostgreSQL. 

You can generate code using the syntax: sqlc generate.

## 4. Implement database transaction in golang

Database transactions are crucial for maintaining data integrity and consistency, even in the event of system failures. 
Transactions provide isolation for concurrent database access. The ACID properties define the reliability of transactions:

- Atomicity (A): Either all operations complete successfully or the transaction fails, leaving the database unchanged.
- Consistency (C): The database remains valid after the transaction, adhering to all constraints.
- Isolation (I): Concurrent transactions must not interfere with each other.
- Durability (D): Data written by a successful transaction must be stored in persistent storage.
Deadlocks in a database occur when multiple transactions are stuck, waiting for each other to release resources. 
To prevent deadlocks, it's best to acquire locks in a consistent order. In your application, consider updating accounts with lower IDs first. 
Test your transactions by running them concurrently, taking advantage of Go's goroutines and channels for achieving concurrency.
There are four standard isolation levels that you can research further to suit your specific needs.

## 5. Setup github Actions for Golang + Postgres to run automated tests

To automate testing in your project, set up GitHub Actions:

- Define a workflow, which is an automated procedure consisting of one or more jobs.
- Trigger the workflow based on events, schedules, or manual execution.
- Add a .yml file to your repository to define the workflow.

Within this workflow:

- Use a runner, which is a server responsible for executing jobs. You can opt for GitHub-hosted runners or self-hosted runners, which report progress, logs, and results to GitHub.
- Create jobs that run in parallel or serially, depending on your requirements.
- Specify steps to be executed within a job, running serially.
- Utilize actions, which are standalone commands that run within steps to perform specific tasks.




