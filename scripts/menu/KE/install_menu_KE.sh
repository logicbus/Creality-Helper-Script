#!/bin/sh

set -e

function install_menu_ui_ke() {
  top_line
  title '[ INSTALL MENU ]' "${yellow}"
  inner_line
  hr
  subtitle '•ESSENTIALS:'
  menu_option ' 1' 'Install' 'Moonraker and Nginx'
  menu_option ' 2' 'Install' 'Fluidd (port 4408)'
  menu_option ' 3' 'Install' 'Mainsail (port 4409)'
  hr
  subtitle '•UTILITIES:'
  menu_option ' 4' 'Install' 'Entware'
  menu_option ' 5' 'Install' 'Klipper Gcode Shell Command'
  hr
  subtitle '•IMPROVEMENTS:'
  menu_option ' 6' 'Install' 'Improved Shapers Calibrations'
  menu_option ' 7' 'Install' 'Save Z-Offset Macros'
  menu_option ' 8' 'Install' 'Virtual Pins Support'
  menu_option ' 9' 'Install' 'Git Backup'
  hr
  subtitle '•CAMERA:'
  menu_option '10' 'Install' 'Moonraker Timelapse'
  hr
  subtitle '•REMOTE ACCESS AND AI DETECTION:'
  menu_option '11' 'Install' 'OctoEverywhere'
  menu_option '12' 'Install' 'Moonraker Obico'
  menu_option '13' 'Install' 'Mobileraker Companion'
  hr
  inner_line
  hr
  bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
  bottom_menu_option 'q' 'Exit' "${darkred}"
  hr
  version_line "$(get_script_version)"
  bottom_line
}

function install_menu_ke() {
  clear
  install_menu_ui_ke
  local install_menu_opt
  while true; do
    read -p " ${white}Type your choice and validate with Enter: ${yellow}" install_menu_opt
    case "${install_menu_opt}" in
      1)
        if [ -d "$MOONRAKER_FOLDER" ]; then  
          error_msg "Moonraker and Nginx are already installed!"
        else
          run "install_moonraker_nginx" "install_menu_ui_ke"
        fi;;
      2)
        if [ -d "$FLUIDD_FOLDER" ]; then  
          error_msg "Fluidd is already installed!"
        elif [ ! -d "$MOONRAKER_FOLDER" ] && [ ! -d "$NGINX_FOLDER" ]; then
          error_msg "Moonraker and Nginx are needed, please install them first!"
        else
          run "install_fluidd" "install_menu_ui_ke"
        fi;;
      3)
        if [ -d "$MAINSAIL_FOLDER" ]; then  
          error_msg "Mainsail is already installed!"
        elif [ ! -d "$MOONRAKER_FOLDER" ] && [ ! -d "$NGINX_FOLDER" ]; then
          error_msg "Moonraker and Nginx are needed, please install them first!"
        else
          run "install_mainsail" "install_menu_ui_ke"
        fi;;
      4)
        if [ -f "$ENTWARE_FILE" ]; then
          error_msg "Entware is already installed!"
        else
          run "install_entware" "install_menu_ui_ke"
        fi;;
      5)
        if [ -f "$KLIPPER_SHELL_FILE" ]; then
          error_msg "Klipper Gcode Shell Command is already installed!"
        else
          run "install_gcode_shell_command" "install_menu_ui_ke"
        fi;;
      6)
        if [ -d "$IMP_SHAPERS_FOLDER" ]; then
          error_msg "Improved Shapers Calibrations are already installed!"
        elif [ -d "$GUPPY_SCREEN_FOLDER" ]; then
          error_msg "Guppy Screen already has these features!"
        elif [ ! -f "$KLIPPER_SHELL_FILE" ]; then
          error_msg "Klipper Gcode Shell Command is needed, please install it first!"
        else
          run "install_improved_shapers" "install_menu_ui_ke"
        fi;;
      7)
        if [ -f "$SAVE_ZOFFSET_FILE" ]; then
          error_msg "Save Z-Offset Macros are already installed!"
        else
          run "install_save_zoffset_macros" "install_menu_ui_ke"
        fi;;
      8)
        if [ -f "$VIRTUAL_PINS_FILE" ]; then
          error_msg "Virtual Pins Support is already installed!"
        else
          run "install_virtual_pins" "install_menu_ui_ke"
        fi;;
      9)
        if [ -f "$GIT_BACKUP_FILE" ]; then
          error_msg "Git Backup is already installed!"
        elif [ ! -f "$ENTWARE_FILE" ]; then
          error_msg "Entware is needed, please install it first!"
        elif [ ! -f "$KLIPPER_SHELL_FILE" ]; then
          error_msg "Klipper Gcode Shell Command is needed, please install it first!"
        else
          run "install_git_backup" "install_menu_ui_ke"
        fi;;
      10)
        if [ -f "$TIMELAPSE_FILE" ]; then
          error_msg "Moonraker Timelapse is already installed!"
        elif [ ! -f "$ENTWARE_FILE" ]; then
          error_msg "Entware is needed, please install it first!"
        else
          run "install_moonraker_timelapse" "install_menu_ui_ke"
        fi;;
      11)
        if [ -d "$OCTOEVERYWHERE_FOLDER" ]; then
          error_msg "OctoEverywhere is already installed!"
        elif [ ! -d "$MOONRAKER_FOLDER" ]; then
          error_msg "Moonraker and Nginx are needed, please install them first!"
        elif [ ! -d "$FLUIDD_FOLDER" ] && [ ! -d "$MAINSAIL_FOLDER" ]; then
          error_msg "Fluidd or Mainsail is needed, please install it first!"
        elif [ ! -f "$ENTWARE_FILE" ]; then
          error_msg "Entware is needed, please install it first!"
        else
          run "install_octoeverywhere" "install_menu_ui_ke"
        fi;;
      12)
        if [ -d "$MOONRAKER_OBICO_FOLDER" ]; then
          error_msg "Moonraker Obico is already installed!"
        elif [ ! -d "$MOONRAKER_FOLDER" ]; then
          error_msg "Moonraker and Nginx are needed, please install them first!"
        elif [ ! -d "$FLUIDD_FOLDER" ] && [ ! -d "$MAINSAIL_FOLDER" ]; then
          error_msg "Fluidd or Mainsail is needed, please install it first!"
        elif [ ! -f "$ENTWARE_FILE" ]; then
          error_msg "Entware is needed, please install it first!"
        else
          run "install_moonraker_obico" "install_menu_ui_ke"
        fi;;
      13)
        if [ -d "$MOBILERAKER_COMPANION_FOLDER" ]; then
          error_msg "Mobileraker Companion is already installed!"
        else
          run "install_mobileraker_companion" "install_menu_ui_ke"
        fi;;
      B|b)
        clear; main_menu; break;;
      Q|q)
         clear; exit 0;;
      *)
        error_msg "Please select a correct choice!";;
    esac
  done
  install_menu_ke
}
