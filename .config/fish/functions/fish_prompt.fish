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

  set_color normal
end

## Function to show current status
function show_status -d "Function to show the current status"
  set -l disk_usage (command df -P $PWD | awk 'END {print $5} {sub(/%/,"")}')
  if [ $disk_usage -gt 90 ]
    prompt_segment red black "$disk_usage%"
    prompt_segment normal normal " "
  end

  if [ ! -z "$STY" ]
    prompt_segment green black "SCR"
    prompt_segment normal normal " "
  end

  if [ $RETVAL -ne 0 ]
    prompt_segment red black "X"
    prompt_segment normal normal " "
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
  set -l host (hostname -s)
  set -l who (whoami)
  prompt_segment normal yellow "$who"

  prompt_segment normal white "@"
  if [ -n "$SSH_CLIENT" ]
    prompt_segment normal blue "$host "
  else
    prompt_segment normal green "$host "
  end
end


# Show directory
function show_pwd -d "Show the current directory"
  set -l pwd (prompt_pwd)

  if [ ! -s $PWD ]
    set_color -u
  end

  if [ ! -w $PWD ]
    prompt_segment bold red "$pwd "
  else
    prompt_segment bold blue "$pwd "
  end
end

# Show prompt w/ privilege cue
function show_prompt -d "Shows prompt with cue for current priv"
  set -l uid (id -u (whoami))

  if [ $uid -eq 0 ]
    set -g prompt_sign '#'
  else
    set -g prompt_sign '$'
  end

  if [ (jobs | wc -l) -gt '0' ]
    prompt_segment bold red "$prompt_sign "
  else
    prompt_segment normal white "$prompt_sign "
  end
end

## SHOW PROMPT
function fish_prompt
  set -g RETVAL $status
  show_status
  show_user
  show_pwd
  show_virtualenv
  show_prompt
end
