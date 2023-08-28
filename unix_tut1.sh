# Create a work directory for a unix tutorial work.
mkdir unix_tut1

# Switch to the new directory you will work in.
cd unix_tut1

# Get the data from SGD.
wget http://data.biostarhandbook.com/data/SGD_features.tab 

# Also get the README file.
wget http://data.biostarhandbook.com/data/SGD_features.README

# Quick check. Where are you and what have you got?
echo current path
pwd
echo current files
ls

#count the lines in the file
cat SGD_features.tab | wc -l

#YAL060W lines match a specific pattern?
cat SGD_features.tab  | grep YAL060W > YAL060W.txt

#How can we tell how many lines DO NOT match a given pattern?

cat SGD_features.tab  | grep -v Dubious > dubious.txt

#How many feature types are in this data?

cat SGD_features.tab | cut -f 2 > type.txt


##To find out the most frequent unique elements, we need to sort the output of uniq.
cat type.txt | sort | uniq -c | sort -rn | head > uniq.txt

##One liner
#activate conda environment bioinfo

cat SGD_features.tab | cut -f 2 | sort-uniq-count-rank | head > uniq2.txt

