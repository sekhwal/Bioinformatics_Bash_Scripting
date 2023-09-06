### How do I uncompress a tar.gz archive?

```
tar xzfv archive.tar.gz
```
### How do I compress or uncompress a file?
```
#example
# Get a sequence file.
efetch -db nuccore -format fasta -id AF086833 > AF086833.fa

# Compress with gzip.
# Creates the file AF086833.fa.gz.
gzip AF086833.fa

# Some tools can operate on GZ files without unpacking them. 
# Use zcat on Linux
# zcat AF086833.fa.gz  | head

# Uncompress the file. Creates  AF086833.fa.
gunzip AF086833.fa.gz
```
### How do I compress or uncompress multiple files?
```
#Example
# Get two files
efetch -db nuccore -format fasta -id AF086833 > AF086833.fa
efetch -db nuccore -format gb -id AF086833 > AF086833.gb

Thus if we want to create c, a compressed z, file f, in verbose v mode and name the archive sequences.tar.gz we would use the following construct:

tar czfv sequences.tar.gz AF086833.fa AF086833.gb

tar czvf sequences.tar.gz AF086833.*
```
### compress that entire directory
```
mkdir sequences
mv AF086833.* sequences/
tar czvf sequences.tar.gz sequences/*
```

