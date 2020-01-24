//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kupskin ]------------------------------------------------//
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

// Opis
/*
	
*/


// Notatki skryptera:
/*
	
*/
/*
new CenySkinow[] = {
	15000,
	15000,
	50000,
	50000,
	100000,
	15000,
	15000,
	15000,
	15000,
	15000,
	50000,
	15000,
	15000,
	15000,
	50000,
	100000,
	50000,
	50000,
	50000,
	50000,
	100000,
	15000,
	100000,
	50000,
	15000,
	15000,
	15000,
	100000,
	100000,
	50000,
	100000
};*/

YCMD:kupskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsAtClothShop(playerid))
        {
            new skinID;
			if( sscanf(params, "d", skinID))
			{
				sendTipMessage(playerid, "U�yj /wybierzskin [id skinu] (koszt: 5000$)");
				sendTipMessage(playerid, "ID skin�w znajdziesz na: http://wiki.sa-mp.com/wiki/Skins:All");
				sendTipMessage(playerid, "ID skin�w [+20.000] znajdziesz na: http://mrucznik-rp.pl");
				sendTipMessage(playerid, "Uwaga! Nowe skiny (20.000+) kosztuj� 15k, 50k lub 100k!");
				return 1;
			}
			if(kaska[playerid] >= 5000) 
			{				
				if(skinID > 299 && skinID <= 20000)
				{
					sendErrorMessage(playerid, "B��dne ID skina"); 
					return 1;
				}
				if(skinID <= 299) 
				{
					if(skinIsLegally(skinID))
					{
						sendTipMessage(playerid, "Kupi�e� nowego skina!"); 
						ZabierzKase(playerid, 5000); 
						SetPlayerSkin(playerid, skinID);
						PlayerInfo[playerid][pSkin] = skinID; 
						return 1;
					}	
				}
				else if(skinID > 20000 && skinID <= skinsLoaded_Event)//SKINY EVENTOWE
				{
					if(eventForSkin[skinID-20000] == 0)
					{
						sendTipMessage(playerid, "Event dla tego skina jest wy��czony!"); 
						return 1;
					}
					SetPlayerSkin(playerid, skinID); 
					sendTipMessage(playerid, "Kupi�e� nowego skina!"); 
					ZabierzKase(playerid, 5000); 
					return 1;
				}
				else if(skinID > 20100 && skinID <= skinsLoaded_Fraction)//Skiny dla frakcji
				{
					sendTipMessage(playerid, "Ten skin jest tylko i wy��cznie dla frakcji! U�yj /uniform"); 
					return 1;
				}
				else if(skinID > 20300 && skinID <= skinsLoaded_Uni)
				{
					sendErrorMessage(playerid, "Ten skin jest do kupienia za MC"); 
					return 1;
				}
				else if(skinID > 20400 && skinID <= skinsLoaded_Normal)//Normalne skiny dla ka�dego
				{
					new fakeID = GetSkinFakeID(skinID); 
					new string[124];
					new plec[10]; 
					new rasa[24]; 
					if(skinID == 20446 || skinID == 20445 || skinID == 20451 || skinID == 20449)
					{
						sendErrorMessage(playerid, "Nagie skiny mo�esz za�o�y� w swoim domu za pomoc� /rozbierz"); 
						return 1;
					}
					if(kaska[playerid] < skinCost[fakeID])
					{
						sendErrorMessage(playerid, "Nie posiadasz wystarczaj�cej ilo�ci got�wki, na tego skina");
						format(string, sizeof(string), "Ten skin [NR: %d] kosztuje %d$", fakeID+20000, skinCost[fakeID]);
						sendTipMessage(playerid, string);
						return 1; 
					}
					if(skinSex[fakeID] == SKIN_MEN)
					{
						format(plec, sizeof(plec), "m�czyzna");
					}
					else if (skinSex[fakeID] == SKIN_WOMEN)
					{
						format(plec, sizeof(plec), "kobieta"); 
					}
					else{format(plec, sizeof(plec), "nieznana");}
					
					if(skinColor[fakeID] == SKIN_WHITE)
					{
						format(rasa, sizeof(rasa), "Bia�y"); 
					}
					else if(skinColor[fakeID] == SKIN_BLACK)
					{
						format(rasa, sizeof(rasa), "Afroamerykanin"); 
					}
					else if(skinColor[fakeID] == SKIN_YELLOW)
					{
						format(rasa, sizeof(rasa), "Azjata");
					}
					else{format(rasa, sizeof(rasa), "Nieznana");}
					format(string, sizeof(string), "Kupi�e� skina o p�ci: %s, rasy %s", plec, rasa);
					sendTipMessage(playerid, string); 
					SetPlayerSkin(playerid, skinID); 
					//ZabierzKase(playerid, CenySkinow[skinID-20401]); 
					ZabierzKase(playerid, skinCost[fakeID]); 
					PlayerInfo[playerid][pSkin] = skinID; 
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie posiadasz odpowiedniej ilo�ci got�wki!");
				return 1;
			}
		}
	}
	return 1;
}
/*
YCMD:kupskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsAtClothShop(playerid))
        {
            new skinID;
			if( sscanf(params, "d", skinID))
			{
				sendTipMessage(playerid, "U�yj /wybierzskin [id skinu] (koszt: 5000$)");
				sendTipMessage(playerid, "ID skin�w znajdziesz na: http://wiki.sa-mp.com/wiki/Skins:All");
				sendTipMessage(playerid, "ID skin�w [+400] znajdziesz na: http://mrucznik-rp.pl");
				return 1;
			}
			if(kaska[playerid] < 5000)
			{
				sendErrorMessage(playerid, "Nie posiadasz wystarczaj�co �rodk�w!");
				return 1;
			}
			if(skinID > )
			for(new i; i<=2; i++)
			{
				if(skinID == PedsEvent[i][0])
				{
					if(eventForSkin[i] != 1)
					{
						sendErrorMessage(playerid, "Event dla tego skina zosta� zako�czony!"); 
						return 1;
					}
					
					sendTipMessage(playerid, "Zakupi�e� nowego skina [Tymczasowego]!"); 
					ZabierzKase(playerid, 5000); 
					SetPlayerSkinEx(playerid, skinID); 
					return 1;
				}
			}
			for(new skin = 0; skin<=222; skin++)
			{
				if(skinID == Przebierz[skin][0])
				{
					sendTipMessage(playerid, "Zakupi�e� nowego skina!"); 
					ZabierzKase(playerid, 5000); 
					SetPlayerSkinEx(playerid, skinID); 
					PlayerInfo[playerid][pSkin] = skinID; 
					return 1;
				}
			}
			sendTipMessage(playerid, "Tego skina nie mo�esz wybra�!"); 	
        }
        else
		{
		    sendErrorMessage(playerid, "Nie jeste� w sklepie z ciuchami!");
		}
    }
	return 1;
}
*/