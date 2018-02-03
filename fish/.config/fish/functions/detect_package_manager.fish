function detect_package_manager --description "Detect the appropriate package manager to use."
    switch (detect_distro)
        case 'arch'
            if type -q 'pacaur'
                set manager "pacaur"
                set do_sudo false
            else
                set manager "pacman"
                set do_sudo true
            end

        case 'ubuntu'
            set manager "apt"
            set do_sudo true

        case 'raspbian'
            set manager "apt"
            set do_sudo true

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
