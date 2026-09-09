# Sentinel Support - What We Store

## Why this file exists

Sentinel Support needs to remember information such as users, support tickets, comments and file attachments.

This file explains what information the first version of the application needs to store and how the different types of information are connected.

The application will use a MySQL database.

---

# Main Database Tables

The first version will use four main tables:

1. Users
2. Tickets
3. Comments
4. Attachments

---

# Users

The Users table stores application accounts.

Each user will have:

- ID
- Email address
- Password hash
- Role
- Account creation date

Example:

| ID | Email | Role |
|---|---|---|
| 1 | alice@example.test | user |
| 2 | bob@example.test | user |
| 3 | admin@example.test | admin |

The ID uniquely identifies each user.

Email addresses should be unique so that two accounts do not use the same login email.

Passwords will not be stored as plain text.

The database will store a password hash instead.

The role will initially be either:

- user
- admin

---

# Tickets

The Tickets table stores support requests.

Each ticket will have:

- ID
- User ID
- Title
- Description
- Status
- Creation date
- Last update date

Example:

| ID | User ID | Title | Status |
|---|---|---|---|
| 101 | 1 | Cannot log in | Open |
| 102 | 2 | Upload problem | In Progress |

The User ID shows which user owns the ticket.

For example:

User 1 is Alice.

If Ticket 101 contains:

`user_id = 1`

then Ticket 101 belongs to Alice.

This relationship will later be used when checking whether a normal user is allowed to view a ticket.

---

# Comments

The Comments table stores messages added to support tickets.

Each comment will have:

- ID
- Ticket ID
- User ID
- Comment text
- Creation date

The Ticket ID shows which ticket the comment belongs to.

The User ID shows who wrote the comment.

One ticket can contain many comments.

---

# Attachments

The Attachments table stores information about files uploaded to tickets.

Each attachment will have:

- ID
- Ticket ID
- User ID
- Original file name
- Stored file name
- File type
- Upload date

The actual file will be stored in file storage.

The database will store information that links the file to the correct ticket and user.

The original file name comes from the user and should not automatically be trusted.

The application may create its own stored file name rather than using the original name directly.

---

# Primary Keys

Each table will have an ID.

The ID uniquely identifies one record.

Examples:

- User 1
- Ticket 101
- Comment 5
- Attachment 7

This ID is called a primary key.

A primary key should uniquely identify the record within its table.

---

# Foreign Keys

Some records need to refer to records in another table.

For example:

A ticket contains a User ID.

This connects:

`tickets.user_id`

to:

`users.id`

This means the ticket belongs to that user.

This type of connection is called a foreign key.

Other examples include:

`comments.ticket_id` -> `tickets.id`

`comments.user_id` -> `users.id`

`attachments.ticket_id` -> `tickets.id`

`attachments.user_id` -> `users.id`

---

# Relationships

The main relationships are:

One user can create many tickets.

One ticket belongs to one user.

One ticket can have many comments.

One user can write many comments.

One ticket can have many attachments.

One user can upload many attachments.

---

# Simple Relationship Diagram

```text
USERS
  |
  |---- owns ----> TICKETS
  |                  |
  |                  |---- has ----> COMMENTS
  |                  |
  |                  |---- has ----> ATTACHMENTS
  |
  |---- writes --------------------> COMMENTS
  |
  |---- uploads -------------------> ATTACHMENTS
```

---

# Security Connections

The database design will support some important security checks.

## Ticket access

When a user requests a ticket, the application can compare:

- Logged-in User ID
- Ticket User ID

If they match, the user owns the ticket.

If they do not match, the application must check whether the user is an administrator before allowing access.

---

## Attachment access

An attachment belongs to a ticket.

A normal user should only be allowed to access the attachment if they are allowed to access that ticket.

Knowing or guessing an attachment ID should not automatically provide access.

---

## User roles

The Users table stores the account role.

This helps the application decide whether a user is allowed to access administrator functions.

Public registration should create normal user accounts only.

A user should not be able to choose the administrator role for themselves.

---

## Passwords

Passwords must not be stored as plain text.

The database will store password hashes.

Password handling will be implemented and tested when the authentication part of the application is built.

---

# Information We Are Not Storing

The first version will not store:

- Real customer information
- Real company information
- Plain-text passwords
- Payment details
- Real authentication tokens
- Real API keys
- Real university records

All test information will be fictional.

---

# What I Need to Remember

A **table** stores one type of information.

A **row** is one individual record.

A **column** is one piece of information about that record.

A **primary key** uniquely identifies a record.

A **foreign key** connects one record to a record in another table.

The relationships between tables are important because they help the application understand ownership.

Ownership is important for security because it helps decide who should be allowed to access information.