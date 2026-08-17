--[[
  If you are using an executor with a Low UNC (Unified Naming Convention), the script could not work or break.
  
  Unified Naming Convention (UNC) was a naming standard aimed at standardising the names of functions within a Roblox executor's environment. It was developed by the Script-Ware team and other collaborators, seeking to improve script portability, maintenance, and executor interoperability. 
  TL;DR - UNC is a Roblox executor compatibility standard that shows which functions it supports. 
]]
  -- Version 1.0.0
  -- https://raw.githubusercontent.com/meimeivro/table/refs/heads/main/version.lua --
  -- https://raw.githubusercontent.com/meimeivro/table/refs/heads/main/table.lua --
local UserInputService = game:GetService("UserInputService") 
local Version = "1.0.0"
local scriptVersion = game:HttpGet("https://raw.githubusercontent.com/meimeivro/table/refs/heads/main/version.lua")

local success, error = pcall(function() 
   local executor = identifyexecutor()
   if string.find(executor, "Xeno") or string.find(executor, "Solara") then
         game.StarterGui:SetCore("SendNotification",{ Title = "Low UNC", Text = "Your executor does not support most executor functions.", Duration = 10})
         warn("Your executor does not support most executor functions, which could break the entire script. Change your executor to an executor with over 80% of UNC.")
   elseif UserInputService.TouchEnabled then
      game.Players.LocalPlayer:Kick("Please use a different device other than mobile.")
   else
      print("You are good to go!")
   end
end)

pcall(function()
   if Version == string.gsub(scriptVersion, "%s+", "") then
      print("Version has been matched, ")
     loadstring(game:HttpGet("https://raw.githubusercontent.com/meimeivro/table/refs/heads/main/table.lua"))()
   else
         error("Version mismatch!")
    end
end)
