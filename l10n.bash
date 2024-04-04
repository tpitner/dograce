# app_name: dograce
app_name=$(basename "$0")

# Localize app
app_lang=$(echo $LANG | cut -d. -f1) # currently: cs_CZ.UTF-8

# Default to English if no appropriate language file is found
if [ -f "${app_name}_messages_${app_lang}" ]; then
    source "${app_name}_messages_${app_lang}"
else
    source "${app_name}_messages_en_US"
fi