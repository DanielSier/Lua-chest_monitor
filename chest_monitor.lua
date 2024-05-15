function print_inventory_on_monitor(chest, monitor)
    monitor.clear()
    local inventory = chest.list()

   
    local monitorWidth, monitorHeight = monitor.getSize()

    local itemCount = #inventory
    local startY = math.floor((monitorHeight - itemCount * 2) / 2) + 1

    local y = startY

    for slot, item in pairs(inventory) do
        local itemName = string.gsub(item.name, "minecraft:", "")
        local itemText = slot .. ": " .. itemName
        local countText = "x" .. item.count


        local itemX = math.floor((monitorWidth - string.len(itemText)) / 2)
        monitor.setCursorPos(itemX, y)
        monitor.write(itemText)


        local countX = math.floor((monitorWidth - string.len(countText)) / 2)
        y = y + 1
        monitor.setCursorPos(countX, y)
        monitor.setTextColor(colors.gray)
        monitor.write(countText)
        monitor.setTextColor(colors.white)

        y = y + 1
    end
end

local monitor = peripheral.find("monitor")
local chest = peripheral.find("minecraft:chest")

if monitor == nil then
    print("Geen monitor gevonden.")
    return
end

if chest == nil then
    print("Geen kist gevonden.")
    return
end

while true do
    print_inventory_on_monitor(chest, monitor)
    sleep(10)
end