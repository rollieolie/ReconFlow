#!/bin/bash
#add your own github key or put a # infront

echo alienvault
echo -----------------------------------
curl -s "https://otx.alienvault.com/otxapi/indicators/domain/passive_dns/$1" | jq '.passive_dns[].hostname' | sed 's/\"//g';
echo certspotter
echo ----------------------------------
curl -s "https://api.certspotter.com/v1/issuances?domain=$1&include_subdomains=true&expand=dns_names&expand=issuer&expand=cert" | jq '.[].dns_names[]'| sed 's/\"//g' | sed 's/\*\.//g';
echo dnsdump
echo ---------------------------------
curl -s "https://api.hackertarget.com/hostsearch/?q=$1" | cut -d ',' -f 1;
echo threatcrowd
echo --------------------------------
curl -s "https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$1" | jq '.subdomains[]' | sed 's/\"//g';
echo shodan
echo ---------------------------------
curl -s -X GET "https://api.shodan.io/dns/domain/$1?key=Github_ApiToken" | jq '.data[].subdomain' | sed 's/\"//g' | tee subdos.txt;
cat subdos.txt | xargs -I{} echo {}.$1;
echo sonar
echo ------------------------------------
curl -s "https://sonar.omnisint.io/subdomains/$1?page=1" | jq '.[]' | sed 's/"//g';
echo threatminer
echo -------------------------------------
curl -s "https://api.threatminer.org/v2/domain.php?q=$1&rt=5&api=true" | jq '.results[]' | sed 's/"//g';

rm subdos.txt;
