//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ naucz ]-------------------------------------------------//
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

YCMD:rozbierz(playerid, params[], help)
{
    new string[128];
    new colorID; 
    if( sscanf(params, "k<fix>", colorID))
    {
        sendTipMessage(playerid, "U�yj /rozbierz [1 - bia�y || 2 - czarny]");
        return 1;
    }
    if(IsPlayerConnected(playerid))
    {
       if(GetPlayerVirtualWorld(playerid) == 40 || GetPlayerVirtualWorld(playerid) == )
       {
           if(PlayerInfo[playerid][pSex] == 2 || PlayerInfo[playerid][pDomWKJ] != 0)
           {
               if(colorID == 1)
               {
                    SetPlayerSkinEx(playerid, 20445);
               }
               else
               {
                    SetPlayerSkinEx(playerid, 20446); 
               }
           }
           else
           {
               if(colorID == 1)
               {
                   SetPlayerSkinEx(playerid, 252);
               }
               else
               {
                   SetPlayerSkinEx(playerid, 18); 
               }
           }
            format(string, sizeof(string), "%s �ci�ga z siebie wszystkie ubrania i rzuca je na bok!", GetNick(playerid)); 
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            isNaked[playerid] = 1; 
       }
       else
       {
           sendTipMessage(playerid, "Rozebra� si� mo�esz tylko w klubie ze striptizem i domu!"); 
       }
    }
    return 1;
}
