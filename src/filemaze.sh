default_depth=30

if [ -z $1 ]
then
    echo "missing command"
fi

case $1 in
    init)
        if [ -z $2 ]
        then
            read -p "Enter depth [$default_depth]:" depth
            depth=${depth:-$default_depth}
        else
            depth=$2
        fi
        echo "depth: $((depth))"
        ;;
esac