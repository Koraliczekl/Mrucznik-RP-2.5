//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ rooc ]-------------------------------------------------//
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

YCMD:rooc(playerid, params[], help)
{
    new string[256];
    if(IsPlayerConnected(playerid))
    {
        if(isnull(params))
        {
            sendTipMessage(playerid, "U�yj (/r)adio [tekst]");
            return 1;
        }
        new member = GetPlayerFraction(playerid);
        if(0 < member <= 4 || member == 11 || member == 7 || member == 17)
        {
            
            format(string, sizeof(string), "** (( %s [%d] %s: %s )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank],GetNick(playerid, true), params);
            SendRadioMessage(member, TEAM_BLUE_COLOR, string, 1);
            SendDiscordFracMessage(member, string);
        } 
		else if(GetPlayerOrg(playerid) == FAMILY_SAD) //SAD i BOR po�aczenie + DMV
        {
            member = GetPlayerOrg(playerid);
            format(string, sizeof(string), "** (( %s [%d] %s: %s )) **", FamRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], GetNick(playerid, true), params);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
        } 
		else
        {
            noAccessMessage(playerid);
            return 1;
        }
        Log(chatLog, INFO, "%s radio policyjne %d OOC: %s", GetPlayerLogName(playerid), member, params);
    }
    return 1;
}
