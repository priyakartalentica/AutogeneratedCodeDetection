gitgen(){
echo "Listing FIles"
git ls-files> gitoutput.txt
cat gitoutput.txt

cat gitoutput.txt | while read line 
do
  echo "inside loop: name of the file "	
  echo $line
  
  cmd="head -10 "+ $line + " | grep -c generated"
  echo $cmd
  echo "cmd executed"
  count=$(head -10 $line | grep -c generated)
  str=$line + "," + $count
  echo $str >> gengencountoutput.csv

done
echo "End of function"
}
