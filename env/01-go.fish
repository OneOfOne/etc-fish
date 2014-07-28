set -gx GOROOT "/usr/src/go-release"
set -gx PATH $PATH "$GOROOT/bin"


if test -d "$HOME/code/go"
	set -xg GOPATH "$HOME/code/go"
	set -xg PATH $PATH "$GOPATH/bin" 
end

function rebuild-go
	if not test -O $GOROOT
		echo "you don't own $GOROOT"
		return 1
	end
	pushd $GOROOT/src
	hg pull -uv ; or return 1
	rm -rf ../pkg ../bin

	#sudo systemctl stop iptables
	env CC=clang CXX=clang++ CGO_ENABLED=1 ./all.bash
	#sudo systemctl start iptables

	env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 ./make.bash
	env GOOS=windows GOARCH=386 CGO_ENABLED=1 ./make.bash
	popd
end

function go-win64 
	env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ CGO_LDFLAGS="-lssp" go $argv
end

function go-win32
	env GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc CXX=i686-w64-mingw32-g++ CGO_LDFLAGS="-lssp" go $argv
end