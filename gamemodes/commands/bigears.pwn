//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bigears ]------------------------------------------------//
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

CMD:bigears(playerid)
{
    if(PlayerInfo[playerid][pAdmin] > 200)
    {
		if (!BigEar[playerid])
		{
			BigEar[playerid] = 1;
			sendTipMessageEx(playerid, COLOR_GRAD2, "Twoje uszy uros�y (s�yszysz wszystkich graczy)");
		}
		else if (BigEar[playerid])
		{
			(BigEar[playerid] = 0);
			sendTipMessageEx(playerid, COLOR_GRAD2, "Twoje uszy zmala�y (ju� nie s�yszysz wszytkich graczy)");
		}
	}
	return 1;
}
