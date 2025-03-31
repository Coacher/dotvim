cp /usr/share/hunspell/en_GB.* /usr/share/hunspell/en_US* .
>en.words
unmunch en_US.dic en_US.aff | iconv -f UTF-8 -t UTF-8 >> en.words
unmunch en_GB.dic en_GB.aff | iconv -f ISO8859-1 -t UTF-8 >> en.words
sort --unique --output=en.words en.words
rm *.dic *.aff

cp /usr/share/hunspell/ru_RU.* .
>ru.words
unmunch ru_RU.dic ru_RU.aff | iconv -f KOI8-R -t UTF-8 >> ru.words
sort --unique --output=ru.words ru.words
rm *.dic *.aff

vim -c ':mkspell en en.words'
vim -c ':mkspell ru ru.words'
