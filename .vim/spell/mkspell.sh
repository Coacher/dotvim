#!/bin/bash

shopt -s nullglob

cp /usr/share/hunspell/en_{GB,US}.* .
>en.words
unmunch en_GB.dic en_GB.aff | iconv -f $(uchardet en_GB.aff) -t UTF-8 >> en.words
unmunch en_US.dic en_US.aff | iconv -f $(uchardet en_US.aff) -t UTF-8 >> en.words
sort --stable --unique --output=en.words en.words
rm *.dic *.aff

cp /usr/share/hunspell/ru_RU.* .
>ru.words
unmunch ru_RU.dic ru_RU.aff | iconv -f $(uchardet ru_RU.aff) -t UTF-8 >> ru.words
sort --stable --unique --output=ru.words ru.words
rm *.dic *.aff

vim -N -u NONE -c 'set encoding=utf-8 | mkspell! en en.words | quit'
vim -N -u NONE -c 'set encoding=utf-8 | mkspell! ru ru.words | quit'
