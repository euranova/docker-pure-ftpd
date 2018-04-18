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

echo "Running run.sh..."
./run.sh $@