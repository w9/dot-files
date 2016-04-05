function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
	set -l realhome ~
  
  echo $PWD | sed -e "s|^$realhome|~|" -e 's-\([^/.]\)[^/]*/-\1/-g'
end
