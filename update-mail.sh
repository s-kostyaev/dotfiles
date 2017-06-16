#!/usr/bin/bash

mbsync -aV
notmuch new
notmuch tag -inbox +report -unread -- tag:unread and from:sergey.kostyaev@eltex.loc and отчет
notmuch tag +jenkins -inbox -unread -- tag:unread and 'from:jenkins.ims@eltex.loc'
notmuch tag -inbox -unread +github -- tag:unread and 'from:subscribed@noreply.github.com'
notmuch tag -inbox -unread +github -- tag:unread and 'to:*@noreply.github.com'
notmuch tag -inbox -unread +coursera -- tag:unread and 'from:no-reply@m.mail.coursera.org'
notmuch tag -inbox -unread +junK -- tag:unread and 'from:bondaruk.marina@letyshops.ru'
notmuch tag -unread -- tag:unread and 'from:lj-notify@livejournal.com'
notmuch tag -inbox -unread +junK -- tag:unread and 'from:github_atom@discoursemail.com'
notmuch tag -inbox -unread +junK -- tag:unread and 'from:mail@change.org'
notmuch tag -inbox -unread +paYpal -- tag:unread and 'from:paypal@mail.paypal.com'
notmuch tag -inbox -unread +steam -- tag:unread and 'from:noreply@steampowered.com'
notmuch tag -inbox +gOg -- tag:unread and tag:inbox and 'from:*@gog.com'
notmuch tag -inbox +HB -- tag:unread and tag:inbox and 'from:*@humblebundle.com'
notmuch tag -inbox +megafon -- tag:unread and tag:inbox and 'from:*@megafon.ru'
notmuch tag -inbox +junK -- tag:unread and tag:inbox and 'from:*@*eldorado.ru'
~/notmuch-notification.sh
