# ReconFlow

**ReconFlow** - Recon flow inspired by Jason Haddix and Ben Sadeghipour (Nahamsec)



<p align="left">
  <B>Warning: Not for illeagal use. Don't be that person!! Get paid for being awesome legally
The code is not perfect, just like me or you. Feel free to modify the code when you clone it.
This is a bash script with a little Python3.
    </B>
</p>


## Installation

```
1. git clone https://github.com/rollieolie/ReconFlow.git
2. cd ReconFlow
3. run ./copy_touserbin.sh - copies programs I created to /usr/bin/$programName so they can run onces called in main program
4. If you don't want to do that you can mannually change the programs path in main program or how you please
5. To run it - ./ReconFlow -h for options or copy to /usr/bin/ then ReconFlow -h
6. Don't forget to add sudo if needed and to chmod +x $program when needed
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




### Using ReconFlow
  
  ```shell
  
  Usage:
    ./ReconFlow.sh or ReconFlow (if copied to /usr/bin/)
  Flags:
    -h     Forget how is works? Go ahead and ask for help :).
    -s     To do anything at all you need this option and promgramScope.txt (scope = url or list of urls in scope from program page)
    -c     Takes your alive.txt(hosts) and finds status codes of all and groups then in txt files in it's own directory.
    -g     Takes your alive.txt and runs fff and saves responses headers and body. Then GF responses for secrets and interesting info .
    -n     Runs Nuclei from alive.txt file.
    -w     Go ahead and make a wordlist.
    -P     Web screen shots for your pleasure.
    -p     Do some port scanning with naabu.
    -a     If you want all of the above.
  
  ```
  ## Examples
  
  ### Default usage
  ```
  ./ReconFlow.sh -s /path/to/ProgramScope.txt
  ```
  
  ### Other usages
  
  ```
  If you already have a all.txt, alive.txt and you are in the directory with files : ./ReconFlow.sh [flag c-p] or [flag -a]
  
  ```
  
### Last but not least, thank you to the amazing creators of these amazing tools and to the content creators or web app security.  
