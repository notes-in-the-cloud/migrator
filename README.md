# Database Migrator

This project uses [golang-migrate](https://github.com/golang-migrate/migrate) to manage database migrations.

## Prerequisites

You need the `migrate` CLI tool installed locally to create and manage migrations.

### Installation

**macOS (Homebrew):**
```bash
brew install golang-migrate
```

**Windows (Scoop):**
```bash
scoop install migrate
```

**Windows (Chocolatey):**
```bash
choco install golang-migrate
```

**Linux (curl):**
```bash
curl -L https://github.com/golang-migrate/migrate/releases/download/v4.17.1/migrate.linux-amd64.tar.gz | tar xvz
sudo mv migrate /usr/local/bin/migrate
```

**Go install:**
```bash
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

## Creating Migrations

Use the Makefile to create new migrations:

```bash
make create-migration name=<migration_name>
```

**Example:**
```bash
make create-migration name=create_users_table
```

This creates two files in the `migrations/` directory:
- `<timestamp>_create_users_table.up.sql` - Applied when migrating up
- `<timestamp>_create_users_table.down.sql` - Applied when migrating down (rollback)

## Running Migrations

**Apply all pending migrations:**
```bash
migrate -path ./migrations -database "postgres://user:password@localhost:5432/dbname?sslmode=disable" up
```

**Rollback the last migration:**
```bash
migrate -path ./migrations -database "postgres://user:password@localhost:5432/dbname?sslmode=disable" down 1
```

**Rollback all migrations:**
```bash
migrate -path ./migrations -database "postgres://user:password@localhost:5432/dbname?sslmode=disable" down
```

**Check current migration version:**
```bash
migrate -path ./migrations -database "postgres://user:password@localhost:5432/dbname?sslmode=disable" version
```

## Docker

The included Dockerfile builds a minimal image with the migrate tool and your migrations:

```bash
docker build -t migrator .
docker run migrator -path=/migrations -database="$DATABASE_URL" up
```

## Project Structure

```
migrator/
├── Dockerfile        # Container image for running migrations
├── Makefile          # Helper commands
├── migrations/       # SQL migration files
└── README.md
```
