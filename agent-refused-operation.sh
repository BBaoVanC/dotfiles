#!/bin/sh
# https://unix.stackexchange.com/questions/371901/gpg-agent-refuses-ssh-keys-with-ssh-add-reporting-agent-refused-operation

echo UPDATESTARTUPTTY | gpg-connect-agent
