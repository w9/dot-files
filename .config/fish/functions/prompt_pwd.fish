function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
	set -l realhome ~
  
  if not set -q prompt_full_path
    set -g prompt_full_path '0'
  end

  if [ $prompt_full_path = 1 ]
    echo $PWD | sed -e "s|^$realhome|~|"
  else
    echo $PWD | sed -e "s|^$realhome|~|" -e 's-\([^/.]\)[^/]*/-\1/-g'
  end
end
