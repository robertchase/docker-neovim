NAME=neovim
OPT=
WORKING=

for i in "$@"
do
    case $i in
		-h|--help)
		    echo "open neovim in docker"
			echo '  ${GIT:-$HOME/git} mounted as /opt/git'
			echo ""
		    echo "  -w=<dir> --working=<dir> set working directory"
		    echo "  -o=<dir> --opt=<dir> add docker parameters"
			echo ""
		    echo "  <name> use /opt/git/<name> as working directory"
		    echo "  . use /opt/git/<basename pwd> as working directory"
			exit 0
		;;
        -w=*|--working=*)
            WORKING="-w ${i#*=}"
        ;;
        -o=*|--opt=*)
            OPT="$OPT ${i#*=}"
        ;;
        -*)
            echo "unexpected option: $i"
            exit 1
        ;;
        .)
            WORKING="-w /opt/git/$(basename $LAUNCH_DIR)"
        ;;
        *)
            WORKING="-w /opt/git/$i"
        ;;
    esac
done

running=$(docker ps --filter name=$NAME --format '{{.ID}}')
if [ -z "$running" ]
then
    WORKING="$WORKING" OPT="$OPT" make
else
    WORKING="$WORKING" OPT="$OPT" make connect
fi
