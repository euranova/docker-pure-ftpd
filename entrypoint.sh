#!/bin/bash

echo "Checking params..."

if [ -z ${FTP_USERNAME+x} ]; then
  echo "ERROR FTP_USERNAME is unset."
  exit 1
fi

if [ -z ${FTP_USERNAME+x} ]; then
  echo "ERROR FTP_PASSWORD is unset."
  exit 1
fi

pure-pw useradd \
      $FTP_USERNAME -f /etc/pure-ftpd/passwd/pureftpd.passwd \
     -m -u ftpuser -d /home/ftpusers/data > /dev/null << EOF
$FTP_PASSWORD
$FTP_PASSWORD
EOF

PORT_RANGE=${PORT_RANGE:-30000:31000}
GUESSED_IP=$(ip addr | grep 'state UP' -A2 | head -n3 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
ADVERTISED_HOST=${ADVERTISED_HOST:-${GUESSED_IP}}

echo "Running run.sh..."
./run.sh -c 1000 -C 300 -y 100:100 -l puredb:/etc/pure-ftpd/pureftpd.pdb \
                    -E -j -R -P ${ADVERTISED_HOST} -p ${PORT_RANGE} \
                    -s -A -j -Z -H -4 -E -R -G -X -x \
                    -d -d -O w3c:/var/log/pure-ftpd/transfer.log