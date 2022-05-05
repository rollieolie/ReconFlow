# ReconFlow

**ReconFlow** - Recon flow inspired by Jason Haddix and Ben Sadeghipour (Nahamsec)



<p align="left">
  <B>Warning: Not for illeagal use. Don't be that person!! Get paid for being awesome legally
The code is not perfect, just like me or you. Feel free to modify the code when you clone it.
This is a bash script with a little Python3.
    </B>
</p>


## Installation

```* git clone https://github.com/rollieolie/ReconFlow.git
* cd ReconFlow
* run ./copy_touserbin.sh - copies programs I created to /usr/bin/$programName so they can run onces called in main program
* If you don't want to do that you can mannually change the programs path in main program or how you please
* To run it - ./ReconFlow -h for options or copy to /usr/bin/ then ReconFlow -h
* Don't forget to add sudo if needed and to chmod +x $program when needed
```

## Features and programs wrapped up

**Programs used in my wrapper, where to get them, and who it's made by:**

- assetfinder - https://github.com/tomnomnom/assetfinder - Tomnomnom (AKA Inspector Gadget of Web App Bug Hunting)

- subfinder - https://github.com/projectdiscovery/subfinder - Projectdiscovery 

- subs - Comes with ReconFlow package uses jq (must download)

- crtsh - Comes with ReconFlow package (shell program wrapped around a python3 program) Install python3 and pip3 install -r requierments.txt

- amass - https://github.com/OWASP/Amass  - Jeff Foley and OWASP

- github-search - https://github.com/gwen001/github-search - gwen001 - need github api token

- httpx - https://github.com/projectdiscovery/httpx - Projectdiscovery

- fff - https://github.com/tomnomnom/hacks -Worth to download all the hacks  - Tomnomnom (AKA Inspector Gadget of Web App Bug Hunting) 

- gf and gf added gf files - https://github.com/tomnomnom/gf - tomnomnom and https://github.com/1ndianl33t/Gf-Patterns 1ndianl33t

- Nuclei (standard templates) - https://github.com/projectdiscovery/nuclei - Projectdiscovery

- meg -https://github.com/tomnomnom/meg - Tomnomnom (AKA Inspector Gadget of Web App Bug Hunting)

- gauplus - https://github.com/bp0lr/gauplus - bp0lr

- waybackurls - https://github.com/tomnomnom/waybackurls - Tomnomnom (AKA Inspector Gadget of Web App Bug Hunting)

- EyeWitness - https://github.com/FortyNorthSecurity/EyeWitness - ChrisTruncer/FortyNorthSecurity

- naabu - https://github.com/projectdiscovery/naabu - Projectdiscovery

- nmap -  apt install nmap or https://github.com/nmap/nmap nmap.org

- jq - https://stedolan.github.io/jq/download/

- python3 - https://docs.python-guide.org/starting/install3/linux/

When using these programs I have it setup so all I have to do is call the program (ex: cat alive.txt | assetfinder or amass enum -df <input.txt>). The Go programs mostly allow for you to call them without including path. The programs I created you have a few options. You can" cd /usr/bin; vim or nano subs and copy code to subs; chmod +x subs or cd /path/to/ReconFlow; cp subs.py /usr/bin/subs chomd +x /usr/bin/subs; or change my code from ReconFlow.sh to call the program from path(ex: Python3 ~/tools/ReconFlow/subs.py 'input'. I have also added a program copy_tousrbin.sh to do this for you.


### Using ReconFlow
  1. git clone https://github.com/rollieolie/ReconFlow.git
  2. cd ReconFlow
  3. Make sure all programs needed are downloaded
  4. copy subs.py, crtypy.py, and crtsh.sh to /usr/bin/(program name) or run ./copy_tousrbin.sh
  5. Update your console,python3, and pip3
  6. pip3 install -r requierments.txt or cat requierments.txt | xargs -I{} pip3 install {}
  7. ./ReconFlow.sh -h (shows you how to use the tool)
  8. ./ReconFlow.sh -s /path/to/ProgramScope.txt -c -g -n-w -P -p or -a
  9. Note that the tool does not have to have all of these options listed above. Default use: ./ReconFlow -s /path/to/ProgramScope.txt
  10. This program will run as fast as the programs used. If you have a lot of domains, it could take awhile. Go do some google/github/gitlab/shodan dorking while waiting.
  11. Any programs you don't want to install or use, you can vim or nano into ReconFlow.sh and add # to the program you don't want to use or download.
  12. Last tid bit...if you are not root on your terminal add 'sudo' to the command.
  

### Last but not least, thank you to the amazing creators of these amazing tools and to all the content creators.  
