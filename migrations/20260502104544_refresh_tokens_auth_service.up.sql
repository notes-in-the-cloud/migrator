BEGIN;

CREATE TABLE auth_service.refresh_tokens (
    id uuid PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES auth_service.users(id) ON DELETE CASCADE,
    token_hash text NOT NULL UNIQUE,
    expires_at timestamptz NOT NULL,
    revoked_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now()
);

COMMIT;