set -x PATH $PATH "/usr/local/bin"
set -x PATH "$HOME/bin" $PATH

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


set -x LESSOPEN "|/usr/bin/lesspipe.sh %s"
set -x LESS_ADVANCED_PREPROCESSOR 1
alias less "less -R"

alias monitor-off "xset dpms force off"

set -x WINEDEBUG "-all"
set -x WINEARCH "win32"
alias killwine "wineserver -k; killall -9 wine wineserver"

set -x MOZ_PLUGIN_PATH "/usr/lib/mozilla/plugins"

function say
	echo $argv | espeak --stdin -v+f6
end