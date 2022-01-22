#echo use run.bash instead
#exit 1


../make.bash
cwd=`pwd`
das2fdir=`pwd`
temp=temp_${RANDOM}

dr=~/projects/dr
mdfile=${dr}/dr-edgecontainment.md
fname=`basename -s '.md' $mdfile`
temp=temp_${RANDOM}

#./a-${fname} | ./b-${fname} 2> $temp

# ./a-${fname} >$temp
# cat $temp

./b-${fname} <err

# #./check-errors.bash
# cp $temp err
# if grep -q failure <$temp
# then
#     echo
#     cat $temp 1>&2
#     echo quitting 1>&2
#     rm $temp
#     exit 1
# fi
# rm -f $temp
