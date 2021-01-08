#!/bin/sh

# This is a private file. Don't call this directly


# Make Passwords.kdbx and otp_accounts.json.aes writable
chmod 600 ~/Passwords.kdbx ~/otp_accounts.json.aes

# Copy Passwords.kdbx and otp_accounts.json.aes files to home directory
scp root@"$URL":/mnt/share/Mads/\{Passwords.kdbx,otp_accounts.json.aes\} ~/

# Make Passwords.kdbx and otp_accounts.json.aes read only
chmod 400 ~/Passwords.kdbx ~/otp_accounts.json.aes
