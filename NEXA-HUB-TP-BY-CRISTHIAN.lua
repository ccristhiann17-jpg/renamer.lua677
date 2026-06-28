-- NEXA HUB TP by cristhian
-- WindUI Teleport Script con cooldown

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "NEXA HUB TP by cristhian",
    Icon = "map",
    Theme = "Dark",
    Folder = "NexaHubTP",
})

local MainTab = Window:Tab({
    Title = "Teleports",
    Icon = "map-pin",
})

local MainSection = MainTab:Section({
    Title = "Etapas TP",
})

local cooldowns = {} -- Para manejar cooldown por etapa si quieres

local function TeleportTo(x, y, z, etapa)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
        
        -- Mensaje principal
        WindUI:Notify({
            Title = "Teleported a Etapa " .. etapa,
            Content = "✅ Has sido teletransportado correctamente.",
            Duration = 4,
        })
        
        -- Mensaje de espera
        task.wait(1) -- Pequeña pausa para que se vea secuencial
        WindUI:Notify({
            Title = "⏳ Espera requerida",
            Content = "Debes esperar 45 segundos para agarrar las wins.",
            Duration = 6,
        })
        
    else
        WindUI:Notify({
            Title = "Error",
            Content = "No se encontró tu personaje.",
            Duration = 3,
        })
    end
end

-- Botones
MainSection:Button({
    Title = "TP Etapa 1",
    Desc = "X: -1456 | Y: -70 | Z: -512",
    Icon = "arrow-right",
    Callback = function()
        TeleportTo(-1456, -70, -512, "1")
    end,
})

MainSection:Button({
    Title = "TP Etapa 2",
    Desc = "X: -1459 | Y: -58 | Z: -19",
    Icon = "arrow-right",
    Callback = function()
        TeleportTo(-1459, -58, -19, "2")
    end,
})

MainSection:Button({
    Title = "TP Etapa 3",
    Desc = "X: -1456 | Y: 214 | Z: 325",
    Icon = "arrow-right",
    Callback = function()
        TeleportTo(-1456, 214, 325, "3")
    end,
})

MainSection:Button({
    Title = "TP Etapa 4",
    Desc = "X: -1401 | Y: 532 | Z: 753",
    Icon = "arrow-right",
    Callback = function()
        TeleportTo(-1401, 532, 753, "4")
    end,
})

-- Notificación inicial
Window:Notify({
    Title = "NEXA HUB TP",
    Content = "Bienvenido! Usa los botones para teletransportarte.\nRecuerda esperar 45 segundos después de cada TP.",
    Duration = 7,
})
