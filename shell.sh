#!/bin/sh
#Author:WenpingLi
#Date:2014-12-23
#从小到大排序输出到sort.txt
sed 's/|//g' $1 | sort -k 1 -g > sort.txt
echo "---------------"

#取最小值
min=`head -n 1 sort.txt`
echo "min = $min"
echo "---------------"

#取最大值
max=`tail -n 1 sort.txt`
echo "max = $max"
echo "---------------"

#取平均值
ave=`awk 'BEGIN { a=0 }; { a=a+$0 }; END { print a/NR }' sort.txt`
echo "ave = $ave"
echo "---------------\n"

#计算总共多少条记录
total=`wc -l sort.txt|awk '{print $1}' `

#筛选小于100的条数
a=`awk '$1<100 {print $0}' sort.txt |wc -l`
#筛选
b=`awk '$1>100 && $1<200 {print $0}' sort.txt |wc -l`
#筛选
c=`awk '$1>200 && $1<300 {print $0}' sort.txt |wc -l`
#筛选
d=`awk '$1>300 && $1<400 {print $0}' sort.txt |wc -l`
#筛选
e=`awk '$1>400 {print $0}' sort.txt |wc -l`

echo "---------------"
echo "total = $total \n"
echo "total = 100 %"
echo "---------------"

#计算百分比并输出
x=`awk 'BEGIN{printf "%.4f%\n",('$a'/'$total')*100}'`
echo "$i<100 = $a" 
echo "precent = $x"
echo "---------------"

x=`awk 'BEGIN{printf "%.4f%\n",('$b'/'$total')*100}'`
echo "$i>100 && $i<200= $b"
echo "precent = $x"
echo "---------------"

x=`awk 'BEGIN{printf "%.4f%\n",('$c'/'$total')*100}'`
echo "$i>200 && $i<300= $c"
echo "precent = $x"
echo "---------------"

x=`awk 'BEGIN{printf "%.4f%\n",('$d'/'$total')*100}'`
echo "$i>300 && $i<400= $d"
echo "precent = $x"
echo "---------------"

x=`awk 'BEGIN{printf "%.4f%\n",('$e'/'$total')*100}'`
echo "$i>400= $e"
echo "precent = $x"
echo "---------------"
