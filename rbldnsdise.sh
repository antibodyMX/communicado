#!/bin/sh
# usage: rbldnsdise.sh < hepworth.txt > hepworth.db
#        rbldnsd excommunicado.co.uk:dnset:hepworth.db

echo :127.0.0.2:$ listed in excommunicado.co.uk, see https://github.com/antibodyMX/communicado
exec sed -e '/^mailer\./d' -e 's/^/./'
