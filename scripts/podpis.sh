#!/bin/bash
#
# Authors:
# - Jakub Michálek
# - Ondřej Profant
#

# Global variables
userName="";
userPasswd="";
installDir="/opt/";
settingsDir="/home/$userName/.sign/";
fileName="";
configFile="";
dirName="jsignpdf";
pdfsign="${installDir}${dirName}/JSignPdf.jar";

###############################
# Download and install jPdfSign
# Param: none
###############################
function installPdfSign() {

  # Variables

  jpdfsignUrl="http://sourceforge.net/projects/jsignpdf/files/latest/download?source=files";

  # Get data

  echo "jPdfSign se nyní stáhne, tato operace může trvat několik minut.";
  wget -O pdfsign.zip "$jpdfsignUrl"
  unzip -q -o pdfsign.zip
  rm -f pdfsign.zip

  # Install

  mv jsignpdf-1.6.* "$dirName"
  sudo rm -rf "${installDir}${dirName}/"
  sudo mv -t "$installDir" "$dirName"
  
  # Copy script to user directory

  sudo cp -t $installDir $0;
  mkdir -p $HOME/bin;
  ln -s $installDir/$0 $HOME/bin/sign;
  echo "Nainstalováno. Spouštějte příkazem sign -u jmeno.";
  echo "Zdrojový soubor nastaveni.ini vložte do složky ~/.sign/jmeno/";
}

###############################
# Ask user about password
# Fill $userPasswd variable
# Param: none
###############################
function askToPasswd() {
  echo "Elektronický podpis dokumentu uživatele $userName";
  echo "Zadejte heslo a stiskněte tlačítko Enter";
  read -s -p "Heslo: " userPasswd;
  echo "INFO Podpis zadán. Předávám ke zpracování";
}

###############################
# Show help for this script
# Param: none
###############################
function help() {
  echo    "$0 je skript pro práci s elektronickým podpisem.";
  echo    "Použití: ";
  echo -e "\tinstall\tnainstaluje jPdfSign (do $installDir) a ukončí činnost.";
  echo -e "\thelp\tzobrazí tuto nápovědu a ukončí činnost.";
  echo -e "\t-u <username>"
}

###############################
# Sign $fileName or all pdfs
# Param: none
###############################
function sign() {
  askToPasswd ;

  settings="$settingsDir/nastaveni.ini";

  if [ -f $settings ]; then :
  else
    echo "Neexistuje adresář s nastavením.";
    exit 1;
  fi;

  if [[ -z "$fileName" ]]; then
    java -jar $pdfsign -lpf "$settings" -ksp $userPasswd "*.pdf";
  else
    java -jar $pdfsign -lpf "$settings" -ksp $userPasswd "$fileName";
  fi;
}

###############################
# Parsing of cmd arguments
# Param: all
###############################
function parseArgs() {
  while [ $# -gt 0 ]; do
    case $1 in
      install | -i | --install )
        installPdfSign;
        exit 0;
      ;;
      help | -h | --help )
        help;
        exit 0;
      ;;
      -u | --user )
        userName="$2";
        shift 2;
        settingsDir="$HOME/.sign/$userName";
      ;;
      -c | --config )
        configFile="$2";
        shift 2;
      ;;
      * )
        fileName="$1";
        shift 1;
      ;;
    esac;
  done;
  if [[ -z $userName ]]; then
  echo "Chybí uživatelské jméno"
  exit 0;
  fi;
}

parseArgs $@;
echo "parsování dokončeno"
echo "u: $userName c: $configFile f: $fileName"

sign
