//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ podatek ]------------------------------------------------//
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

CMD:settax(playerid, params[]) return cmd_podatek(playerid, params);
CMD:podatek(playerid, params[])
{
	new string[64];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pLider] != 11)
        {
			SendClientMessage(playerid, COLOR_GREY, "Nie jeste� burmistrzem!");
			return 1;
        }
        new moneys;
        if( sscanf(params, "d", moneys))
		{
			sendTipMessage(playerid, "U�yj /podatek [ilo��]");
			return 1;
		}

		if(moneys < 1 || moneys > 5000) { SendClientMessage(playerid, COLOR_GREY, "   Kwota podatku od 1 do 5000 !"); return 1; }
		Tax = moneys;
		SaveStuff();
		format(string, sizeof(string), "* Podatek to teraz $%d na gracza.", Tax);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    }
    return 1;
}


