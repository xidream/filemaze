default_depth=16

if [ -z $1 ]
then
    echo "missing command"
    exit 1
fi

case $1 in
    init)
        shift
        while [[ $# -gt 0 ]]; do
            case $1 in
                -d|--depth)
                    if [[ ! $(($2)) -gt 0 ]]
                    then
                        echo "invalid depth: $2"
                        exit 1
                    fi
                    depth=$2
                    shift
                    shift
                    ;;
                *)
                    echo "unknown option: $1"
                    exit 1
                    ;;
            esac
        done
 
        if [ -z $depth ]
        then
            read -p "enter depth [$default_depth]:" depth
            depth=${depth:-$default_depth}
        fi

        ;;
    *)
        echo "unknown command: $1"
        exit 1
        ;;
esac


echo "depth: $depth"