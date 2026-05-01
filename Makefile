MIGRATIONS_DIR := migrations

.PHONY: create-migration
create-migration:
	@if [ -z "$(name)" ]; then \
		echo "Migration name is required."; \
		echo "Usage: make create-migration name=init_schemas"; \
		exit 1; \
	fi
	@mkdir -p $(MIGRATIONS_DIR)
	migrate create -ext sql -dir $(MIGRATIONS_DIR) $(name)