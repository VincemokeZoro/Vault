# Vault

A Victorian-inspired personal finance and savings tracker built with Python and Tkinter.

Vault is a desktop application for managing income, expenses, savings goals, and financial activity through a simple local interface. It uses SQLite for persistent storage and includes tools for tracking, analyzing, and exporting financial data.

## Features

* 💰 Track income and expenses
* 🎯 Create and manage multiple savings goals
* 📊 View financial summaries and charts
* 📅 Calendar-based transaction tracking
* 🔎 Search, filter, and sort transactions
* ✏️ Edit and delete transactions
* ↩️ Undo recent changes
* 🔁 Recurring transactions
* 📝 Add notes, categories, dates, and times to transactions
* 📈 Track savings goal progress
* 🌙 Light and dark themes
* 💾 SQLite database persistence
* 📤 Export data to CSV and Excel
* 📥 Import transactions from CSV
* 💽 Automatic database backups
* 🔐 Database integrity checking
* ⌨️ Keyboard shortcuts
* ⚡ Quick transaction entry
* 🖥️ Windows executable support

## Tech Stack

* **Python**
* **Tkinter** for the graphical interface
* **SQLite** for local data storage
* **Matplotlib** for charts
* **PyInstaller** for Windows executable builds

## Project Structure

```text
Vault/
├── main.py
├── Vault.spec
├── build_vault_fixed.bat
├── .gitignore
└── README.md
```

Generated files such as the database, backups, build files, and executable are excluded from the source repository.

## Running Vault

### Requirements

* Python 3.x
* Tkinter
* Matplotlib

Clone the repository:

```bash
git clone https://github.com/VincemokeZoro/Vault.git
cd Vault
```

Run the application:

```bash
python main.py
```

Vault will automatically create its SQLite database when needed.

## Building the Windows Executable

Vault can be packaged into a standalone Windows executable using PyInstaller.

```bash
pyinstaller Vault.spec
```

The resulting executable will be generated inside the `dist` directory.

A helper build script is also included:

```text
build_vault_fixed.bat
```

## Data Storage

Vault stores financial data locally using SQLite.

The personal database file is intentionally excluded from Git:

```text
vault.db
```

Backups are also kept outside the source repository.

This means cloning the repository gives you a clean application rather than another user's personal financial data.

## Why I Built This

Vault was created as a practical desktop application project while learning and improving my skills in Python, GUI development, databases, and software development.

The project also serves as part of my growing software portfolio.

## Future Improvements

Possible future additions include:

* More detailed financial analytics
* Budget planning
* Custom categories
* Improved charts
* More export formats
* Additional customization options
* Cloud synchronization
* Mobile or web version

## License

This project is currently intended as a personal portfolio project.
