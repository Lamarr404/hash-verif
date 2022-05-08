#!/bin/bash

name=$1		# Je déclare ma variable $name avec l'entrée du premier parametre
find_name=$(find /* -name $name -type f 2>/dev/null | grep -o '[^/]*$')	# Je lance la commande find avec ma variable $name comme nom ensuite j'utilise la commande grep -o pour ne renvoyer que le dernier champ de la recherche sans la racine cette commande est stockée dans $find_name 
md5=$(md5sum $find_name | cut -d " " -f 1)		# Dans $md5 je stocke la commande qui me donne le hash de mon iso, j'utilise cut pour ne garder que le hash
hash=$2		# Dans ma variable $hash je stocke le deuxieme parametre indiqué lors de l'éxécution du script: le hash officielle

if [[ "$md5" == "$hash" ]]; then	# Je crée une condition if pour tester la similitudes des deux hash
	echo "equal"
else
	echo "not equal"
fi
