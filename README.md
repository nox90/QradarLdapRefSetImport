# QradarLdapRefSetImporter

Custom LDAP import for IBM Qradar

Bash script intended to solve the annoying problem of working with Qradar's built in Ldap import - 
This script can be used as a custom action triggered when the LDAP import destination changes, or as a crontab.
Make sure your LDAP import has only the 'sAMAccountName' in the attribute list.

Usage - copy to Qradar and run via Cron or custom action

