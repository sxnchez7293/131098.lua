-- Script para bypass de compra en el catálogo de creación de avatares

-- Función para obtener los IDs de los objetos seleccionados
local function getSelectedItemsIds()
    local player = game.Players.LocalPlayer
    local selectedItems = player.Backpack:GetChildren()

    local itemIds = {}
    for _, item in ipairs(selectedItems) do
        if item:IsA("Tool") and item:FindFirstChild("ItemId") then
            table.insert(itemIds, item.ItemId.Value)
        end
    end

    return itemIds
end

-- Función para agregar un objeto al inventario del jugador
local function addItemToInventory(itemId)
    local player = game.Players.LocalPlayer
    local tool = Instance.new("Tool")
    tool.Name = "BypassedItem"
    tool.ItemId = itemId

    tool.Parent = player.Backpack
    tool:MakeJoints()
end

-- Función principal para ejecutar el bypass
local function executeBypass()
    local itemIds = getSelectedItemsIds()

    if #itemIds > 0 then
        for _, itemId in ipairs(itemIds) do
            addItemToInventory(itemId)
        end
        print("Todos los objetos han sido añadidos al inventario con éxito.")
    else
        print("No se han seleccionado objetos para añadir al inventario.")
    end
end

-- Ejecutar el bypass cuando el script se carga
executeBypass()
