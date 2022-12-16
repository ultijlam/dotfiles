# spaceship-lite-user.sh

spaceship_lite_prompt_user() {
	if [ -n "${BASH_VERSION}" ]; then
		: ${sslpu_user:='\u'}
	elif [ -n "${KSH_VERSION}${ZSH_VERSION}" ]; then
		: ${sslpu_user:='${USER}'}
	fi
	: ${sslpu_user:=${USER}}

	# Add the user if this is not localhost.
	sslpu_prompt=
	if [ -n "${SSH_CONNECTION}" ]; then
		case ${USER} in
		root)
			sslpu_prompt="${sslpu_prompt} ${SS_ESC_RED}${sslpu_user}${SS_ESC_END}"
			;;
		*)
			sslpu_prompt="${sslpu_prompt} ${SS_ESC_YELLOW}${sslpu_user}${SS_ESC_END}"
			;;
		esac
		sslpu_prompt="${sslpu_prompt} ${SS_ESC_WHITE}in${SS_ESC_END}"
	fi
	echo "${sslpu_prompt}"
	unset sslpu_user sslpu_prompt
}

SPACESHIP_LITE_PROMPT_USER=$(spaceship_lite_prompt_user)