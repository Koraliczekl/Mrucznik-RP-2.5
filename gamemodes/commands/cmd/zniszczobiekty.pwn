//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ zniszczobiekty ]--------------------------------------------//
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

YCMD:zniszczobiekty(playerid, params[], help)
{
    if(IsAHeadAdmin(playerid) || IsAScripter(playerid))
    {
        DestroyAllDynamicObjects();
	    SendClientMessage(playerid, COLOR_PANICRED, "Wszystkie obiekty zniszczone!");
        new string[128];
        format(string, 128, "CMD_Info: /zniszczobiekty u�yte przez %s [%d]", GetNickEx(playerid), playerid);
        SendCommandLogMessage(string);
		Log(adminLog, INFO, "Admin %s u�y� /zniszczobiekty", GetPlayerLogName(playerid));
    }
	return 1;
}
