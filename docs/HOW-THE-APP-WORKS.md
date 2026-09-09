# Sentinel Support - How the App Works

## Why this file exists

Before building Sentinel Support, I want to understand the main parts of the application and how information moves between them.

This will make it easier to understand where security checks need to happen later.

---

# Main Parts

Sentinel Support will initially contain these main parts:

1. User
2. Web browser
3. PHP application
4. MySQL database
5. File storage
6. User session

---

# User

The user is the person using Sentinel Support.

Example users include:

- Alice
- Bob
- Administrator

A user may:

- Log in.
- Create a ticket.
- View a ticket.
- Add a comment.
- Upload a file.
- Download a file.

The user interacts with the application through a web browser.

---

# Web Browser

The browser displays the website and sends requests to the application.

Examples include:

- Opening the login page.
- Sending login details.
- Requesting a ticket.
- Sending a comment.
- Uploading a file.

Information coming from the browser should not automatically be trusted.

A user can potentially change URLs, form values, file names and request contents.

The application must therefore check information received from the browser.

---

# PHP Application

The PHP application is responsible for handling requests and deciding what should happen.

Its responsibilities will include:

- User registration.
- Login and logout.
- Session handling.
- Permission checks.
- Ticket creation.
- Ticket viewing.
- Comments.
- File uploads.
- File downloads.
- Administrator features.
- Database access.

The application acts as the main controlled layer between the user and stored information.

---

# MySQL Database

The database stores structured application information.

This will include:

- Users.
- Tickets.
- Comments.
- Attachment details.

Users do not communicate directly with the database.

Requests should pass through the PHP application first.

The application can then perform the required security checks before retrieving or changing information.

---

# File Storage

Ticket attachments will be stored separately from the main database.

The database will store information about the attachment while the actual file will be stored in file storage.

Files should be checked before they are accepted.

Later security work will include checking:

- File size.
- File type.
- File name.
- Storage location.
- Whether the user is allowed to access the file.

---

# User Session

A session helps the application remember which user has logged in.

For example:

1. Alice enters her login details.
2. The application checks them.
3. Alice is successfully authenticated.
4. The application creates a session.
5. Later requests can be linked back to Alice.

A session helps identify the logged-in user.

It does not automatically mean the user has permission to perform every action.

Permission checks are still required.

---

# Basic Application Flow

The main application flow will be:

User  
↓  
Web Browser  
↓  
PHP Application  
↓  
Security checks  
↓  
Database or File Storage  
↓  
PHP Application  
↓  
Web Browser  
↓  
User

---

# Example - Viewing a Ticket

Alice asks to view Ticket 101.

The expected process is:

1. Alice's browser requests Ticket 101.
2. The PHP application receives the request.
3. The application checks whether Alice is logged in.
4. The application checks who owns Ticket 101.
5. The application checks whether Alice is allowed to view it.
6. If allowed, the application retrieves the ticket from MySQL.
7. The application sends the ticket page back to Alice's browser.

If Alice is not allowed to access the ticket, the application should deny the request.

---

# Example - Uploading a File

Alice uploads a file to one of her support tickets.

The expected process is:

1. Alice selects a file in her browser.
2. The browser sends the file to the PHP application.
3. The application checks that Alice is logged in.
4. The application checks that Alice is allowed to access the ticket.
5. The application checks the uploaded file.
6. If the file is accepted, it is stored safely.
7. Information about the attachment is stored in the database.
8. The application confirms the result to Alice.

The browser should not be trusted to decide whether a file is safe.

---

# Requests and Responses

The browser and application communicate using HTTP.

A request is information sent from the browser to the application.

For example:

`GET /ticket.php?id=101`

This means the browser is asking for Ticket 101.

A response is information sent back from the application.

For example, the application may return the requested ticket page or deny access.

Security testing will later involve inspecting and changing these requests to understand how the application behaves.

---

# Trust

Information coming from the browser should be treated as untrusted until the application has checked it.

Examples include:

- Email addresses.
- Passwords.
- Ticket IDs.
- Ticket titles.
- Comments.
- File uploads.
- Form values.
- URL values.

The application should make security decisions rather than trusting information supplied by the browser.

---

# Main Diagram

```text
                    USER
                     |
                     v
                WEB BROWSER
                     |
                HTTP REQUEST
                     |
                     v
              PHP APPLICATION
                     |
          +----------+----------+
          |          |          |
          v          v          v
       SESSION     MYSQL     FILE STORAGE
                  DATABASE
          |          |          |
          +----------+----------+
                     |
                     v
              PHP APPLICATION
                     |
               HTTP RESPONSE
                     |
                     v
                WEB BROWSER
                     |
                     v
                    USER
```

---

# Security Principle

The browser can ask the application to perform an action.

That does not mean the action should automatically be allowed.

The application should check:

1. Who is making the request?
2. Are they logged in?
3. What are they trying to access?
4. Are they allowed to access it?
5. Is the supplied information safe to use?

Only after those checks should the requested action be performed.

---

# What I Need to Remember

**Authentication** tells the application who the user is.

**Authorisation** decides what that user is allowed to do.

**A session** helps the application remember who has logged in.

**The browser is controlled by the user and should not automatically be trusted.**

**The PHP application should make the important security decisions.**

**The database stores structured information.**

**File storage holds uploaded files.**

**HTTP requests and responses are how the browser and application communicate.**