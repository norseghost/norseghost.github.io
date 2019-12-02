# rebuild CV and add it to /assets/pdf
# TODO: Some information is in _config.yml
#       Should probably trigger a build as well
#       Or, move author data out of _config.yml
LANGS='da en'

    for LANG in $LANGS
    do
        pandoc _config.yml _data/cv_${LANG}.yml _data/cv.yml \
        --template=_data/cv.tex \
        --pdf-engine=xelatex \
        -o assets/pdf/cv_${LANG}.pdf
        git add assets/pdf/cv_${LANG}.pdf
    done
