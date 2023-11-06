# Set up a PostgreSQL Docker container
postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

# Create a new database in the PostgreSQL container
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

# Drop (delete) the database from the PostgreSQL container
dropdb:
	docker exec -it postgres12 dropdb simple_bank

# Apply database migrations using the 'migrate' tool
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

# Rollback the last applied database migration
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

# Generate Go code for interacting with the PostgreSQL database using 'sqlc'
sqlc:
	sqlc generate 

test:
	go test -v -cover -short ./...
	
# Define the '.PHONY' targets to indicate that these are not file-based targets
.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
