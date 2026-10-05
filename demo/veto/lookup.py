"""Sample for the VETO scanner. Nothing in this repository imports this file."""


def find_account(cursor, email):
    cursor.execute("SELECT id FROM accounts WHERE email = '" + email + "'")
