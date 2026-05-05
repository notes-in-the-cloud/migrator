BEGIN;

ALTER TABLE auth_service.identities DROP COLUMN email_verified;

COMMIT;