#!/bin/bash
CUE_FILE=''
FORMAT=''
OUT_PATH=""
USAGE="Usage: $0 [-c] cue_file [-o] output_directory [-f] file_format"

[ $# -eq 0 ] && echo $USAGE && exit 1

while [ -n "$1" ]; do
  case $1 in 
    -h|--help)
      echo $USAGE
      exit 0
      ;;
    -c)
      shift
      CUE_FILE=$1
      TRACK_COUNT=`tail -n 4 $CUE_FILE | head -n 1 | tr -s " " | cut -d " " -f3`
      shift
      ;;
    -f)
      shift
      FORMAT=$1
      echo $FORMAT
      shift
      ;;
    -o)
      shift 
      OUT_PATH=$1
      echo $OUT_PATH
      shift
      ;;
    *)
      FILE_NAME=$1
      shift
      ;;
  esac
done

[ -z "$FORMAT" ] && echo "please input the lossless file format. " && exit 1
[ -z "$CUE_FILE" ] && echo "please input the cue file." && exit 1
[ -z "$OUT_PATH" ] && OUT_PATH=.

for i in `seq $TRACK_COUNT`;
do
  xld -c $CUE_FILE -o $OUT_PATH -t $i -f $FORMAT $FILE_NAME
  echo $i
done
