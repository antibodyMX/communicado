Introduction
============

Communicado are a UK limited company (03709008) that routinely transmits a
large amount of unsolicited commercial email.  We are collecting a list of all
the domains and networks they send from so that mail administrators can easily
block their emissions.

The lists are updated as frequently as possibly (usually several times per day
during the week) and can be downloaded from the github repository here:

https://github.com/antibodyMX/communicado

The lists are free to use for personal and commercial purposes, however you do
so entirely at your own risk. Please follow the twitter account @Excommunicado
for updates and general news.

We offer both a text file of domains you can use, and a DNS real-time black
hole.

Should you use Exim, you can cron fetching the data file from the following:
    <https://raw.github.com/antibodyMX/communicado/master/hepworth.txt>

And if you use Exim, the ACL is for flat-file:

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         sender_domains = /etc/exim4/hepworth.txt

For the real-time DNS black hole, it is:

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         dnslists = excommunicado.co.uk/$sender_address_domain

Contacts
========

The current maintainers of the list are:

Martin A. Brooks <martin@antibodyMX.net>
Rob Kendrick <rjek@rjek.com>


