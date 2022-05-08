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
