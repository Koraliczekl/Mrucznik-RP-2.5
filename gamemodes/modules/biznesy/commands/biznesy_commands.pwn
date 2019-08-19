//------------------------------------------<< Generated source >>-------------------------------------------//
//-----------------------------------------------[ Commands ]------------------------------------------------//
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
// Kod wygenerowany automatycznie narz�dziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTAN� NADPISANE PO WYWO�ANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


#include <YSI\y_hooks>

//-------<[ include ]>-------
#include "bizinfo\bizinfo.pwn"
#include "bizlock\bizlock.pwn"
#include "bpracownicy\bpracownicy.pwn"
#include "dajbiznes\dajbiznes.pwn"
#include "gotobiz\gotobiz.pwn"
#include "kupbiznes\kupbiznes.pwn"
#include "sprzedajbiznes\sprzedajbiznes.pwn"
#include "zabierzbiznes\zabierzbiznes.pwn"
#include "zlomujbiznes\zlomujbiznes.pwn"


//-------<[ initialize ]>-------
hook OnGameModeInit()
{
    command_bizinfo();
    command_bizlock();
    command_bpracownicy();
    command_dajbiznes();
    command_gotobiz();
    command_kupbiznes();
    command_sprzedajbiznes();
    command_zabierzbiznes();
    command_zlomujbiznes();
    
}