-- install.lua
local mpm_repository_url = "https://raw.githubusercontent.com/DanielSier/Lua-chest_monitor/main/"

-- Function to download a file from a URL
local function downloadFile(url, path)
    local response = http.get(url)
    if response and response.getResponseCode() == 200 then
        local content = response.readAll()
        local file = fs.open(path, "w")
        file.write(content)
        file.close()
        print("File " .. path .. " downloaded successfully.")
    else
        print("Failed to download " .. path)
    end
end


-- Download filelist.lua
downloadFile(mpm_repository_url .. "filelist.lua", "/filelist.lua")

-- Load the filelist
local files = dofile("/filelist.lua")

-- Download each file
for _, file in ipairs(files) do
    downloadFile(mpm_repository_url .. file, "/" .. file)
end

print("Chest monitor has been successfully installed.")