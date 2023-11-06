package db

import (
	"database/sql"
)

// Store provide all functions to execute db queries and transaction
type Store struct{
	*Queries
	db *sql.DB
}

// newStore creates a new Store
func NewStore (db *sql.DB) *Store{
	return &Store{
		db: db,
		Queries: New(db),
	}
}
