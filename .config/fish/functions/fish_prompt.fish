## Function to show a segment
function prompt_segment -d "Function to show a segment"
  # Get colors
  set -l bg $argv[1]
  set -l fg $argv[2]

  if [ $argv[1] = bold ]
    set_color -o
  else
    set_color -b $bg
  end
  set_color $fg


  # Print text
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3]
  end
end

## Function to show current status
function show_status -d "Function to show the current status"
  if [ $RETVAL -ne 0 ]
    prompt_segment normal red "✖ "
  end

  if [ -n "$SSH_CLIENT" ]
    prompt_segment normal blue "⚍ "
  end

  set -l disk_usage (command df -P $PWD | awk 'END {print $5} {sub(/%/,"")}')
  if [ $disk_usage -gt 90 ]
    if [ $disk_usage -gt 95 ]
      prompt_segment normal red "⛁ "
    else
      prompt_segment normal yellow "⛃ "
    end
  end

  if [ ! -s $PWD ]
    prompt_segment normal yellow "⚙ "
  end

  if [ ! -z "$STY" ]
    prompt_segment normal green "⛶ "
  end
end

function show_virtualenv -d "Show active python virtual environments"
  if set -q VIRTUAL_ENV
    set -l venvname (basename "$VIRTUAL_ENV")
    prompt_segment normal white " ($venvname)"
  end
end

## Show user if not default
function show_user -d "Show user"
  if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
    set -l host (hostname -s)
    set -l who (whoami)
    prompt_segment normal yellow "$who"

    # Skip @ bit if hostname == username
    if [ "$USER" != "$HOST" ]
      prompt_segment normal white "@"
      prompt_segment normal green "$host "
    end
  end
end

# Show directory
function show_pwd -d "Show the current directory"
  set -l pwd (prompt_pwd)
  if [ ! -w $PWD ]
    prompt_segment bold red "$pwd "
  else
    prompt_segment bold blue "$pwd "
  end
end

function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
	set -l args_post
	set -l args_pre
	set -l realhome ~
	echo $PWD | sed -e "s|^$realhome|~|" $args_pre -e 's-\([^/.]\)[^/]*/-\1/-g' $args_post
end


# Show prompt w/ privilege cue
function show_prompt -d "Shows prompt with cue for current priv"
  set -l uid (id -u $USER)

  if [ $uid -eq 0 ]
    prompt_segment red white "! "
    set_color normal
    echo -n -s " "
  else
    if [ (jobs | wc -l) -gt '0' ]
      prompt_segment bold red "\$ "
    else
      prompt_segment normal white "\$ "
    end
  end

  set_color normal
end

## SHOW PROMPT
function fish_prompt
  set -g RETVAL $status
  show_user
  show_pwd
  show_virtualenv
  show_status
  show_prompt
end
