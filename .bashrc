# .bash_profile

alias climate="cd /prod/www/template/manmade/Pages/Climate"
alias graphics="cd /mnt/s3/prod/www/apache/htdocs/data/climate_images"
alias b="cd /netapp1/prod/www/apache/htdocs/hurricane/2014"
alias blog="vim /prod/www/template/manmade/Pages/Resources/blog_archive/jeffmastersblog.cst"
alias tropics="vim /prod/www/template/manmade/Parts/TropicExtLinks.cst"
alias tropics2="vim /prod/www/template/manmade/Parts/TropicHurrArchive.cst"
alias ll="ls -lat | more"
alias cda="cd /software/dist/admin/AS5000"
alias cdc="cd /code/www/findweather/hdf"
alias cdh="cd /prod/www/apache/htdocs"
alias sassy="cd /prod/www/apache/htdocs/scss"
alias cdt="cd /prod/www/template/manmade"
alias cdb="cd /prod/www/template/omnibus"
alias news="cd /mnt/s3/news"
alias cdwm="cd /prod/www/apache/htdocs/scripts/wundermap/src/dev/"
alias cdpd="cd /prod/www/template/manmade/Pages/WeatherStation/Dashboard"
alias cdbrands="cd /software/dist/newspaper/newspaper/brands"
alias cdpapers="cd /software/dist/newspaper/newspaper/papers"
alias cdscrapers="cd /prod/www/apache/htdocs/autoasp/scrapers"
alias cdmachines="cd /software/dist/types"

# Source global definitions
if [ -f /etc/bashrc ]; then
		. /etc/bashrc
fi

export WUI_BUILD_ROOT=/code

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH


#Make git log awesome
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

function __set_ps1 {
     L2='${CYN}\w${NRM}\n'
     # Only output L2 if directory is not ~ or /
     DIR=${PWD}
     if [ "${DIR}" == "${HOME}" ] || [ "${DIR}" == "/" ]
     then
          L2=''
     fi
     # Set final PS1
     PS1='\n'$L1$L2$L3
}

if [[ $- == *i* ]]
then
     export TZ="/usr/share/zoneinfo/US/Pacific"
     # Format Specifications
     NRM=`tput sgr0`
     BLD=`tput bold`
     ITL=`tput sitm`
     UL=`tput smul`
     RED=`tput setaf 1`
     GRN=`tput setaf 2`
     YLW=`tput setaf 3`
     BLU=`tput setaf 4`
     CYN=`tput setaf 6`
     WHT=`tput setaf 7`
     GRY=`tput setaf 8`
     # Prompt Assembly
     TITLE='${BLD}\u${NRM}|${UL}\h${NRM}'
     DIR='[${BLD}${YLW}\W${NRM}]'
     TIME='\@'
     L1=$TITLE' '$DIR' '$TIME'\n'
     L3='>> '
     PROMPT_COMMAND='__set_ps1' 
fi

export PATH=/opt/centos/devtoolset-1.1/root/usr/bin/:$PATH
#export PYTHONPATH=$HOME/toolkits/com.ibm.streamsx.topology/opt/python/packages:$PYTHONPATH
# Set up streams
export STREAMS_INSTALL=/efs/prod/tmp/chris/opt/ibm/InfoSphere_Streams/4.2.0.0
export PYTHONPATH=$STREAMS_INSTALL/toolkits/com.ibm.streamsx.topology/opt/python/packages
source /efs/prod/tmp/chris/opt/ibm/InfoSphere_Streams/4.2.0.0/bin/streamsprofile.sh
export GOPATH=/code/go
export PATH=$PATH:$GOPATH/bin

alias st=streamtool

cd /code/ingest/WXSTN/quality_control/streams
