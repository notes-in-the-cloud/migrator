BEGIN;

CREATE INDEX users_email_idx ON auth_service.users (email);

COMMIT;