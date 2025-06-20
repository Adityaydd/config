utils = require("mp.utils")
function select_files_dmenu_fzf()
	local directory = utils.get_property("working-directory") or ""
	local file_select =
		utils.subprocess({ args = { "bash", "-c", "fd . --type f | fzf --multi" }, cancellable = false })
	if file_select.status ~= 0 then
		return
	end
	local first_file = true
	for filename in string.gmatch(file_select.stdout, "[^\n]+") do
		mp.commandv("loadfile", filename, first_file and "replace" or "append")
		first_file = false
	end
end
mp.add_key_binding("Ctrl+f", "add-files-fzf", select_files_dmenu_fzf)
