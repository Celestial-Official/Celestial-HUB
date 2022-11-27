--- {Services} ---
local RbxAnalytics_Service = game:GetService("RbxAnalyticsService");
local MarketPlace_Service = game:GetService("MarketplaceService");
local REvents_Service = game:GetService("ReplicatedStorage");
local Teleport_Service = game:GetService("TeleportService");
local VirtualUser_Service = game:GetService("VirtualUser");
local Workspace_Service = game:GetService("Workspace");
local Http_Service = game:GetService("HttpService");
local Run_Service = game:GetService("RunService");
local Users_Service = game:GetService("Players");

--- {All-Variables} ---
_G.Checked_Gamepasses = false
getgenv().SecureMode = true
local ServersUrl_API = "https://www.roblox.com/api/v1/games"

--- {Objects} ---
local User_Executor = identifyexecutor()
local InGame_User = Users_Service.LocalPlayer
local UILib_Url = loadstring(game:HttpGet("https://raw.githubusercontent.com/Celestial-Official/Celestial-HUB/main/UI_Library.Lua", true))()
local UserHwID = RbxAnalytics_Service:GetClientId()
local User_Character = InGame_User.Character or InGame_User.CharacterAdded:Wait()
local User_Humanoid = User_Character.Humanoid or User_Character:WaitForChild("Humanoid")

--- {Tables} ---
local Registered_Users = {
    ["Datas"] = {
        [""] = {
            UserInfos = {UserName = "Celestial"},
            UserDatas = {LoginKey = "123_Admin", Type = "Creator"},
            UserStatus = {IsBlackListed = false, Reason = ""}
        }
    }
}

local Celestial_Datas = {
    ["Datas"] = {
        ["UI_Infos"] = {
            Versions_Infos = {Current_Version = "7.0", Current_Status = "BETA"},
            UIStatus_Infos = {IsUI_Patched = false, IsUI_OutDated = false}
        },

        ["SupportedGames_Id"] = {155615604, 369152986, 1554960397}
    }
}

--- {Functions} ---
local LoadCelestialUI_Function = function(InGame_ID)
    for Table, Value in pairs(Celestial_Datas["SupportedGames_Id"]) do
        if (Value == InGame_ID) then
            if (Value and InGame_ID == Celestial_Datas["SupportedGames_Id"][1]) then
                --- {Objects} ---
                local Workspace_Remotes = Workspace_Service.Remote

                local MainUI_Window = UILib_Url:CreateWindow({
                    Name = "Celestial [V".. Celestial_Datas["Datas"]["UI_Infos"].Versions_Infos.Current_Version .."] | Prison-Life",
                    LoadingTitle = "Loading Celestial [V".. Celestial_Datas["Datas"]["UI_Infos"].Versions_Infos.Current_Version .."], Please Wait...",
                    LoadingSubtitle = "By Celeste#3557 & Xamenia#2020",

                    --- Configurations ---
                    ConfigurationSaving = {
                        Enabled = true,
                        FolderName = "Celeste_Config",
                        FileName = "Configuration"
                    },

                    Discord = {
                        Enabled = false,
                        Invite = "Sirius",
                        RememberJoins = true
                    },

                    KeySystem = true,
                    KeySettings = {
                        Title = "Celestial [V".. Celestial_Datas["Datas"]["UI_Infos"].Versions_Infos.Current_Version .."] | Key-System",
                        Subtitle = "By k00pz#8972",
                        Note = "Join Our Discord: [Discord Invite]",
                        FileName = "Celestial_Key",
                        SaveKey = true,
                        GrabKeyFromSite = false,
                        Key = Registered_Users["Datas"][tostring(UserHwID)].UserDatas.LoginKey
                    }
                })

                --- {Tabs} ---
				local Main_Tab = MainUI_Window:CreateTab("Home", 4034483344)
				local Client_Tab = MainUI_Window:CreateTab("Client", 470645116)
				local Server_Tab = MainUI_Window:CreateTab("Server", 9432858523)
				local Updates_Tab = MainUI_Window:CreateTab("Updates", 7546954294)
				local Settings_Tab = MainUI_Window:CreateTab("Settings", 7059346373)

                --- {Labels} ---
				local GunGiver_Label = Server_Tab:CreateLabel("Guns | Giver")
				local TPLoc_Label = Client_Tab:CreateLabel("Locations | Teleport")

                --- {Paragraph} ---
				local Update_2 = Updates_Tab:CreateParagraph({
					Title = "Update 2",
					Content = [[
                    * Fixed Tabs Overflow If There Was Too Many,
                    * Fixed The Notification Blur Problem,
                    * Several Bugs Fixes.
                ]]
				})

				local Update_3 = Updates_Tab:CreateParagraph({
					Title = "Update 3",
					Content = [[
                    * Key System Has Been Created,
                    * Intro / Loading Screen Are Now Fixed And Working,
                    * Several Bugs Fixes And Anhancements.
                ]]
				})

				local Update_4 = Updates_Tab:CreateParagraph({
					Title = "Update 4",
					Content = [[
                    * Configuration System Has Been Created,
                    * Bug Fixes And Enhancements.
                ]]
				})

				local Update_41 = Updates_Tab:CreateParagraph({
					Title = "Update 4.1",
					Content = [[
                    * Introducing Secure Mode,
                    * Secure Mode Is Now Fixed And Undetected.
                ]]
				})

				local Update_42 = Updates_Tab:CreateParagraph({
					Title = "Update 4.2",
					Content = [[
                    * Secure Mode Has Been Fixed,
                    * Toggles Are Now Instant.
                ]]
				})

				local Update_5 = Updates_Tab:CreateParagraph({
					Title = "Update 5",
					Content = [[
                    * Tabs Now Support Icons,
                    * Built-In Error Handler.
                    * Bug Fixes And Enhancements.
                ]]
				})

				local Update_51 = Updates_Tab:CreateParagraph({
					Title = "Update 5.1",
					Content = [[
                    * Toggles Now Support Loops,
                    * Sliders Has Been Fixed,
                    * Tabs Has Been Fixed
                    * Bug Fixes And Enhancements.
                ]]
				})

				local Update_6 = Updates_Tab:CreateParagraph({
					Title = "Update 6",
					Content = [[
                    * Improved Tabs UI,
                    * KeySystem Is Now More Secure,
                    * Tabs Has Been Fixed,
                    * Others Bug Fixes And Enhancements.
                ]]
				})

				local Update_7 = Updates_Tab:CreateParagraph({
					Title = "Update 7",
					Content = [[
                    * Themes Framework Is Being Worked On,
                    * Notifications Have Now An Button,
                    * Configuration System Has Been Fixed,
                    * Flags Has Been Fixed,
                    * Others Bug Fixes And More Enhancements.
                ]]
				})

                local Update_8 = Updates_Tab:CreateParagraph({
					Title = "Update 8",
					Content = [[
                    * Discord Invite System Has Been Fixed,
                    * Color-Picker Is Being Worked-On,
                    * An Search-Bar Has Been Added,
                    * An Characters Limit Has Been Added To Inputs,
                    * Others Bug Fixes And Few Enhancements.
                ]]
				})
            end
        end
    end
end

local CheckUserDatas_Function = function()
    if (Registered_Users["Datas"][tostring(UserHwID)]) then
        if (Registered_Users["Datas"][tostring(UserHwID)].UserStatus.IsBlackListed == true) then
            UILib_Url:Destroy()
            InGame_User:Kick("[BlackList] > [Error]: ", tostring(Registered_Users["Datas"][tostring(UserHwID)].UserStatus.Reason))
        else
            LoadCelestialUI_Function(game.PlaceId)
        end
    else
        UILib_Url:Destroy()
        InGame_User:Kick("[WhiteList] > [Error]: WhiteList Error 0x1")
    end
end

local CheckCelestialDatas_Function = function()
    if (Celestial_Datas["Datas"]["UI_Infos"].UIStatus_Infos.IsUI_Patched == true) then
        UILib_Url:Destroy()
        InGame_User:Kick("[Status] > [Error]: {Celestial} Is Currently Patched, Please Wait For An Un-Patch.")
    elseif (Celestial_Datas["Datas"]["UI_Infos"].UIStatus_Infos.IsUI_OutDated == true) then
        UILib_Url:Destroy()
        InGame_User:Kick("[Status] > [Error]: {Celestial} Is Currently OutDated, Please Wait For An Update.")
    else
        CheckUserDatas_Function()
    end
end

--- {Call Functions} ---
CheckCelestialDatas_Function()
UILib_Url:LoadConfiguration()
