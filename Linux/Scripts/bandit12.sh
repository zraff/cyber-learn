#!/bin/bash

# copy file for backup and rename to hex
cp data.txt stage1.hex

# decode hex file into binary
xxd -r stage1.hex > stage2.bin
filename="stage2.bin"

# Loop until plain text / ASCII
while true; do
        filetype=$(file "$filename")
        echo "Processing: $filetype"

        if [[ $filetype == *"gzip compressed"* ]]; then
                mkdir tempdir
                mv "$filename" ./tempdir/temp.gz
                cd tempdir
                gunzip temp.gz
                rm temp.gz
                filename=$(ls)
                cd ..
                mv tempdir/$filename .
                rm -r tempdir
        elif [[ $filetype == *"bzip2 compressed"* ]]; then
                mkdir tempdir
                mv "$filename" ./tempdir/temp.bz2
                cd tempdir
                bunzip2 temp.bz2
                rm temp.bz2
                filename=$(ls)
                cd ..
                mv tempdir/$filename .
                rm -r tempdir
        elif [[ $filetype == *"POSIX tar archive"* ]]; then
                mkdir tempdir
                mv "$filename" tempdir
                cd tempdir
                tar -xf "$filename"
                rm "$filename"
                filename=$(ls)
                cd ..
                mv tempdir/$filename .
                rm -r tempdir
        elif [[ $filetype == *"ASCII text"* ]]; then
                echo "Found final file $filename"
                cat "$filename"
                break
        else
                echo " Unknown or unsupported file"
                break
        fi
done
