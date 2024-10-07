#!/bin/bash
set -e

echo "Starting custom-format dump restoration..."

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

# Restore the database
pg_restore --no-owner --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" /docker-entrypoint-initdb.d/employees.dump

echo "Database restoration complete."

