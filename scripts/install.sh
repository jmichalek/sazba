#! /bin/bash
# Instaluje potřební balíky do domovské složky soubor makelatex

sudo apt-get install pandoc texlive-xetex texlive-lang-czechslovak texlive-latex-base texlive-bibtex-extra open-jdk-7-jre

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

mkdir -p ~/bin
ln -s $DIR/makelatex ~/bin/makelatex
ln -s $DIR/makedopis ~/bin/makedopis

