Unix Tutorial 1

### How do I obtain a data file that is online?

We can use either the curl or wget command line tool to download the content of URLs.

### Usage/Examples

```
# Create a working directory for a Unix tutorial work.
mkdir unix_tutorial

# Switch to the new directory you will work in.
cd unix_tutorial

# Get the data from SGD.
wget http://data.biostarhandbook.com/data/SGD_features.tab 

# Also get the README file.
wget http://data.biostarhandbook.com/data/SGD_features.README

# Quick check. Where are you and what have you got?
pwd
ls
```
### What is flag?
A “flag” in Unix terminology is a parameter added to the command. 

```
ls -l
```
we can use the manual to learn more about a command:
```
man ls
```
or we can use the help command if the tool does not have a manual 
```
histat2 --help
```
read more
```
more SGD_features.README
```
### How do I open a stream from data?
The cat command concatenates one or more files and starts producing them.
```
cat SGD_features.tab
```
#How many lines does the file have?
We can pipe the output into another program rather than the screen. Use the pipe | character to connect the programs. For example, the wc program is the word counter.
```
cat SGD_features.tab | wc
cat SGD_features.tab | wc -l
```
### How does the file start?

```
cat SGD_features.tab | head
```
### Which lines match a specific pattern?
For example, we wanted to find information on gene YAL060W
```
cat SGD_features.tab | grep YAL060W
```
### How do I store the results in a new file?
```
cat SGD_features.tab | grep YAL060W > match.tab

#How many lines in the file match the word gene?
cat SGD_features.tab | grep gene | wc -l
```
### How can we tell how many lines DO NOT match a given pattern?
Adding the -v flag to grep reverses the action of grep it shows the lines that do not match.
```
cat SGD_features.tab | -v Dubious | wc -l
```
### How do I select genes?
It looks like this file uses the feature type (column 2) ORF for protein-coding genes. We will need to cut the second field (by tabs).
```
cat SGD_features.tab | head
cat SGD_features.tab | cut -f 2 | grep ORF | head
```
### Can I select multiple columns?
```
cat SGD_features.tab | cut -f 2,3,4 | grep ORF | head
cat SGD_features.tab | cut -f 2,3,4 | grep ORF | grep -v Dubious | wc -l
```
### How many feature types are in this data?
We are going to use this data a lot, so place it into a separate file for now.
```
cat SGD_features.tab | cut -f 2 > types.txt

# Sorting places identical consecutive entries next to one another.
cat type.txt | sort | head

#Find unique words. The uniq command collapses consecutive identical words into one.
cat type.txt | sort | uniq -c | head

#To find out the most frequent unique elements, we need to sort the output of uniq.
cat types.txt | sort | uniq -c | sort -rn | head
```
### The sort-uniq-count tool
conda install entrez-direct
```
# Improved pattern.
cat types.txt | sort-uniq-count-rank | head
```
[Unix Tutorial 2](https://github.com/sekhwal/RNASeq-workflow)

##### Referred from
This tutorial is referred from [Biostar](https://www.biostarhandbook.com/)

