function add_node_path -d "Add the local node bin to path."
  set -l node_modules_path "$PWD/node_modules/.bin"
  if test -e "$node_modules_path"
    echo "Added $node_modules_path to path."
    set -x PATH $node_modules_path $PATH
  else
    echo "$node_modules_path not found!"
  end
end

