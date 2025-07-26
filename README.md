# Using MySQL in Visual Studio Code (VS Code) - Windows

This guide explains how to use MySQL inside Visual Studio Code using the integrated terminal.  
(It assumes MySQL is already installed and running on your system.)

---

## 1. Open VS Code and Connect to MySQL

1. Open **Visual Studio Code**.
2. Open the **integrated terminal**:
   - Shortcut: `Ctrl + ~`
3. Run the following command to connect to MySQL:
   ```bash
   mysql -u root -p
4. Enter your MySQL password to log in.


## 2.   Install VS Code & Required Extensions
Open VS Code.

1. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X).
2. Search for and install: "MySQL" (by Jun Han).

## 3. Configure Connection 

1. Open Command Palette.
2. Type: MySQL: Add Connection
3. Enter:
    Host: localhost (or server IP if remote).
    Port: 3306 (default).
    User: root (or your MySQL user).
    Password: (the one you set).


##4. Test the Connection

1. Open the MySQL explorer in VS Code (side panel).
2. Click your connection → If it connects successfully, you're ready!



