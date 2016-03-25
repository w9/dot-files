function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
	set -l realhome ~
  
  if [ $prompt_full_path = 1 ]
    echo $PWD | sed -e "s|^$realhome|~|"
  else
    echo $PWD | sed -e "s|^$realhome|~|" -e 's-\([^/.]\)[^/]*/-\1/-g'
  end
end
