//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ otworzlinie ]----------------------------------------------//
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

YCMD:otworzlinie(playerid, params[], help)
{
    if(IsPlayerInFraction(playerid, FRAC_SN, 1000))
    {
        new lLine;
        if(sscanf(params, "d", lLine)) return sendTipMessage(playerid, "Podaj numer lini, kt�r� chcesz otworzy� np. 100 lub 150");
        if(!(100 <= lLine <= 150)) return sendTipMessage(playerid, "Numer od 100 do 150.");
        new lStr[128];
        gSNLockedLine[lLine-100] = false;
        format(lStr, 128, "San-SMS: Linia %d zosta�a otworzona przez %s", lLine, GetNick(playerid));
        SendFamilyMessage(FRAC_SN, COLOR_YELLOW, lStr);
    }
    else sendErrorMessage(playerid, "Nie jeste� z SN.");
    return 1;
}
