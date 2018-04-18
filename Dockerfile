FROM stilliard/pure-ftpd:hardened

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-c 1000 -C 300 -y 100:100 -l puredb:/etc/pure-ftpd/pureftpd.pdb \
                    -E -j -R -P 127.0.0.1 -p 30000:31000 \
                    -s -A -j -Z -H -4 -E -R -G -X -x \
                    -d -d -O w3c:/var/log/pure-ftpd/transfer.log"]
