# Sentinel Support - App Plan

## What is the app?

Sentinel Support is a fictional support website.

Users will be able to create an account, log in and open support tickets when they need help.

Each user should only be able to see and interact with their own tickets.

An administrator will be able to view all tickets, respond to users and manage ticket status.

The application is being built using fictional users and test data for a cybersecurity learning project.

---

## Why am I building it?

I am building Sentinel Support to practise both web development and web application security.

The aim is to understand how security problems happen inside an application, rather than only learning how to use security testing tools.

Once the normal application works, I will create controlled security weaknesses inside a local test version.

I will then:

1. Find the weakness.
2. Understand why it exists.
3. Demonstrate its effect.
4. Fix the underlying problem.
5. Test the application again.
6. Prove that the original attack no longer works.
7. Check that normal users can still use the application correctly.

---

## Who uses the app?

There will be three types of visitor.

### Guest

A guest is somebody who has not logged in.

A guest can:

- View the login page.
- Create a new account.
- Log in.

A guest cannot:

- Create support tickets.
- View support tickets.
- Upload files.
- Access administrator features.

### User

A user is somebody with a normal account who has logged in.

A user can:

- Log in.
- Log out.
- Create a support ticket.
- View their own tickets.
- Add comments to their own tickets.
- Upload allowed files to their own tickets.
- Download files attached to their own tickets.

A normal user should not be able to:

- View another user's tickets.
- Change another user's tickets.
- Download another user's private attachments.
- Access administrator pages.
- Manage other users.

### Administrator

An administrator is a trusted account used to manage the support system.

An administrator can:

- Log in.
- View all support tickets.
- View individual tickets.
- Respond to tickets.
- Change ticket status.
- View allowed ticket attachments.
- Access the administrator area.

---

## What information will the app store?

The application will store fictional test information only.

This will include:

### User information

- User ID.
- Email address.
- Password in a protected form.
- Account role.
- Account creation date.

### Ticket information

- Ticket ID.
- User who created the ticket.
- Ticket title.
- Ticket description.
- Ticket status.
- Creation date.
- Last update date.

### Comments

- Comment ID.
- Ticket the comment belongs to.
- User who wrote the comment.
- Comment text.
- Creation date.

### Attachments

- Attachment ID.
- Ticket the file belongs to.
- User who uploaded it.
- Original file name.
- Stored file name.
- File type.
- Upload date.

---

## Ticket status

A ticket can have one of these states:

- Open
- In Progress
- Closed

A new ticket starts as Open.

An administrator can change its status while dealing with the support request.

---

## Important security rules

The application should follow these basic rules:

1. A user must log in before accessing private parts of the app.
2. A normal user should only see their own tickets.
3. A normal user should only access files belonging to their own tickets.
4. Administrator pages should only be available to administrators.
5. User input should not be trusted automatically.
6. Database queries should handle user input safely.
7. Uploaded files should be checked before being accepted.
8. Passwords should not be stored as plain text.
9. The application should reject actions that the user is not allowed to perform.
10. Security fixes should be tested so that we know they actually work.

---

## Test data

Everything inside the project will be fictional.

Example users may include:

- alice@example.test
- bob@example.test
- admin@example.test

No real customer information, passwords or company information will be used.

---

## What is not part of this project?

For the first version, the application will not include:

- Real email sending.
- Payment processing.
- Social media login.
- Real customer information.
- Public internet deployment of the vulnerable version.
- Mobile applications.
- Live chat.
- Complex company integrations.

Keeping the first version focused will make it easier to understand, test and secure properly.

---

## Main goal

The main goal is not to build the biggest support application possible.

The goal is to build a small application that I understand properly and can use to demonstrate how security weaknesses are found, fixed and tested.

The project should show:

**Build it -> Understand it -> Test it -> Break it safely -> Fix it -> Prove the fix works**