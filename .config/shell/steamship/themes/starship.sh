# shellcheck shell=sh disable=SC2034
# steamship/themes/starship.sh

STEAMSHIP_THEMES="${STEAMSHIP_THEMES} starship"

steamship_theme_starship() {
	# Symbol set used by Starship.

	STEAMSHIP_CHARACTER_SHOW='true'
	STEAMSHIP_CHARACTER_SYMBOL='❯ '
	STEAMSHIP_CHARACTER_SYMBOL_ROOT=${STEAMSHIP_CHARACTER_SYMBOL}
	STEAMSHIP_CHARACTER_SYMBOL_SUCCESS=${STEAMSHIP_CHARACTER_SYMBOL}
	STEAMSHIP_CHARACTER_SYMBOL_FAILURE=${STEAMSHIP_CHARACTER_SYMBOL}
	STEAMSHIP_CHARACTER_SYMBOL_SECONDARY='∙ '
	STEAMSHIP_CHARACTER_COLOR_SECONDARY='WHITE'

	STEAMSHIP_CONTAINER_SYMBOL='⬢ '

	# Starship doesn't have a delimiter symbol section.
	STEAMSHIP_DELIMITER_SHOW='false'

	STEAMSHIP_DIRECTORY_LOCK_SYMBOL='🔒'
	STEAMSHIP_DIRECTORY_TRUNCATE_PREFIX='…/'

	STEAMSHIP_EXIT_CODE_SYMBOL='❌'

	STEAMSHIP_GIT_BRANCH_SYMBOL=' '
	STEAMSHIP_GIT_STATUS_UNTRACKED='?'
	STEAMSHIP_GIT_STATUS_ADDED='+'
	STEAMSHIP_GIT_STATUS_MODIFIED='!'
	STEAMSHIP_GIT_STATUS_RENAMED='»'
	STEAMSHIP_GIT_STATUS_DELETED='✘'
	STEAMSHIP_GIT_STATUS_STASHED='$'
	STEAMSHIP_GIT_STATUS_UNMERGED='='
	STEAMSHIP_GIT_STATUS_AHEAD='⇡'
	STEAMSHIP_GIT_STATUS_BEHIND='⇣'
	STEAMSHIP_GIT_STATUS_DIVERGED='⇕'

	STEAMSHIP_HOST_SYMBOL_SSH='🌐 '

	STEAMSHIP_PROMPT_COLOR='NORMAL'
}
