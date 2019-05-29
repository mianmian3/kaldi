a=`ps -aux |grep "queue.pl" |awk '{print $2}'`
for number in $a
do 
  kill -9 $number 
done
