# /etc/fish

Some of the configuration files I use with my [Fish Shell](http://fishshell.com/), Golang aliases, Java / Perl pathes, etc.

### Notes

- I have my golang installed under `/usr/src/go-release`, you can change that in `/etc/fish/env/go.fish`
- The Android/Java/Perl pathes are a translated version of the bash ones that come by default in Arch Linux.
- All files in `/etc/fish/env` and `$HOME/.config/fish/env` are sourced once, to resource them just type `resource` or restart the shell.
- the `resource` alias is defined in `/etc/fish/functions/fish_prompt.fish`.

# License

All the scripts here are licensed under the [MIT license](http://opensource.org/licenses/mit-license.php).
