function detect_package_manager --description "Detect the appropriate package manager to use."
    set distro (detect_distro)
    switch $distro
        case 'arch'
            if type -q 'yay'
                set manager "yay"
                set do_sudo false
            else
                set managers 'pacman'
                set do_sudo true
            end

        case 'ubuntu'
            set managers 'apt'
            set do_sudo true

        case 'raspbian'
            set managers 'apt'
            set do_sudo true

        case 'centos'
            set managers 'yum' 'dnf'
            set do_sudo true

        case '*'
            echo "Unknown distro '$distro'. Package manager unset." 1>&2
            return 1
    end

    for m in $managers
        if type -q $m
            set $manager $m
            break
        end
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
