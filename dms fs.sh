Directory=/proj/data/nap/dms250/logs
Fs=`df -h $Directory| awk 'NR>1 {print $5}' | sed 's/%//'`
threshold=70
if [ $Fs -gt $threshold ];then

        echo "Filesystem usage is more than $threshold%"
        echo "Zipping  the files older than 150 days"
        find $Directory -type f \( -name "out.txt*" -o -name "err.txt*" \) -mtime +20 -exec gzip {} \;
		
		
        #echo "Deleting the files older than 150days"
       #find $Directory -type f \( -name "out.txt*" -o -name "err.txt*" \) -mtime +150 -exec rm -rf {} \;
else
        echo "Filesystem is less than 85%"
fi

/proj/data/nap/dms250/logs


