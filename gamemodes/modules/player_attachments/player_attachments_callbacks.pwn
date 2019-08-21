//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                             player_attachments                                            //
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
// Data utworzenia: 10.08.2019
//Opis:
/*
	Modu� odpowiedzialny za zarz�dzanie obiektami przyczepialnymi do gracza.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerEditAttachedObj(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(AttachedObjects[playerid][index][ao_active] == true)
	{
		if(response)
		{
			if(!CheckEditionBoundaries(fOffsetX, fOffsetY, fOffsetZ, fScaleX, fScaleY, fScaleZ))
			{
				sendErrorMessage(playerid, "Ten obiekt wykracza poza granice!");
				EditAttachedObject(playerid, index);
				//TODO: je�eli gracz kliknie wyjdz 2 razy w kr�tkim czasie, nie w�aczy mu si� edycja
				return -2;
			}

			SendClientMessage(playerid, COLOR_GREEN, "Edytowa�e� pozycj� swojego przedmiotu.");
	
			AttachedObjects[playerid][index][ao_x] = fOffsetX;
			AttachedObjects[playerid][index][ao_y] = fOffsetY;
			AttachedObjects[playerid][index][ao_z] = fOffsetZ;
			AttachedObjects[playerid][index][ao_rx] = fRotX;
			AttachedObjects[playerid][index][ao_ry] = fRotY;
			AttachedObjects[playerid][index][ao_rz] = fRotZ;
			AttachedObjects[playerid][index][ao_sx] = fScaleX;
			AttachedObjects[playerid][index][ao_sy] = fScaleY;
			AttachedObjects[playerid][index][ao_sz] = fScaleZ;

			SetPlayerAttachedObject(playerid, index, modelid, boneid, 
				fOffsetX, fOffsetY, fOffsetZ, 
				fRotX, fRotY, fRotZ, 
				fScaleX, fScaleY, fScaleZ
			);
			
			if(VECTOR_find_val(VAttachedItems[playerid], modelid) != INVALID_VECTOR_INDEX)
			{
				PlayerAttachments_UpdateItem(playerid, modelid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, boneid, true);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Anulowa�e� edycj� pozycj� swojego przedmiotu.");
	
			SetPlayerAttachedObject(playerid, index, modelid, boneid, 
				AttachedObjects[playerid][index][ao_x], AttachedObjects[playerid][index][ao_y], AttachedObjects[playerid][index][ao_z], 
				AttachedObjects[playerid][index][ao_rx], AttachedObjects[playerid][index][ao_ry], AttachedObjects[playerid][index][ao_rz], 
				AttachedObjects[playerid][index][ao_sx], AttachedObjects[playerid][index][ao_sy], AttachedObjects[playerid][index][ao_sz]
			);
		}
		return -2;
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for(new index; index<MAX_PLAYER_ATTACHED_OBJECTS; index++)
	{
		AttachedObjects[playerid][index][ao_active] = false;
	}
	return 1;
}

hook OnPlayerSpawn(playerid)
{
	for(new index; index<MAX_PLAYER_ATTACHED_OBJECTS; index++)
	{
		if(AttachedObjects[playerid][index][ao_active])
		{
			SetPlayerAttachedObject(playerid, index, 
				AttachedObjects[playerid][index][ao_model],
				 AttachedObjects[playerid][index][ao_bone], 
				AttachedObjects[playerid][index][ao_x], AttachedObjects[playerid][index][ao_y], AttachedObjects[playerid][index][ao_z], 
				AttachedObjects[playerid][index][ao_rx], AttachedObjects[playerid][index][ao_ry], AttachedObjects[playerid][index][ao_rz], 
				AttachedObjects[playerid][index][ao_sx], AttachedObjects[playerid][index][ao_sy], AttachedObjects[playerid][index][ao_sz]
			);
		}
	}
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_PRZEDMIOTYGRACZA)
	{
		if(response)
		{
			new item = DynamicGui_GetDataInt(playerid, listitem);
			
			if(HasPlayerActiveAttachedObject(playerid, item))
			{
				DialogPlayerAttachedItems(playerid);
				sendErrorMessage(playerid, "Masz ju� przyczepiony ten obiekt.");
				return 1;
			}

			if(GetFreeAttachedObjectSlot(playerid) == INVALID_ATTACHED_OBJECT_INDEX)
			{
				sendErrorMessage(playerid, "Masz zbyt du�o za�o�onych przedmiot�w. U�yj komendy /zdejmij aby zdj�� jaki� przedmiot.");
				return 1;
			}

			PlayerAttachments_SetActive(playerid, item, true);
			new index = PlayerAttachments_LoadItem(playerid, item);

			ShowPlayerDialogEx(playerid, DIALOG_PRZEDMIOTYGRACZA_EDYCJA, DIALOG_STYLE_MSGBOX, "Przedmioty - edycja", "Czy chcesz edytowa� pozycj� przedmiotu?", "Tak", "Nie");
			SetPVarInt(playerid, "AttachedItem_EditIndex", index);
		}
		return -2;
	}
	else if(dialogid == DIALOG_PRZEDMIOTYGRACZA_EDYCJA)
	{
		if(response)
		{
			EditAttachedObject(playerid, GetPVarInt(playerid, "AttachedItem_EditIndex"));
		}
		return -2;
	}
	else if(dialogid == DIALOG_PRZEDMIOTYGRACZA_ZDEJMIJ)
	{
		if(response)
		{
			new index = DynamicGui_GetDataInt(playerid, listitem);
			DetachPlayerItem(playerid, index);
		}
		return -2;
	}
	else if(dialogid == DIALOG_PRZEDMIOTYGRACZA_ZDEJMIJ_ADMIN)
	{
		if(response)
		{
			new index = DynamicGui_GetDataInt(playerid, listitem);
			DetachPlayerItem(GetPVarInt(playerid, "ZdejmijGiveplayerid"), index);
		}
		return -2;
	}
	return 1;
}

//end