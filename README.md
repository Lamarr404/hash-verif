## The purpose of this script is to compare the md5 hash of an iso image with its official hash to verify its integration:

### Input :

```bash
sudo ./iso.sh Parrot-security-5.0.1_amd64.iso 74ca72645896f83a65acd35ade46b0e0
```
```
We put the name of the iso file in the first parameter
And the hash available on the official site of the image in question

```
### Output :

```
The equal return script if the official hash is identical to the md5 signature of the iso
And not equal if the iso and hash don’t match.
```

### Code source avec explication :

```bash
#!/bin/bash

name=$1         # I declare my variable $name with the entry of the first parameter
find_name=$(find /* -name $name -type f 2>/dev/null | grep -o '[^/]*$') # I run the find command with my $name variable as a name then I use the grep -o command to return only the last search field without the root this command is stored in $find_name 
md5=$(md5sum $find_name | cut -d " " -f 1)              # In $md5 I store the command that gives me the hash of my iso, I use cut to keep only the hash
hash=$2         # In my $hash variable I store the second parameter indicated when executing the script: the official hash

if [[ "$md5" == "$hash" ]]; then        # I create an if condition to test the similarities of the two hash
        echo "equal"
else
        echo "not equal"
fi
```