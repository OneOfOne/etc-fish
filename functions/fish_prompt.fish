set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

alias resource "set -e __fish_sourced_env"

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	if not set -q __fish_sourced_env
		for fsh in (ls /etc/fish/env/*.fish)
			source $fsh
		end
		for fsh in (ls $HOME/.config/fish/env/*.fish ^ /dev/null) #it doesn't matter if it doesn't exist
			source $fsh
		end
		set -g __fish_sourced_env 1
	end

	tty | grep -q tty; and set tty tty; or set tty pts

	# PWD
	set_color white
	if [ $tty = tty ]
		echo -n "|- "
	else
		echo -n "┌─ "
	end
	
	if [ $USER = root ]
		set_color red
	else
		set_color yellow
	end
	printf '%s' (whoami)
	
	set_color white
	printf '@'

	set_color blue
	printf '%s ' (hostname|cut -d . -f 1)
	
	set_color white
	echo -n '['

	set_color $fish_color_cwd
	echo -n (prompt_pwd)

	set_color white
	echo -n ']'
	echo (__fish_git_prompt)

	for job in (jobs)
		set_color white
		if [ $tty = tty ]
			echo -n '; '
		else
			echo -n '│ '
		end
		set_color brown
		echo $job
	end

	set_color white
	if [ $tty = tty ]
		echo -n "|--"
	else
		echo -n "└──"
	end

	if not test $last_status -eq 0
		set_color $fish_color_error
	else
		set_color white
	end

	if [ $tty = tty ]
		echo -n "> "
	else
		echo -n '➜ '
	end

	set_color normal
end
