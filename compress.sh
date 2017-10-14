#!/bin/bash

_DIR_=${2}
_FILE_=${1}

if [[ $# != 2 ]]; then
    echo "usage: compress <tar_filename> <dir_to_compress>"
    exit 1
fi

tar cvf ~/${_FILE_}-$(date +%Y%m%d).tar --files-from /dev/null

find ${_DIR_}/ -type f| while read _file_; do
    tar --remove-files -czvf  ${_file_}.tar.gz ${_file_}
    tar rvf ~/${_FILE_}-$(date +%Y%m%d).tar ${_file_}.tar.gz &&  rm ${_file_}.tar.gz
done
