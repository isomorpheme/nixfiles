function detect_distro --description "Get the distro ID from /etc/os-release."
    set release_file "/etc/os-release"
    if not test -e $release_file
        return 1
    end

    set distro_id (grep 'ID=.*' $release_file | sed 's/ID=//')

    if test -z $distro_id
        return 1
    end

    echo $distro_id
end

