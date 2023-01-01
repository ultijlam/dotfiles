# shellcheck shell=sh
# steamship/delimiter.sh

steamship_delimiter_init() {
	STEAMSHIP_DELIMITER_SHOW='true'
	STEAMSHIP_DELIMITER_PREFIX=''
	STEAMSHIP_DELIMITER_SUFFIX=''
	STEAMSHIP_DELIMITER_SYMBOL='❯ '
	STEAMSHIP_DELIMITER_SYMBOL_ROOT=${STEAMSHIP_DELIMITER_SYMBOL}
	STEAMSHIP_DELIMITER_SYMBOL_SUCCESS=${STEAMSHIP_DELIMITER_SYMBOL}
	STEAMSHIP_DELIMITER_SYMBOL_FAILURE=${STEAMSHIP_DELIMITER_SYMBOL}
	STEAMSHIP_DELIMITER_COLOR_SUCCESS=${STEAMSHIP_COLOR_SUCCESS}
	STEAMSHIP_DELIMITER_COLOR_FAILURE=${STEAMSHIP_COLOR_FAILURE}
}

steamship_delimiter() {
	ssd_symbol=
	ssd_color=
	ssd_colorvar=
	if [ -z "${STEAMSHIP_RETVAL}" ]; then
		ssd_colorvar='STEAMSHIP_BASE_COLOR'
		ssd_symbol=${STEAMSHIP_DELIMITER_SYMBOL}
	elif [ "${STEAMSHIP_RETVAL}" = 0 ]; then
		ssd_colorvar="STEAMSHIP_${STEAMSHIP_DELIMITER_COLOR_SUCCESS}"
		ssd_symbol=${STEAMSHIP_DELIMITER_SYMBOL_SUCCESS}
	else
		ssd_colorvar="STEAMSHIP_${STEAMSHIP_DELIMITER_COLOR_FAILURE}"
		ssd_symbol=${STEAMSHIP_DELIMITER_SYMBOL_FAILURE}
	fi
	eval 'ssd_color=${'"${ssd_colorvar}"'}'

	if	[ -n "${STEAMSHIP_DEBUG}" ] ||
		steamship_user_is_root
	then
		ssd_symbol=${STEAMSHIP_DELIMITER_SYMBOL_ROOT}
	fi
	# ${ssd_symbol} is always set and non-null.

	ssd_status=
	if [ -n "${ssd_symbol}" ]; then
		ssd_status=${ssd_symbol}
	fi
	if [ -n "${ssd_status}" ]; then
		ssd_status="${ssd_color}${ssd_status}${STEAMSHIP_BASE_COLOR}"
		if [ "${1}" = '-p' ]; then
			ssd_status="${STEAMSHIP_DELIMITER_PREFIX}${ssd_status}"
		fi
		ssd_status="${ssd_status}${STEAMSHIP_DELIMITER_SUFFIX}"
	fi

	echo "${ssd_status}"
	unset ssd_symbol ssd_color ssd_colorvar ssd_status
}

steamship_delimiter_prompt() {
	[ "${STEAMSHIP_DELIMITER_SHOW}" = true ] || return

	# Prepend status to ${STEAMSHIP_PROMPT}.
	if [ "${STEAMSHIP_PROMPT_COMMAND_SUBST}" = true ]; then
		# shellcheck disable=SC2016
		STEAMSHIP_PROMPT='$(steamship_delimiter -p)'"${STEAMSHIP_PROMPT}"
	else
		STEAMSHIP_PROMPT="$(steamship_delimiter -p)${STEAMSHIP_PROMPT}"
	fi
}

case " ${STEAMSHIP_DEBUG} " in
*" delimiter "*)
	steamship_delimiter_init
	steamship_delimiter -p
	steamship_delimiter_prompt
	echo "${STEAMSHIP_PROMPT}"
	;;
esac
