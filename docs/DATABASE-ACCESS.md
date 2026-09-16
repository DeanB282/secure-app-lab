# Database Access

## Purpose

Sentinel Support uses a separate database account called `sentinel` for normal application activity.

The application account should only have the permissions it needs to work with application data. It should not be able to change the structure of the database.

This follows the principle of least privilege: give an account only the access required for its job.

## Application Account

The application connects to the `sentinel_support` database using the `sentinel` account.

The account is allowed to:

- Read existing data using `SELECT`
- Add new data using `INSERT`
- Change existing data using `UPDATE`
- Remove data using `DELETE`

The account is not intended to:

- Create database tables
- Alter existing database tables
- Drop database tables
- Perform database administration

The required permissions are defined in:

`database/app-user-access.sql`

## Why the Permissions Were Reduced

When the MySQL container initially created the application account, the account had broader permissions than the application required.

A support application needs to work with records such as users, tickets, comments and attachments, but it does not normally need permission to change the database structure.

Reducing these permissions limits the damage that could occur if the application account were misused or compromised.

## Permission Testing

The permissions were tested using both allowed and denied actions.

### Allowed Actions

The `sentinel` account successfully performed:

- `SELECT` to read users
- `INSERT` to create a temporary support ticket
- `UPDATE` to change the temporary ticket status
- `DELETE` to remove the temporary ticket

The temporary record was checked after each change and removed when testing was complete.

### Denied Action

The `sentinel` account was used to attempt:

`CREATE TABLE`

MySQL rejected the request with:

`ERROR 1142 (42000): CREATE command denied`

A follow-up check confirmed that the attempted table was not created.

This demonstrated that normal application activity continued to work while an unnecessary privileged action was blocked.

## Automatic Database Setup

The project was configured so a new MySQL database can initialise itself from the files stored in the repository.

The startup order is:

1. `database/schema.sql` creates the database tables.
2. `database/seed.sql` adds safe fictional test data.
3. `database/app-user-access.sql` applies the restricted application permissions.

These files are mounted read-only into the MySQL container through `compose.yaml`.

The initialisation scripts run when MySQL starts with a new empty database volume.

## Fresh Build Test

A separate temporary Docker Compose project was created using a new empty database volume.

This simulated somebody starting the project without an existing database.

The fresh environment successfully:

- Started MySQL and passed its health check
- Created the expected database tables
- Added the fictional users from the seed data
- Created working access for the `sentinel` account
- Applied only `SELECT`, `INSERT`, `UPDATE` and `DELETE`
- Blocked a `CREATE TABLE` attempt

The temporary test environment was deleted after validation.

## Persistent Data Test

The original MySQL container was removed while its Docker volume was preserved.

The container was later recreated and connected to the original volume.

The original database still contained the expected users and retained the restricted permissions for the `sentinel` account.

This demonstrated the difference between the replaceable Docker container and the persistent database volume.

## Result

The Sentinel Support database now has:

- A separate application database account
- Reduced application permissions
- Tested allowed and denied actions
- Reproducible first-time database setup
- Read-only initialisation file mounts
- Persistent database storage
- A tested fresh-build process

No real user information is used in the database. The seed data is fictional and intended only for local development and security testing.
