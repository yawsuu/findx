#! /bin/bash
# Sub-Domain Finder from HTTPS Certificate
# Link 			: https://crt.sh/
# Written By 	: Wai Yan Myo Thet(RDX)
# Date 			: 9.3.2018
echo "==============================================="
echo "___________.__            .___        ____  ___"
echo "\_   _____/|__| ____    __| _/        \   \/  /"
echo " |    __)  |  |/    \  / __ |  ______  \     / "
echo " |     \   |  |   |  \/ /_/ | /_____/  /     \ "
echo " \___  /   |__|___|  /\____ |         /___/\  \\"
echo "     \/            \/      \/               \_/"
echo "-----------------------------------------------"
echo -e "\x1B[31m Sub-Domain Finder v.0.1      wai yan myo thet\x1B[0m"
echo "-----------------------------------------------"
if [ $# -eq 0 ]
then
echo -e "\x1B[01;93m[+] Usage: $0 <domain-name>\x1B[0m"
echo -e "\x1B[01;91m[!] Make sure already installed jq>\x1B[0m"
exit 0
fi
# Abusing crt.sh site to get certificate dump
url='https://crt.sh/?q=%.'$1'&output=json'
echo
echo -e "[!] Finding Sub-Domains for \x1B[01;92m$1\x1B[0m"
curl -s $url |jq '.name_value'|sort -u|cut -d '"' -f2
exit 0

