BEGIN;

ALTER TABLE auth_service.users
    ALTER COLUMN password_hash SET NOT NULL;

COMMIT;