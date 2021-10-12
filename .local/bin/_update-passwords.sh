#!/bin/sh

# This is a private file. Don't call this directly

# Remote directory
REMOTE_DIR="/mnt/share/Mads"


# Make Passwords.kdbx and otp_accounts.json.aes writable
chmod 600 "$PRIVATE_DIR/Passwords.kdbx" "$PRIVATE_DIR/otp_accounts.json.aes" 2>/dev/null

# Copy Passwords.kdbx and otp_accounts.json.aes files to Private directory
scp mads@"$URL":"$REMOTE_DIR"/\{Passwords.kdbx,otp_accounts.json.aes\} "$PRIVATE_DIR"/

# Make Passwords.kdbx and otp_accounts.json.aes read only
chmod 400 "$PRIVATE_DIR/Passwords.kdbx" "$PRIVATE_DIR/otp_accounts.json.aes"
