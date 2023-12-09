-- increment_dates.lua

function getTomorrow(dateStr)
	c = 0

	tab = {}

	months = {
		["January"]= 1,
		["February"]= 2,
		["March"]= 3,
		["April"]= 4,
		["May"]= 5,
		["June"]= 6,
		["July"]= 7,
		["August"]= 8,
		["September"]= 9,
		["October"]= 10,
		["November"]= 11,
		["December"]= 12
	}

	for w in dateStr:gmatch("%S+") do 
		if c ~= 0 and c ~= 2 then
			if c == 1 then
				w = string.sub(w, 1, -3)
			end
			table.insert(tab, w)
		end

		c = c + 1
	end

	day = tab[2]
	month = months[tab[3]]
	year = 2023

    -- Create a time table
    local dateTable = os.time({year = year, month = month, day = day})

    -- Add one day (24 * 60 * 60 seconds)
    local tomorrowTime = dateTable + (24 * 60 * 60)

    -- Format the new date
    return os.date("# %a - %d %B", tomorrowTime)
end

local function increment_dates()
	local line_number = vim.fn.line('.')
	local current_line_content = vim.api.nvim_get_current_line()
	tom = getTomorrow(current_line_content)

	vim.api.nvim_buf_set_lines(0, line_number, line_number, false, {''})
	line_number = line_number + 1
	vim.fn.cursor(line_number, 1)
	vim.api.nvim_put({tom}, 'l', true, true)
	vim.fn.cursor(line_number + 1, 1)


end

-- Expose the function to Neovim
return { increment_dates = increment_dates }

