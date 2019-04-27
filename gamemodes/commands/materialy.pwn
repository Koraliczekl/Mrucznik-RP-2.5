//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ materialy ]-----------------------------------------------//
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

CMD:materials(playerid, params[]) return cmd_materialy(playerid, params);
CMD:mats(playerid, params[]) return cmd_materialy(playerid, params);
CMD:materialy(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	    if (PlayerInfo[playerid][pJob] != 9)
		{
		    sendTipMessageEx(playerid,COLOR_GREY,"Nie jeste� dilerem broni !");
		    return 1;
		}
		new x_nr[16];
		new moneys=0;
		if( sscanf(params, "s[16]D(10)", x_nr, moneys))
		{
			sendTipMessage(playerid, "U�yj /mats [nazwa]");
			sendTipMessage(playerid, "Dost�pne nazwy: Wez, Dostarcz.");
			return 1;
		}
		if(strcmp(x_nr,"get",true) == 0 || strcmp(x_nr,"wez",true) == 0)
		{
		    if(PlayerToPoint(3.0,playerid,597.1277,-1248.6479,18.2734))
		    {
		        if(MatsHolding[playerid] >= 10)
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie masz miejsca na wi�cej paczek !");
			        return 1;
		        }

		        if(moneys == 0)
				{
					sendTipMessage(playerid, "U�yj /mats get [ammount]");
					return 1;
				}

				if(moneys < 1 || moneys > 10) { sendTipMessageEx(playerid, COLOR_GREY, "Ilo�� paczek od 1 do 10 !"); return 1; }
				new price = moneys * 500;
				if(kaska[playerid] > price)
				{
				    format(string, sizeof(string), "* Kupi�e� %d paczek materia��w za $%d jed� do fabryki materia��w. Dok�adn� lokalizacj� musisz ustali� sam.", moneys, price);
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				    ZabierzKase(playerid, price);
				    MatsHolding[playerid] = moneys;
				    SetPlayerCheckpoint(playerid, 2218.6000976563,-2228,13.5, 30);
				    SetTimerEx("Matsowanie", 1*51000 ,0,"d",playerid);
				    MatsGood[playerid] = 1;
				}
				else
				{
				    format(string, sizeof(string), "Nie masz $%d !", price);
				    sendTipMessageEx(playerid, COLOR_GREY, string);
				}
		    }
		    else
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w fabryce materia��w w Los Santos !");
		        return 1;
		    }
		}
		else if(strcmp(x_nr,"deliver",true) == 0 || strcmp(x_nr,"dostarcz",true) == 0)
		{
		    new Float:ActorX, Float:ActorY, Float:ActorZ;
            GetActorPos(FabrykaMats_Actor, ActorX, ActorY, ActorZ);

            if(IsPlayerInRangeOfPoint(playerid, 2, ActorX, ActorY, ActorZ)) 
		    {
		        if(MatsHolding[playerid] > 0)
		        {
		            if(MatsGood[playerid] != 1)
		            {
			            new payout = (50)*(MatsHolding[playerid]);
			            format(string, sizeof(string), "Dosta�e� od handlarza %d materia��w z twoich %d paczek mats", payout, MatsHolding[playerid]);
					    sendTipMessage(playerid, string);
                        if(PlayerInfo[playerid][pMiserPerk] > 0) {
                            new poziom = PlayerInfo[playerid][pMiserPerk];
                            PlayerInfo[playerid][pMats] += poziom*30;
                            format(string, sizeof(string), "Dzi�ki ulepszeniu MATSIARZ otrzymujesz dodatkowo %d mats", poziom*30);
                            sendTipMessage(playerid, string);
                        }
			            PlayerInfo[playerid][pMats] += payout;
			            MatsHolding[playerid] = 0;
			            DisablePlayerCheckpoint(playerid);
			        }
			        else
			        {
			            GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "AdmCmd: %s zostal zkickowany przez Admina: Marcepan_Marks, pow�d: teleport", sendername);
                        SendPunishMessage(string, playerid);
						KickLog(string);
			        	KickEx(playerid);
			        	return 1;
		        	}
		        }
		        else
		        {
		            sendTipMessageEx(playerid, COLOR_GREY, "Nie posiadasz paczek z materia�ami !");
			        return 1;
		        }
		    }
		    else
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� przy handlarzu materia�ami!");
		        return 1;
		    }
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa !");
		    return 1;
		}
	}
	return 1;
}
/*CMD:sprzedajpistol(playerid, params[])
{
    new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pJob] == 9)
        {
			new umiejetnosc;
			new skillz;
			new x_weapon[16],weapon[MAX_PLAYERS],ammo[MAX_PLAYERS],price[MAX_PLAYERS];
			new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "U�yj: /sprzedajpistol [ID gracza]");
				return 1;
			}

			if (zmatsowany[playerid] == 1)
			{
			    SendClientMessage(playerid,COLOR_GREY,"   Poczekaj 10 sekund zanim sprzedasz temu graczowi nast�pn� bro� !");
			    return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(PlayerInfo[giveplayerid][pLevel] >= 2)
			    {
					if(giveplayerid != INVALID_PLAYER_ID)
					{
						if(PlayerInfo[playerid][pMats] > 149)
						{
							weapon[playerid] = 22;
							price[playerid] = 150;
							ammo[playerid] = 200;
							umiejetnosc = 1;
							if(umiejetnosc <= skillz)
							{
								PlayerInfo[giveplayerid][pGun2] = 22;
								PlayerInfo[giveplayerid][pAmmo2] = 200;
							}
						}
						else
						{
							SendClientMessage(playerid,COLOR_GREY,"   Nie masz wystarczaj�cej ilo�ci materia��w na t� bro�!");
							return 1;
						}
					}
				}
				else
				{
					SendClientMessage(playerid,COLOR_GREY,"   Gracz musi mie� minimum 2LVL!");
					return 1;
				}*/
