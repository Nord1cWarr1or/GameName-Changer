#include <amxmodx>
#include <reapi>

new const PLUGIN_VERSION[] = "1.0.0";

new g_pCvarGameName;

public plugin_init()
{
    register_plugin("GameName Changer", PLUGIN_VERSION, "Nordic Warrior");

    g_pCvarGameName = register_cvar("amx_gamename", "Counter-Strike");

    hook_cvar_change(g_pCvarGameName, "OnCvarChange");

    new szGameName[64];
    get_pcvar_string(g_pCvarGameName, szGameName, charsmax(szGameName));

    set_member_game(m_GameDesc, szGameName);
}

public OnCvarChange(pCvar, const szOldValue[], const szNewValue[])
{
    set_member_game(m_GameDesc, szNewValue);

    log_amx("GameName has been changed to ^"%s^"", szNewValue);
}