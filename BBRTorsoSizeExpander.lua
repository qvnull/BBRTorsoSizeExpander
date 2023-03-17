local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

function Script()
    local Window = Library.CreateLib("Hitbox", "GrapeTheme")

    local Tab = Window:NewTab("Hitbox")
    local Section = Tab:NewSection("Hitbox")

    --Hitbox

    Section:NewSlider("Torso X", "Changes your X in the Vector3 used to control the torso", 50, 0.4, function(s)
        local playerName = game.Players.LocalPlayer.Name
        workspace.beyblades[playerName].Torso.Size = Vector3.new(s, workspace.beyblades[playerName].Torso.Size.Y, workspace.beyblades[playerName].Torso.Size.Z)
    end)
    
    Section:NewSlider("Torso Y", "Changes your Y in the Vector3 used to control the torso", 50, 0.4, function(s)
        local playerName = game.Players.LocalPlayer.Name
        workspace.beyblades[playerName].Torso.Size = Vector3.new(workspace.beyblades[playerName].Torso.Size.X, s, workspace.beyblades[playerName].Torso.Size.Z)
    end)
    
    Section:NewSlider("Torso Z", "Changes your Z in the Vector3 used to control the torso", 50, 0.4, function(s)
        local playerName = game.Players.LocalPlayer.Name
        workspace.beyblades[playerName].Torso.Size = Vector3.new(workspace.beyblades[playerName].Torso.Size.X, workspace.beyblades[playerName].Torso.Size.Y, s)
    end)

    Section:NewButton("Highlight Torso", "Highlights your torso everytime pressed during launnch", function()
        local player = game.Players.LocalPlayer
        local playerName = player.Name

        local modelToShow = workspace.beyblades[playerName]

        local boundingBox = Instance.new("Part")
        boundingBox.Name = "BoundingBox"
        boundingBox.Anchored = true
        boundingBox.CanCollide = false
        boundingBox.Material = Enum.Material.Neon
        boundingBox.Color = Color3.new(1, 1, 1)
        boundingBox.Transparency = 0.75
        boundingBox.Shape = Enum.PartType.Block

        boundingBox.Parent = modelToShow.Parent

        local connection
        connection = game:GetService("RunService").Heartbeat:Connect(function()
            if modelToShow and modelToShow.Parent then
                boundingBox.CFrame = modelToShow.Torso.CFrame
    
                boundingBox.Size = modelToShow.Torso.Size
            else
        
                boundingBox:Destroy()
                connection:Disconnect()
            end
        end)
    end)
    
workspace.beyblades.ChildRemoved:Connect(function(child)
if child == modelToShow then
boundingBox:Destroy()
connection:Disconnect()
end
end)

end

Script()
