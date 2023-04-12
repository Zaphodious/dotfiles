#!/usr/bin/env bash


function setup-parse-args {
    # Get flags
    while getopts b: flag 
    do 
        case "${flag}" in 
        b) popshop_is_borked=true;;
    esac
    done
}

function setup-os-vars {
    OS="$(uname -s)"
    ARCH="$(uname -m)"
    KERN="$(uname -r)"
    IS_WSL=false

    case $OS in 
        Darwin) OS='macos';;
        Linux) OS='linux';;
        CYGWIN*) OS='windows';;
        MINGW*) OS='windows';;
    esac

    case $ARCH in
        arm64*) ARCH='aarch64';;
        x86_64*) ARCH='x86_64';;
    esac

    case $KERN in 
        microsoft*) IS_WSL=true;;
        Microsoft*) IS_WSL=true;;
    esac
}


function needs-installing {
    # Runs the command, which is good enough for 
    # 'if' to switch on its success code (flipped with '!')
    ! which "$1" &> /dev/null
}

function is-installed {
    which "$1" &> /dev/null
}

function _cmd-arts-installed {
    COMMAND=$1
    PACKAGE=$2
    if [ -z "$PACKAGE" ]
    then
        PACKAGE=$COMMAND
    fi
    needs-installing $COMMAND

}

function if-needs-nix {
    if _cmd-arts-installed $1 $2
    then
        echo -e "\e[40m\e[35mCommand '$COMMAND' not detected. Installing with nix\e[0m"
        nix-env --install $PACKAGE
    fi
}

function if-needs-cargo {
    if _cmd-arts-installed $1 $2
    then
        echo -e "\e[40m\e[31mCommand '$COMMAND' not detected. Installing with cargo\e[0m"
        cargo install $PACKAGE
    fi
}


function install-zig {
    if [ "$ARCH" = "" ]
    then
        setup-os-vars
    fi
    zig_json_path=".master[\"${ARCH}-${OS}\"].tarball"
    mkdir -p ~/bin
    rm -rf ./zigtmp
    mkdir -p ./zigtmp/bin
    # curl $tarball_url -o ./zigtmp/zig.tar.xz
    if curl "https://ziglang.org/download/index.json" | jq -r ".master[\"$ARCH-$OS\"].tarball" | xargs curl -o "./zigtmp/zig.tar.xz" 
    then
        tar -xf ./zigtmp/zig.tar.xz -C ./zigtmp/bin/
        d=$(cd zigtmp/bin;echo *)
        mv "./zigtmp/bin/$d" ./zigtmp/bin/zigfiles
    fi
    
}

