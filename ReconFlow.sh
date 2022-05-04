#!/bin/bash
# remove the # and add github api token if you want to use it



#root domain function

root_domains(){
cat $1 | assetfinder --subs-only | tee -a roots.txt;
cat roots.txt | rev | cut -d'.' -f 1,2,3 | rev | tee rootdomains.txt;
cat rootdomains.txt | xargs -I{} echo {} | assetfinder | tee -a all.txt;
rm roots.txt;
rm rootdomains.txt;
}




#Subfinding function

FindSubs(){
cat $1 | assetfinder --subs-only | tee -a all.txt;
subfinder -dL $1 | tee -a all.txt;
cat $1 | xargs -I{} subs {} | sort -u | tee -a all.txt;
cat $1 | xargs -I{} crtsh {} | sort -u | tee -a all.txt;
amass enum -df $1 | tee -a all.txt;
#cat $1 | xargs -I{} toolsgithub-searchgithub=subdomains.py -t "Github_ApiToken" -d {} | tee -a all.txt;
amass enum -brute -df $1 | tee -a all.txt;
cat all.txt | httpx | tee -a alive.txt;
}

#Get the urls status codes
stats(){
mkdir stat_code
cd ./stat_code
cat ../alive.txt | fff -d 60 | tee -a stats.txt;
cat stats.txt | grep "200" | awk '{print $1}' | tee stats200.txt
cat stats.txt | grep "301" | awk '{print $1}' | tee stats301.txt
cat stats.txt | grep "302" | awk '{print $1}' | tee stats302.txt
cat stats.txt | grep "400" | awk '{print $1}' | tee stats400.txt
cat stats.txt | grep "401" | awk '{print $1}' | tee stats401.txt
cat stats.txt | grep "403" | awk '{print $1}' | tee stats403.txt
cat stats.txt | grep "500" | awk '{print $1}' | tee stats500.txt
cat stats.txt | grep "501" | awk '{print $1}' | tee stats501.txt
cat stats.txt | grep "502" | awk '{print $1}' | tee stats502.txt
cat stats.txt | grep "503" | awk '{print $1}' | tee stats503.txt
cd ..
}


#Gf function to find secrets

Gfin_stuff(){
httpx -l alive.txt -srd roots;
cd ./roots;
gf aws-keys | tee aws.txt;
gf base64  | tee 64.txt;
gf cors | tee cors.txt;
gf debug-pages | tee dbpgs.txt;
gf firebase  | tee fire.txt;
gf fw  | tee fw.txt;
gf go-functions  | tee gofu.txt;
gf http-auth  | tee httauth.txt;
gf ip  | tee ip.txt;
gf json-sec  | tee jsonsec.txt;
gf php-curl  | tee phpcurl.txt;
gf php-errors  | tee phperr.txt;
gf php-serialized  | tee phpserial.txt;
gf php-sinks  | tee phpsinks.txt;
gf php-sources  | tee phpsources.txt;
gf s3-buckets  | tee s3.txt;
gf sec  | tee sec.txt;
gf servers  | tee servers.txt;
gf strings  | tee strings.txt;
gf takeovers  | tee takeovers.txt;
gf upload-fields  | tee upload.txt;
gf urls  | tee urls.txt;
gf debug_logic | tee debuglogic.txt;
gf idor | tee idor.txt;
gf img-traversal | tee imgtrav.txt;
gf interestingEXT | tee intEXT.txt;
gf interestingparams | tee interparams.txt;
gf interestingsubs | tee interssubs.txt;
gf jsvar | tee jsvar.txt;
gf lfi | tee lfi.txt;
gf rce | tee rce.txt;
gf redirect | tee redirect.txt;
gf sqli | tee sqli.txt;
gf ssrf | tee ssrf.txt;
gf ssti | tee ssti.txt;
gf upload-fields | tee uploadsfields.txt;
gf xss | tee xss.txt;
find . -type f -empty -print -delete
cd ..
}


#nuclei stuff

NucleiStuff(){
cat alive.txt | nuclei -o nucleiresults.txt;
}



#Wordlist

LetsMake_Awordlist(){
mkdir wordlist;
cd ./wordlist;
meg /robots.txt ../alive.txt;
cd out;
grep -iEhro "(disallow: \/\w+\-\w+\/|disallow: \/\w+\-\w+\/\w+|disallow: \/\w+\/\w+\/\w+|disallow: \/\w+\/\w+|disallow: \/\w+|disallow: \w+)" | sort -u| awk '{print $2}' | tee ../wordlist.txt;
grep -iEhro "(disallow: \/\w+\-\w+\/|disallow: \/\w+\-\w+\/\w+|disallow: \/\w+\/\w+\/\w+|disallow: \/\w+\/\w+|disallow: \/\w+|disallow: \w+)" | sort -u| awk '{print $2}' | tok | tee -a ../wordlist.txt;

cd ..
cd ..
all.txt|gauplus | tok | head -n 3000 | tee -a ../wordlist.txt;
cat all.txt | waybackurls | tok | head -n 3000 | tee -a ../wordlist.txt;
}




#Screen shots of your assets
Snap_Apicture(){
mkdir Pics
cd Pics
cd ~/tools/EyeWitness/Python/./EyeWitness.py --web --no-prompt -f ../alive.txt;
}

#Need to scan some ports
Port_Junkie(){
naabu -l alive.txt -nmap-cli 'nmap -sV -O' | tee -a naabuPorts.txt
}









Help()
{
   # Display Help
   echo "Welcome to ReconFlow ! "
   echo
   echo "This tool is a wrapper for a Jason Haddix inspired recon flow"
   echo
   echo "I created this tool for Bug Bounty hunting/Pentesting Web apps for companies/clients that have given permission. "
   echo "Please don't be an asshole and use this for Black Hat/illeagal purposes. "
   echo
   echo "Seriously if you're good at hacking get paid for it legally. "
   echo
   echo "Syntax: scriptTemplate [-h|s|c|g|n|w|P|p|a]"
   echo "use: ./ReconFlow -s /path/to/ProgramScope.txt  or ./ReconFlow -a /path/to/ProgramScope.txt or ./ReconFlow -s /path/to/ProgramScope [options] (-c -g -n -w -P -p -a)"
   echo
   echo "options:"
   echo "-h     Forget how is works? Go ahead and ask for help :)."
   echo "-s     To do anything at all you need this option and promgramScope.txt (scope = url or list of urls in scope from program page) "
   echo "-c     Takes your alive.txt(hosts) and finds status codes of all and groups then in txt files in it's own directory."
   echo "-g     Takes your alive.txt and runs fff and saves responses headers and body. Then GF responses for secrets and interesting info ."
   echo "-n     Runs Nuclei from alive.txt file."
   echo "-w     Go ahead and make a wordlist."
   echo "-P     Web screen shots for your pleasure. "
   echo "-p     Do some port scanning with naabu. "
   echo "-a     If you want all of the above."
   echo
   echo "Go through README.MD to find out how to download all the cool tools used here ."
}

while getopts ":hscgnwPpa:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        s) # Just subs + it's the default option
            root_domains $2
            FindSubs $2
            exit;;
        c) # find status
            stats
            exit;;
        g) # GF the stuff
            Gfin_stuff
            exit;;
        n) # nuclei
            NucleiStuff
            exit;;
        w) # make a wordlist
            LetsMake_Awordlist
            exit;;
        P) #screen shot of assets
            Snap_Apicture
            exit;;
        p) #naabu port scan
            Port_Junkie
            exit;;
        a) #do all cool shit
            echo "This will take a few minutes! Go do some dorking"
            root_domains $2
            FindSubs $2
            Gfin_stuff
            NucleiStuff
            LetsMake_Awordlist
            Snap_Apicture
            Port_Junkie
            exit;;
        \?) # Invalid option
            echo "Error: Invalid option brahh! use -h for help"
            exit;;
    esac
done
