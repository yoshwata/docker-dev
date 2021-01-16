# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bashrc,bash_prompt,exports,aliases,functions,gitconfig.sh,extra}; do
    echo "load $file"
	# [ -r "$file" ] && [ -f "$file" ] && source "$file";
	if [ -r "$file" ] && [ -f "$file" ]; then
        source "$file";
    else
        echo "$file does not exist"
    fi
done;
unset file;
export GOENV_ROOT="$HOME/.anyenv/envs/goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

eval "$(goenv init -)"
