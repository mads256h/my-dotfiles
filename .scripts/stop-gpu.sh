#!/bin/sh

# This script is ran automatically on startup by kde.
# Turn off the nvidia GPU on my MSI laptop, to save power.
kdesu -c "echo \"\_SB.PCI0.PEG0.PEGP._OFF\" > /proc/acpi/call; cat /proc/acpi/call > /tmp/stoplog"
