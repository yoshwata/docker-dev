# https://gist.github.com/johnpolacek/69604a1f6861129ef088
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.st "status"
git config --global alias.ls "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
git config --global alias.ll "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --numstat"
git config --global alias.tr "log --all --graph --decorate=short --color --format=format:'%C(bold blue)%h%C(reset) %C(auto)%d%C(reset)         %C(blink yellow)[%cr]%C(reset)  %x09%C(white)%an: %s %C(reset)'"

# I can't mount like these format because the device becomes busy
# [alias]
#     co = checkout
#     br = branch
#     st = status
#     ls = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate
#     ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat
#     tr = log --all --graph --decorate=short --color --format=format:'%C(bold blue)%h%C(reset) %C(auto)%d%C(reset)\n         %C(blink yellow)[%cr]%C(reset)  %x09%C(white)%an: %s %C(reset)'
