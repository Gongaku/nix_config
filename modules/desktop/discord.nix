{
	inputs,
	...
}:
{
	flake.modules = {
		homeManager.desktop =
			{ pkgs, ... }:
			{
				imports = [
					inputs.nixcord.homeModules.nixcord
				];

				programs.nixcord = {
					enable = true;
					discord = {
						enable = true;
						vencord.enable = true;
					};
					# vencord.enable = true;
					# vesktop = {
					# 	enable = true;
					# 	package = pkgs.vesktop;
					# };
					config = {
						autoUpdate = true;
						autoUpdateNotification = true;
						plugins = {
							betterFolders.enable = true;
							betterSettings.enable = true;
							blurNSFW.enable = true;
							callTimer.enable = true;
							clearURLs.enable = true;
							crashHandler.enable = true;
							fakeNitro.enable = true;
							favoriteGifSearch.enable = true;
							fixSpotifyEmbeds.enable = true;
							fixYoutubeEmbeds.enable = true;
							friendInvites.enable = true;
							gameActivityToggle.enable = true;
							noF1.enable = true;
							replaceGoogleSearch = {
								enable = true;
								customEngineName = "duckduckgo";
								customEngineURL = "https://duckduckgo.com/?q=";
							};
							serverInfo.enable = true;
							showMeYourName.enable = true;
							spotifyControls.enable = true;
							spotifyCrack.enable = true;
							themeAttributes.enable = true;
							translate.enable = true;
							unlockedAvatarZoom.enable = true;
							userMessagesPronouns.enable = true;
							volumeBooster.enable = true;
							webKeybinds.enable = true;
							webScreenShareFixes.enable = true;
							youtubeAdblock.enable = true;
						};
						themeLinks = [
							"https://raw.githubusercontent.com/DiscordStyles/RadialStatus/deploy/RadialStatus.theme.css"
							"https://raw.githubusercontent.com/maenDisease/BetterDiscordStuff/refs/heads/main/css/FloatingModal.css"
							"https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/system24.theme.css"
						];
					};
				};
			};
	};
}
