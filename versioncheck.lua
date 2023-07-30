
local githubRepoURL = "https://raw.githubusercontent.com/ScubeScripts/sc_animatedNPC/master/version"

function CheckVersion()
    PerformHttpRequest(githubRepoURL, function(errorCode, resultData, resultHeaders)
        if errorCode == 200 then
            local remoteVersion = string.gsub(resultData, "\n", "")
            local latestVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

            print("Local Version: " .. latestVersion)
            print("Latest Version: " .. remoteVersion)

            if remoteVersion ~= latestVersion then
                print("Your script is outdated. Please update to the latest version. https://github.com/ScubeScripts/sc_animatedNPC")
            else
                print("Your script is up to date.")
            end
        else
            print("Error retrieving version data.")
        end
    end)
end

CheckVersion()