-- Fly Script Simples (Delta)
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local flying = false
local speed = 50

function Fly()
    local char = Player.Character
    local humanoidRootPart = char:WaitForChild("HumanoidRootPart")

    local BodyGyro = Instance.new("BodyGyro", humanoidRootPart)
    local BodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
    BodyGyro.P = 9e4
    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BodyGyro.cframe = humanoidRootPart.CFrame
    BodyVelocity.velocity = Vector3.new(0, 0, 0)
    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)

    flying = true

    while flying do
        wait()
        BodyGyro.cframe = workspace.CurrentCamera.CFrame
        BodyVelocity.velocity = workspace.CurrentCamera.CFrame.LookVector * speed
    end

    BodyGyro:Destroy()
    BodyVelocity:Destroy()
end

Mouse.KeyDown:Connect(function(key)
    if key:lower() == "f" then
        if flying then
            flying = false
        else
            Fly()
        end
    end
end)