for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user", [[v:val =~ '\.lua$']])) do
	require("user." .. file:gsub("%.lua$", ""))
end
