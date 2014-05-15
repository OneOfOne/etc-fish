set -gx GOROOT "/usr/src/go-release"
set -gx PATH $PATH "$GOROOT/bin"


if test -d "$HOME/code/go"
	set -xg GOPATH "$HOME/code/go"
	set -xg PATH $PATH "$GOPATH/bin" 
end

function rebuild-go
	if not test -O $GOROOT
		echo "must be root"
		return 1
	end
	pushd $GOROOT/src
	hg pull; or return 1
	hg up; or return 1
	systemctl stop iptables
	env CC=clang CXX=clang++ ./all.bash
	env GOOS=windows GOARCH=amd64 CC=clang CXX=clang++ ./make.bash --no-clean
	env GOOS=windows GOARCH=386 CC=clang CXX=clang++ ./make.bash --no-clean
	systemctl start iptables
	popd
end

function go-win64 
	env GOOS=windows GOARCH=amd64 go
end

function go-win32
	env GOOS=windows GOARCH=386 go
end