#!/bin/bash

if ([ -z "$1" ] || [ -z "$2" ] ||  [ -z "$3" ]) && [ "$2" != "SHOW" ]; then
  printf "Error.\n=-\n"
  echo '1) Example for run converting:'
  echo './convert.sh bd_name.sql utf8mb4_unicode_ci utf8mb4'
  echo ' - First  PARAM: Name BD'
  echo ' - Second PARAM: COLLATE for set in BD'
  echo ' - Third  PARAM: CHARSET for set in BD'
  printf "\n"
  echo '2) Example for show COLLATE and CHARSET:'
  echo './convert.sh bd_name.sql SHOW'
  echo ' - First  PARAM: Name BD'
  echo ' - Second PARAM: Show'
  printf "=-\nDone.\n"
  exit 1
fi


BD=$1
COLLATE=$2
CHARSET=$3
CHARACTER=$CHARSET

FIELDS='(COLLATE|CHARSET|CHARACTER SET|SET NAMES)'


if [ "$2" == "SHOW" ]; then
  cat $BD | grep -Po "${FIELDS}(\s|=)[A-Za-z0-9-_]*" | sort | uniq | while IFS= read -r name; do echo $name; done
elif [ -f "$BD" ]; then
  printf "BD '$BD' founded. Start converting proccess..\n=-\n"

  cat $BD | grep -Po "${FIELDS}(\s|=)[A-Za-z0-9-_]*($| |;|,|\t)" | sort | uniq | while IFS= read -r name; do
    s1=$(echo $name | grep -oP "${FIELDS}(\s|=)")
    s2=${name#"$s1"}
    if [[ $name =~ ( |;|,|\t)$ ]]; then
      e1=""; e2="${s2: -1}"
    else
      e1="$"; e2=""
    fi
    if [[ $s1 =~ (CHARSET|CHARACTER|NAMES) ]]; then 
      echo "YOU CAN USE: /${name}${e1}/ s//${s1}${CHARACTER}${e2}/g"
      sed -i "/${name}${e1}/ s//${s1}${CHARACTER}${e2}/g" $BD
    elif [[ $s1 =~ COLLATE ]]; then
      echo "YOU CAN USE: /${name}${e1}/ s//${s1}${COLLATE}${e2}/g"
      sed -i "/${name}${e1}/ s//${s1}${COLLATE}${e2}/g" $BD
    fi
  done
  printf "=-\nDone converting proccess.\n"
else
  echo "BD $BD not found or some went wrong"
fi

