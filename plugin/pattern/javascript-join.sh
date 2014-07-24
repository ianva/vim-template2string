str=`cat $1`
str=${str//}
str=${str%%}

echo "$str" | sed "{

    s/'/\\\'/g
    /^[[:blank:]]*$/b
    s/^[[:blank:]]*/&'/
    s/[[:blank:]]*$/&',/

}
\${
    s/,\s*$/].join('')/
}" | sed "1{
    s/^\(.*\)/[\1/
}"
