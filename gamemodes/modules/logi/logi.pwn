//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    logi                                                   //
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
// Autor: Mrucznik
// Data utworzenia: 04.05.2019
//Opis:
/*
	Narz�dzia do obs�ugi log�w.
*/

//

//-----------------<[ Funkcje: ]>-------------------
GetPlayerLogName(playerid)
{
    return sprintf("{Player: %s[%d]}", GetNick(playerid), PlayerInfo[playerid][pUID]);
}

GetWeaponLogName(weapon, ammo=-1)
{
    new gunname[32];
    GetWeaponName(weapon, gunname, sizeof(gunname));
    if(ammo == -1)
    {
        return sprintf("{Weapon: %s[id: %d]}", gunname, weapon);
    }
    else
    {
        return sprintf("{Weapon: %s[id: %d, ammo: %d]}", gunname, weapon, ammo);
    }
}

GetVehicleLogName(vehicleid)
{
    return sprintf("{Vehicle: %s[%d]}", VehicleNames[GetVehicleModel(vehicleid)-400], CarData[VehicleUID[vehicleid][vUID]][c_UID]);
}

GetCarDataLogName(cardata)
{
    return sprintf("{Vehicle: %s[%d]}", VehicleNames[CarData[cardata][c_Model]-400], CarData[cardata][c_UID]);
}

GetHouseLogName(house)
{
    return sprintf("{House: %d}", house);
}

GetBusinessLogName(business)
{
    return sprintf("{Business: %s[%d]}", BizData[business][eBizName], business);
}

MRP_CheckLastLogin(uid, &time, ip[])
{
    new str[256];
    format(str, 256, "SELECT UNIX_TIMESTAMP(`time`) a, `IP` FROM `mru_logowania` WHERE `PID`='%d' ORDER BY a DESC LIMIT 1", uid);
    mysql_query(str);
    mysql_store_result();
    if(mysql_num_rows())
    {
        mysql_fetch_row_format(str, "|");
        sscanf(str, "p<|>ds[16]", time, ip);
        mysql_free_result();
    }
    return 1;
}

MRP_PlayerLog(playerid)
{
    new str[128], ip[16], GPCI[41], GPCI_esacped[41];
    GetPlayerIp(playerid, ip, 16);
    gpci(playerid, GPCI, 41);
    mysql_real_escape_string(GPCI, GPCI_esacped);
    format(str, 128, "INSERT INTO `mru_logowania` (`PID`, `time`, `IP`, `gpci`) VALUES ('%d', NOW(), '%s', '%s')", PlayerInfo[playerid][pUID], ip, GPCI_esacped);
    mysql_query(str);
    return 1;
}


//end