extract () {
  # Extract any provided archive
  # https://gist.github.com/Jaxmetalmax/f0ec6d2f86474d8d319b
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) rar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function _get_computer_id {
  # Hash the computer mac address to determine a unique id.
  # https://unix.stackexchange.com/questions/144812/generate-consistent-machine-unique-id
  echo $(
    ip a |
    sed '\|^ *link[^ ]* |!d;s|||;s| .*||' |  # extract mac addresses
    sha256sum |  # hash the results
    awk '{print $1}'  # remove trailing dashe introduced by sha256sum
  )
}

function _change_background {
  pic_dir="/home/rll/Pictures"
  echo "Scanning $pic_dir"
  pic_file=$(find $pic_dir | grep jpg | shuf -n1)
  echo "Changing background to $pic_file"
  #gconftool-2 --type string --set /desktop/gnome/background/picture_filename "${pic_file}"  
  gsettings set org.gnome.desktop.background picture-uri $pic_file
}

function _does_command_exist {
  # Test for a given command. Return 1 if the command exist on the system, 0 otherwise.
  type $1 > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    return 0
  else
    return 1
  fi
}