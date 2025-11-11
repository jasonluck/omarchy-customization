# Omarchy Customization


## Troubleshooting Omarchy

### Sudo Password not working
This indicates that the account might be locked out. to fix:
1. Press CTRL + ALT + F3 to get a new TTY
2. Login as root using the password you provided during initial setup
3. run `faillock --user $username --reset`
4. If you don't know the users password you can reset it with `passwd $username`
