#! /usr/bin/bash

### save IFS value
Field_Separator=$IFS

### prepare python environment
source ~/.virtualenvs/anonymizer/bin/activate


# CREATE LIST OF FOLDERS FROM INPUT PATH
### set IFS value to '\n' (replaces white spaces)
IFS=$'\n'
LIST1=$(ls -d "$@")
LIST2=($LIST1)

# echo "$LIST1"

### for each folder in given path
for ((i=0; i<${#LIST2[@]}; i++))
do
    printf '%s: %s\n' "$i" "${LIST2[$i]}"
    # FILEARR=($(ls "${LIST2[$i]}"))

    # ### for each file in folder
    # for ((j=0; j<${#FILEARR[@]};j ++))
    # do
    #     printf '   >>> %s: %s\n' "$i":"$j/${#FILEARR[@]}" "${FILEARR[$j]}"
    # done

    ### anonymize photos in current folder
    PYTHONPATH=$PYTHONPATH:. python anonymizer/bin/anonymize.py --input ${LIST2[$i]} --image-output ${LIST2[$i]} --weights '/mnt/Storage/CloudStorage/Dropbox/Photo_Library/LMI Cluj 2019/weights' --no-write-detections
done

### restore IFS value
IFS=$Field_Separator