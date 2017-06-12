#!/usr/bin/bash

mbsync -aV
notmuch new
notmuch tag -inbox +report -unread -- tag:unread and from:sergey.kostyaev@eltex.loc and отчет
notmuch tag +jenkins -inbox -unread -- tag:unread and 'from:jenkins.ims@eltex.loc'
~/notmuch-notification.sh
