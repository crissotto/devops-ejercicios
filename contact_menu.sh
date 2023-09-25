#!/bin/bash

# Declaración del nombre del archivo de contactos
CONTACT_FILE="contacts.txt"

# Verifica si el archivo de contactos existe; si no, créalo en la carpeta actual
if [ ! -e "$CONTACT_FILE" ]; then
    touch "$CONTACT_FILE"
    echo "File created: $CONTACT_FILE"
fi

# Resto del código del menú y funciones ...



menu(){

	clear
	echo "Contact Menu"
	echo "1. Create a new contact"
	echo "2. Search by any field"
	echo "3. Help"
	echo "4. Quit"
	echo -e "Enter the option: \c"
}


create_contact(){

	clear
	echo "Create a new Contact"
	echo -e "Enter name: \c"
	read name
	echo -e "Enter email: \c"
	read email
	echo -e "Enter phone: \c"
	read phone
	echo "$name, $email, $phone" >> "$CONTACT_FILE"
	echo "Great! the contact has been created!"
	sleep 5	
	menu
}


help_menu(){

	clear
	echo "Help Menu"
	echo "Press 1 to create a new contact"
	echo "Press 2 to search for a contact"
	echo "Press 3 to display this help menu"
	echo "Press 4 to quit"
	read -p "Press Enter to continue"
}


search_menu() {

	clear
	echo "Search contacts"
	echo -e "Enter a search term: \c"
	read search_term
	grep -i "$search_term" "$CONTACT_FILE"
	sleep 5
	menu
}



while true; do 
	menu
	read choice
	case "$choice" in 
	1)
		create_contact
		;;
	2)
		search_menu
		;;
	3)
		help_menu
		;;
	4)
		echo "Bye!"
		exit 0
		;;
	*)
		echo "Wrong option"
		read -p "Press enter to continue"
	esac
done
