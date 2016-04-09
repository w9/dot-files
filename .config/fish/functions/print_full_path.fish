function print_full_path
	set -l realhome ~

  echo
  echo $PWD | sed -e "s|^$realhome|~|"
  echo $PWD
  commandline -f repaint
end
