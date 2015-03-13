Introduction
============

Communicado are a UK limited company (03709008) that routinely transmits a
large amount of unsolicited commercial email.  We are collecting a list of all
the domains and networks they send from so that mail administrators can easily
block their emissions.

The lists are updated as frequently as possible (usually several times per day
during the week) and can be downloaded from the github repository here:

https://github.com/antibodyMX/communicado

The lists and DNSBL are free and open access for personal use.  Commercial or
corporate users are welcome to mirror the domain list, but please run your own
local DNSBL.  Doing so is trivial, see the example below.

Needless to say, in either case, you use this data entirely AT YOUR OWN RISK.

Please follow the twitter account @Excommunicado for updates and general news.


Using the lists
===============

Exim
====

Should you use Exim, you can cron fetching the data file from the following:
    <https://raw.github.com/antibodyMX/communicado/master/hepworth.txt>

And if you use Exim, the ACLs for the flat-files are:

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         sender_domains = /etc/exim4/hepworth.txt

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         hosts = /etc/exim4/hepworth-networks.txt

For the real-time DNS black hole, it is:

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         dnslists = excommunicado.co.uk/$sender_address_domain



Postfix
=======

Add the following line at an appropriate place in your configuration file:

    smtpd_sender_restrictions =  reject_rhsbl_sender excommunicado.co.uk


Setting up your own DNSBL
=========================

If you're running more than one mail server, you might want to run your own
local DNSBL instance using rbldnsd.  If you're running Debian you can install
this with:

    sudo apt-get install rbldnsd

You then need to edit /etc/default/rbldnsd and create an options line such as:

    RBLDNSD="- -b 192.168.0.1/53 -b -t 60 -A -r/var/lib/rbldns dnsbl.local:dnset:hepworth.db"

The hepworth.db file can be generated from hepworth.txt using the included rbldnsdise.sh script.

You'll need to create a fake zone for "dnsbl.local" containing NS records that
point to your DNSBL server.  At that point you would then adjust the above
DNSBL example to be:

    deny message = Communicado Ltd., see http://blog.hinterlands.org/2013/10/unwanted-email-from-communicado-ltd/
         dnslists = dnsbl.local/$sender_address_domain


Contacts
========

The current maintainers of the list are:

* Martin A. Brooks <martin@antibodyMX.net>
* Rob Kendrick <rjek@rjek.com>

Thanks
======

[Bytemark Hosting](http://www.bytemark.co.uk/) kindly provides infrastructure
for one of the three nameservers that serve the DNS black hole, using their
[BigV](http://www.bigv.io/) virtualisation platform.

Contributing
============

If you spot a Communicado domain that isn't on the list, please tell us about
it.  Our preference for notifications is:

* Pull request.
* To @Excommunicado on twitter.
* Email to the above addresses.

Access to the lists will always be open and free.  The DNSBL will be kept open
access and free for as long as possible.  Bitcoin contributions to
1Mi3yt4ZDuYMjAZkHYqVMNg27TsKUs1QNP will help keep it online. Thankyou.
