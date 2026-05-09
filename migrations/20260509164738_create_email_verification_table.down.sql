BEGIN;

DROP INDEX IF EXISTS auth_service.idx_email_verification_tokens_user_id;

DROP TABLE IF EXISTS auth_service.email_verification_tokens;

ALTER TABLE auth_service.users
DROP COLUMN IF EXISTS email_verified;

COMMIT;