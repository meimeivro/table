-- Table is a tool designed for developers to find vulnerabilities in their scripts.
-- It is not meant to be used for malicious purposes. We do not condone or endorse it.
--[[
  If you are using an executor with a Low UNC (Unified Naming Convention), the script could not work or break.
  
  Unified Naming Convention (UNC) was a naming standard aimed at standardising the names of functions within a Roblox executor's environment. It was developed by the Script-Ware team and other collaborators, seeking to improve script portability, maintenance, and executor interoperability. 
  TL;DR - UNC is a Roblox executor compatibility standard that shows which functions it supports. 
]]
  -- Version 1.0.0

local UserInputService = game:GetService("UserInputService") 
local GuiService = game:GetService("GuiService") -- Maybe useful later
local env = getenv()
env.Version = "1.0.0"

pcall(function() 
   local executor = identifyexecutor()
   if executor == "Xeno" or executor == "Solara" then
         game.StarterGui:SetCore("SendNotification",{ Title = "Low UNC", Text = "Your executor does not support most executor functions.", Duration = 10})
         warn("Your executor does not support most executor functions, which could break the entire script. Best to upgrade your executor.")
   elseif UserInputService.TouchEnabled then
      game.Players.LocalPlayer:Kick("Please use a different device other than mobile.")
   else
      print("You are good to go!")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/meimeivro/table/refs/heads/main/version.lua"))()
   end
end)
