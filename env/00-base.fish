set -gx PATH "/usr/bin" "/usr/local/bin" $PATH 
set -gx PATH "$HOME/bin" $PATH

if set -q DISPLAY 
	set -gx EDITOR "subl3 -n -w"
else
	set -gx EDITOR vim
end

alias rm "rm -i"
alias mv "mv -i"
alias cp "cp --reflink=auto --sparse=always -i"
alias rscp "rsync -avzP"

alias mount-ro "mount -o ro,remount"
alias mount-rw "mount -o rw,remount"


set -gx LESSOPEN "|/usr/bin/lesspipe.sh %s"
set -gx LESS_ADVANCED_PREPROCESSOR 1
alias less "less -R"

alias monitor-off "xset dpms force off"

set -gx WINEDEBUG "-all"
set -gx WINEARCH "win32"
alias killwine "wineserver -k; killall -9 wine wineserver"

set -gx MOZ_PLUGIN_PATH "/usr/lib/mozilla/plugins"

set -gx LD ld.gold

function say
	echo $argv | espeak --stdin -v+f6
end

function pss
	ps -Ao pid:5,user:10,state:1,cmd | grep --color=always $argv | grep -v grep
end
