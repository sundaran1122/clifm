#compdef clifm
#
# Completion definition for CliFM
#
# Author:
#   L. Abramovich
#

setopt localoptions noshwordsplit noksharrays
local -a args

args=(
	{-a,--no-hidden}'[do not show hidden files (default)]'
	{-A,--show-hidden}'[show hidden files]'
	{-b+,--bookmarks-file=}'[specify an alternative bookmarks file]:filename:_files'
	{-c+,--config-file=}'[specify an alternative configuration file]:filename:_files'
	{-e,--no-eln}'[do not print ELN (entry list number) at the left of each filename]'
	{-f,--no-folders-first}'[do not list folders first]'
	{-F,--folders-first}'[list folders first (default)]'
	{-g,--pager}'[enable the pager]'
	{-G,--no-pager}'[disable the pager (default)]'
	{-h,--help}'[show this help and exit]'
	{-i,--no-case-sensitive}'[no case-sensitive files listing (default)]'
	{-I,--case-sensitive}'[case-sensitive files listing]'
	{-k+,--keybindings-file=}'[specify an alternative keybindings file]:filename:_files'
	{-l,--no-long-view}'[disable long view mode (default)]'
	{-L,--long-view}'[enable long view mode]'
	{-m,--dihist-map}'[enable the directory history map]'
	{-o,--no-list-on-the-fly}'['cd' works as the shell 'cd' command]'
	{-O,--list-on-the-fly}'['cd' lists files on the fly (default)]'
	{-p+,--path=}'[use PATH as CliFM starting path]:directory:_directories'
	{-P+,--profile=}'[use (or create) PROFILE as profile]:profile:->profiles'
	{-s,--splash}'[enable the splash screen]'
	{-S,--stealth-mode}'[leave no trace on the host system]'
	{-u,--no-unicode}'[disable unicode]'
	{-U,--unicode}'[enable unicode]'
	{-v,--version}'[show version details and exit]'
	{-w+,--workspace=}'[start in workspace NUM]:workspace:->workspaces'
	{-x,--ext-cmds}'[allow the use of external commands]'
	{-y,--light-mode}'[enable the light mode]'
	{-z+,--sort=}'[sort files by METHOD]:method:->methods'
	'--case-ins-dirjump[consult the jump database ignoring case]'
	'--case-ins-path-comp[TAB complete paths ignoring case]'
	'--cd-on-quit[write last visited path to $XDG_CONFIG_HOME/clifm/.last to be accessed later by a shell funtion]'
	'--color-scheme=[set color scheme]:color:->colorschemes'
	'--cwd-in-title[print current directory in the terminal window title]'
	'--disk-usage[show disk usage (free/total) for the filesystem to which the current directory belongs]'
	'--enable-logs[enable program logs]'
	'--expand-bookmarks[expand bookmark names into the corresponding bookmark paths]'
	'--icons[enable icons]'
	'--icons-use-file-color[icons color follows file color]'
	'--list-and-quit[list files and quit]'
	'--max-dirhist=[maximum number of visited directories to remember]:int:'
	'--max-files=[list only up to NUM files]:int:'
	'--max-path=[set the maximun number of characters of the prompt path]:int:'
	'--no-dir-jumper[disable the directory jumper function]'
	'--no-cd-auto[force the use of 'cd' to change directories]'
	'--no-classify[Do not append filetype indicators]'
	'--no-clear-screen[do not clear the screen when listing directories]'
	'--no-colors[disable filetype colors for files listing]'
	'--no-columns[disable columned files listing]'
	'--no-files-counter[disable the files counter for directories]'
	'--no-open-auto[same as no-cd-auto, but for files]'
	'--no-tips[disable startup tips]'
	'--no-welcome-message[disable the welcome message]'
	'--only-dirs[list only directories and symbolic links to directories]'
	'--open[run as a stand-alone resource opener: open FILE and exit]'
	'--opener=[resource opener to use instead of 'Lira', CliFM built-in opener]:opener:_command_names'
	'--restore-last-path[save last visited directory to be restored in the next session]'
	'--rl-vi-mode[set readline to vi editing mode (defaults to emacs editing mode)]'
	'--share-selbox[make the Selection Box common to different profiles]'
	'--sort-reverse[sort in reverse order]'
	'--trash-as-rm[the 'r' command executes 'trash' instead of 'rm']'
	'*:filename:_files'
)

_arguments -w -s -S $args[@] && ret=0

case "$state" in
	profiles)
		local -a prof_files
		prof_files=( $(basename -a $HOME/.config/clifm/profiles/*) )
		_multi_parts / prof_files
	;;
	colorschemes)
		local -a color_schemes
		color_schemes=( $(basename -a $HOME/.config/clifm/colors/* | cut -d. -f1) )
		_multi_parts / color_schemes
	;;
	methods)
		_values -s , 'methods' 0 1 2 3 4 5 6 7 8 9 10
	;;
	workspaces)
		_values -s , 'workspaces' 1 2 3 4 5 6 7 8
	;;
esac
