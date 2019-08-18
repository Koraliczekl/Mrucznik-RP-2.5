//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bizinfo ]------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:bizinfo(playerid, params[], help)
{
	
	if(!CheckIfPlayerInBiznesPoint(playerid))
	{
		sendErrorMessage(playerid, "Nie jeste� obok biznesu!"); 
		return 1;
	}
	new businessID = GetPVarInt(playerid, "JestObokBiz"); 
	new string[256]; 
	if(Business[businessID][b_ownerUID] == 0)
	{
		format(string, sizeof(string), "{FFFFFF}Nazwa: {37AC45}%s\n{FFFFFF}W�a�ciciel: {37AC45}%s\n{FFFFFF}ID: {37AC45}%d\n{FFFFFF}Cena: {37AC45}$%d\n{FFFFFF}Dochody: {37AC45}$%d\n{FFFFFF}Lokalizacja: {37AC45}%s",
		Business[businessID][b_Name],
		Business[businessID][b_Name_Owner], 
		businessID,
		Business[businessID][b_cost],
		Business[businessID][b_maxMoney],
		Business[businessID][b_Location]); 
	}
	else
	{
		format(string, sizeof(string), "{FFFFFF}Nazwa: {37AC45}%s\n{FFFFFF}W�a�ciciel: {37AC45}%s [%d]\n{FFFFFF}ID: {37AC45}%d\n{FFFFFF}Cena: {37AC45}$%d\n{FFFFFF}Dochody: {37AC45}$%d\n{FFFFFF}Lokalizacja: {37AC45}%s",
		Business[businessID][b_Name],
		Business[businessID][b_Name_Owner], 
		Business[businessID][b_ownerUID],
		businessID,
		Business[businessID][b_cost],
		Business[businessID][b_maxMoney],
		Business[businessID][b_Location]); 
	}
	ShowPlayerInfoDialog(playerid, "Mrucznik Role Play", string, false); 
	
	return 1;
}
