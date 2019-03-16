bashrc_env="$HOME/.bashrc_env"

if [ -e $bashrc_env ]; then
  echo "file $bashrc_env already exists."
else
  touch $bashrc_env
fi

