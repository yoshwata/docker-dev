# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

# enable to share settings/ dir to your local PC
# setting_root="/Users/yoshwata/git/githubcom/yoshwata/docker-dev/settings/"

for file in ${setting_root}.{path,bashrc,bash_prompt,exports,aliases,functions,gitconfig.sh,extra}; do
    echo "load $file"
	# [ -r "$file" ] && [ -f "$file" ] && source "$file";
	if [ -r "$file" ] && [ -f "$file" ]; then
        source "$file";
    else
        echo "$file does not exist"
    fi
done;
unset file;
