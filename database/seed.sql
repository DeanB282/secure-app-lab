-- Sentinel Support
-- Safe test data for local development.
--
-- All users and tickets in this file are fictional.

INSERT INTO users (
    email,
    password_hash,
    role
) VALUES
(
    'alice@example.test',
    'REPLACE_WITH_REAL_HASH_LATER',
    'user'
),
(
    'bob@example.test',
    'REPLACE_WITH_REAL_HASH_LATER',
    'user'
),
(
    'admin@example.test',
    'REPLACE_WITH_REAL_HASH_LATER',
    'admin'
);


INSERT INTO tickets (
    user_id,
    title,
    description,
    status
) VALUES
(
    1,
    'Cannot access account',
    'I receive an error when trying to sign in.',
    'Open'
),
(
    2,
    'Upload not working',
    'I cannot upload a file to my support ticket.',
    'In Progress'
);
