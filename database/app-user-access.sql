-- Sentinel Support
-- Database permissions for the application account.
--
-- The application only needs to read and change application data.
-- It does not need permission to create, alter, or delete database tables.

REVOKE ALL PRIVILEGES, GRANT OPTION
FROM 'sentinel'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE
ON sentinel_support.*
TO 'sentinel'@'%';
