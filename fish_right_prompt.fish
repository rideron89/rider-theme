function _rider_theme_get_duration
	set -l seconds (math -s0 "$CMD_DURATION / 1000")
	set -l minutes (math -s0 "$seconds / 60")
	set -l hours (math -s0 "$minutes / 60")

	if test $hours -gt 0
		echo "$hours hrs"
	else if test $minutes -gt 1
		echo "$minutes mins"
	else if test $seconds -gt 0
		echo "$seconds s"
	else
		echo "$CMD_DURATION ms"
	end
end

function fish_right_prompt
	set -l gray (set_color 555)
	set -l normal (set_color normal)

	if [ $CMD_DURATION ]
		set -l duration (_rider_theme_get_duration)

		echo "$gray($duration)$normal"
	else
		echo $gray"---"
	end
end
