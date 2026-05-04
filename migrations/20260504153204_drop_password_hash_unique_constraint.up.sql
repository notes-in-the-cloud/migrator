BEGIN;

ALTER TABLE auth_service.users
    ALTER COLUMN password_hash DROP NOT NULL;

COMMIT;