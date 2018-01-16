function detect_package_manager --description "Detect the appropriate package manager to use."
    switch (detect_distro)
        case 'arch'
            if type -q pacaur
                set -l manager "pacaur"
                set -l do_sudo false
            else
                set -l manager "pacman"
                set -l do_sudo true
            end
        case 'ubuntu'
            set -l manager "apt"
            set -l do_sudo true
        case '*'
            echo "Unknown distro! Package manager unset." 1>&2
            return 1
    end

    if not type -q $manager
        echo "\"$manager\" does not seem to be available." 1>&2
        return 1
    end

    if eval $do_sudo
        echo "sudo $manager"
    else
        echo $manager
    end
end
