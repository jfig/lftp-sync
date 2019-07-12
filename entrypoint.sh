
if [ $DIRECTION = download -o ${DIRECTION} = d ]
then
  direction=""
else
  direction=" --reverse "
fi

lftp -e "
set ssl:verify-certificate no;
open $FTP_HOST;
user $FTP_USER $FTP_PASS;
mirror \
$direction \
--delete \
--only-newer \
--verbose \
--allow-chown \
--allow-suid \
--no-umask \
--continue \
$FTP_SOURCE $FTP_TARGET;
bye;
"
