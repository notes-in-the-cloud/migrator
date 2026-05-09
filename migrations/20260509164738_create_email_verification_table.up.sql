BEGIN;

ALTER TABLE auth_service.users
    ADD COLUMN email_verified BOOLEAN NOT NULL DEFAULT false;

CREATE TABLE auth_service.email_verification_tokens (
    id uuid PRIMARY KEY,
    user_id uuid NOT NULL,
    token_hash text NOT NULL UNIQUE,
    expires_at timestamptz NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),

    CONSTRAINT fk_email_verification_tokens_user FOREIGN KEY (user_id)
    REFERENCES auth_service.users(id) ON DELETE CASCADE
);

CREATE INDEX idx_email_verification_tokens_user_id
    ON auth_service.email_verification_tokens(user_id);

COMMIT;