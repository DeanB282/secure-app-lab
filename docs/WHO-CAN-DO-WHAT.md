# Sentinel Support - Who Can Do What?

## Why this file exists

Sentinel Support will contain different types of users.

Not every user should be able to perform every action.

This file defines what each type of user is allowed and not allowed to do before the application is built.

These rules will later be used when writing the application and when creating security tests.

---

# User Types

The application has three main user types:

1. Guest
2. User
3. Administrator

---

# Guest

A guest is somebody who has not logged in.

A guest can:

- View the login page.
- View the registration page.
- Create a normal user account.
- Log in with a valid account.

A guest cannot:

- View support tickets.
- Create support tickets.
- Comment on tickets.
- Upload files.
- Download private files.
- View user account information.
- Access administrator pages.

---

# Normal User

A normal user has created an account and logged in.

A normal user can:

- Log in.
- Log out.
- View their own account.
- Create a new support ticket.
- View their own tickets.
- View an individual ticket that belongs to them.
- Add comments to their own tickets.
- Upload allowed attachments to their own tickets.
- Download allowed attachments from their own tickets.

A normal user cannot:

- View another user's tickets.
- Change another user's tickets.
- Comment on another user's tickets.
- Upload files to another user's tickets.
- Download another user's private attachments.
- Access administrator pages.
- Manage other users.
- Change their own account role to administrator.

---

# Administrator

An administrator is a trusted user responsible for managing the support system.

An administrator can:

- Log in.
- Log out.
- Access the administrator area.
- View all support tickets.
- Open any support ticket.
- Comment on any support ticket.
- Change ticket status.
- View allowed ticket attachments.
- Download allowed ticket attachments.
- View basic user information needed to manage support requests.

For the first version of the project, administrators will not be able to:

- View users' passwords.
- Change stored password hashes directly.
- Disable security controls.
- Upload unrestricted files.
- Access information that the application does not need for support purposes.

---

# Permission Table

| Action | Guest | Normal User | Administrator |
|---|---|---|---|
| View login page | Yes | Yes | Yes |
| Register normal account | Yes | No | No |
| Log in | Yes | Yes | Yes |
| Log out | No | Yes | Yes |
| Create ticket | No | Yes | Yes |
| View own ticket | No | Yes | Yes |
| View another user's ticket | No | No | Yes |
| Comment on own ticket | No | Yes | Yes |
| Comment on another user's ticket | No | No | Yes |
| Upload file to own ticket | No | Yes | Yes |
| Upload file to another user's ticket | No | No | Yes |
| Download own ticket attachment | No | Yes | Yes |
| Download another user's attachment | No | No | Yes |
| Change ticket status | No | No | Yes |
| Access admin area | No | No | Yes |
| Manage user roles | No | No | No |

---

# Important Security Rules

## Rule 1 - Logging in is not enough

A logged-in user must still be checked before they access a ticket, file or administrator feature.

The application should not assume that somebody is allowed to access something simply because they are logged in.

---

## Rule 2 - Ticket ownership must be checked

When a normal user requests a ticket, the application should check:

1. Is the user logged in?
2. Which user is making the request?
3. Which user owns the requested ticket?
4. Does the logged-in user have permission to access it?

If the user does not own the ticket and is not an administrator, access should be denied.

---

## Rule 3 - File permissions follow ticket permissions

A normal user should not be able to access an attachment simply because they know or guess its file name or ID.

The application must check whether the user is allowed to access the ticket that the attachment belongs to.

---

## Rule 4 - Administrator checks must happen on the server

Hiding an administrator button on the webpage is not enough.

The application itself must check whether the logged-in account has the administrator role before allowing administrator actions.

---

## Rule 5 - Users cannot choose their own role

A normal user must not be able to register themselves as an administrator by changing form values or requests.

New public accounts should always receive the normal User role.

---

# Example

Alice and Bob are normal users.

The database contains:

- Ticket 101 belongs to Alice.
- Ticket 102 belongs to Bob.

Alice requests:

`/ticket.php?id=101`

Expected result:

**Allowed**

Alice requests:

`/ticket.php?id=102`

Expected result:

**Denied**

The reason is not that Alice failed to log in.

Alice is authenticated correctly.

The request is denied because Alice is not authorised to access Bob's ticket.

---

# What we will test later

These rules will eventually become security tests.

Examples:

- Guest tries to open a private ticket -> Denied
- Alice opens Alice's ticket -> Allowed
- Alice opens Bob's ticket -> Denied
- Bob opens Bob's ticket -> Allowed
- Bob opens Alice's ticket -> Denied
- Normal user opens admin page -> Denied
- Administrator opens admin page -> Allowed
- Normal user attempts to make themselves administrator -> Denied
- User attempts to download another user's attachment -> Denied

These tests will help prove that the application follows the rules written in this document.