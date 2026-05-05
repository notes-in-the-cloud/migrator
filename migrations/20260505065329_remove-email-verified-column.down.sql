BEGIN;

ALTER TABLE auth_service.identities ADD COLUMN email_verified boolean;

COMMIT;