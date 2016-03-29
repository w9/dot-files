function sudo_last_cmd -d 'Run current command line as root'
  set cursor_pos (echo (commandline -C) + 5 | bc)
  commandline -C 0
  commandline -i "sudo $history[1]"
end
