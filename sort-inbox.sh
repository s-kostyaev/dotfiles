#!/usr/bin/bash

notmuch tag -inbox +report -unread -- from:sergey.kostyaev@eltex.loc and отчет
notmuch tag +jenkins -inbox -unread -- 'from:jenkins.ims@eltex.loc'
notmuch tag -inbox -unread +github -- 'from:subscribed@noreply.github.com'
notmuch tag -inbox -unread +github -- 'to:*@noreply.github.com'
notmuch tag -inbox -unread +coursera -- 'from:no-reply@m.mail.coursera.org'
notmuch tag -inbox -unread +letyshops -- 'from:bondaruk.marina@letyshops.ru'
notmuch tag -inbox -unread +lj -- 'from:lj-notify@livejournal.com'
notmuch tag -inbox -unread +atom -- 'from:github_atom@discoursemail.com'
notmuch tag -inbox -unread +change.org -- 'from:mail@change.org'
notmuch tag -inbox -unread +paypal -- 'from:paypal@mail.paypal.com'
notmuch tag -inbox -unread +steam -- 'from:noreply@steampowered.com'
notmuch tag -inbox +gog -- 'from:*@gog.com'
notmuch tag -inbox +HB -- 'from:*@humblebundle.com'
notmuch tag -inbox +megafon -- 'from:*@megafon.ru'
notmuch tag -inbox +eldorado -- 'from:*@*eldorado.ru'
