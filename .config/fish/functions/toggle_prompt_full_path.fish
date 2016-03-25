function toggle_prompt_full_path
  if [ $prompt_full_path = '1' ]
    set -g prompt_full_path '0'
  else
    set -g prompt_full_path '1'
  end
  commandline -f repaint
end

