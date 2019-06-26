function _rider_theme_git_branch_name
	echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function fish_prompt
	# this must be the first line
	set -l last_status $status

	set -l yellow (set_color yellow)
	set -l green (set_color green)
	set -l normal (set_color normal)
	set -l magenta (set_color magenta)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l cyan (set_color cyan)
	set -l gray (set_color 555)

	set -l cwd (prompt_pwd)

	if test $last_status -eq 0
		set status_indicator $green"➤"
	else
		set status_indicator $red"➤"
	end

	if [ (_rider_theme_git_branch_name) ]
		if test (_rider_theme_git_branch_name) = 'master'
			set -l git_branch (_rider_theme_git_branch_name)
			set git_info "$cyan ($red$git_branch$cyan)$normal"
		else if test (_rider_theme_git_branch_name) = 'develop'
			set -l git_branch (_rider_theme_git_branch_name)
			set git_info "$cyan ($yellow$git_branch$cyan)$normal"
		else
			set -l git_branch (_rider_theme_git_branch_name)
			set git_info "$cyan ($green$git_branch$cyan)$normal"
		end
	end

	set -l lambda "߷"

	echo "$green$USER $magenta$lambda $blue$cwd $status_indicator$git_info $normal"
end
