```bash

 ,,
`""*$b..
     ""*$o.
         "$$o.
           "*$$o.
              "$$$o.
                "$$$$bo...       ..o:
                  "$$$$$$$$booocS$$$    ..    ,.
               ".    "*$$$$SP     V$o..o$$. .$$$b
                "$$o. .$$$$$o. ...A$$$$$$$$$$$$$$b
          ""bo.   "*$$$$$$$$$$$$$$$$$$$$P*$$$$$$$$:
             "$$.    V$$$$$$$$$P"**""*"'   VP  * "l                Tweak's Woefully Wonderful Command Line Tool Reference Library Thing:
               "$$$o.4$$$$$$$$X					                            Now you'll never need to look anywhere else
                "*$$$$$$$$$$$$$AoA$o..oooooo..           .b
                       .X$$$$$$$$$$$P""     ""*oo,,     ,$P
                      $$P""V$$$$$$$:    .        ""*****"
                    .*"    A$$$$$$$$o.4;      .
                         .oP""   "$$$$$$b.  .$;
                                  A$$$$$$$$$$P
                                  "  "$$$$$P"
                                      $$P*"
    mls                              .$"
                                     "
```


# INSTALLING STUFF FROM TERMINAL ON A MAC #

### Install things from command line

#### you can use ruby eval and passit a command object
`ruby -e "$(curl -fsSL https://raw.github.com/whatever.sh)"`

#### ...or you could be lazy and just use Brew
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget --with-libressl
```

#### ...you could also do more work, be sort of oldschool and use Macports
```bash
wget https://github.com/macports/macports-base/releases/download/v2.4.2/MacPorts-2.4.2.tar.gz

tar xzvf MacPorts-2.4.2.tar.gz

cd MacPorts-2.4.2

./configure && make && sudo make install
```

#	      TERRAFORM STUFF	            #

#### Dev/Deploy Process
This is the typical process flow of developing, tweaking, and deploying new or updated terraform code

1. Select the workspace you want to use and then initialize it
```bash
terraform workspace select <workspace>

terraform init
```

2. If you have tweaked anything in your terraform code, then use `terraform refresh` to tell terraform to apply the updates

*Note: use terraform refresh excplicitly like this only if you for some reason have it disabled in your terraform config (but why would you do that unless you're super anal retentive?)*
```bash
terraform refresh \
    --var-file=path-to-global.tfvars \
    --var-file=path-to-stage.tfvars 
```

1. Create the execution plan with `terraform plan`
```bash
terraform plan \
--var-file=path-to-global.tfvars \
--var-file=path-to-<env>.tfvars \
--var-file=path-to-<env>.tfvars --out=out.plan
```

4. Apply the execution plan with `terraform apply`
```bash
terraform apply out.plan
```

1. If you need to import variable files into the workspace, use `terraform import`
```bash
terraform import \
--var-file=path-to-global.tfvars \
--var-file=path-to-<env>.tfvars \
--var-file=path-to-<env>.tfvars \
```

#               PYTHON STUFF            #

### Install virtualenv for creating python runtime environment
```bash
pip install virtualenv
sudo pip3 install virtualenv
```

### Create a virtual runtime environment for running, testing, and debugging code that requires specific libraries
```bash
python -m virtualenv <env_name> --no-site-packages
```

### Activate the newly created runtime environment
```bash
source <env_name>/bin/activate
```

### Deactivate either when done with the envrionment or the project associated with the environment
```bash
deactivate
```

#	    				KOMMAND STUFF			      #

### Processs for debugging

#### Checking logs from particularly problematic docker containers
```bash
sudo docker ps -a | grep -i chatbot
	#	balkire@ip-10-0-7-68:~$ sudo docker ps -a | grep -i chatbot
	#	6db2afd3fc19        komand_chatbot/chatbot_slack:1.0.0   "/komand/plugins/bin…"   2 minutes ago       Exited (1) 2 minutes ago                        TRIGGER_message_cc96d876-bb94-40c9-bcd0-671c96d0d284
	#	5adfbd913a01        komand_chatbot/chatbot_slack:1.0.0   "/komand/plugins/bin…"   24 hours ago        Exited (1) 43 seconds ago                       ACTION-komand_chatbot-chatbot_slack-1.0.0-6b0bb9e1-0c2f-4034-9716-9274460d9cb1
```

```bash 
sudo docker logs -f <HASH>
```


#	     					MISC STUFF			      #

### Cronjob tasks

#### CTAP submissions

```cron
0 15 * * * cd /Users/balkire/eclipse-workspace/ar_automation/ && /Users/balkire/eclipse-workspace/pyenv_ctap/bin/python3 s3_fetch.py -O > /tmp/cronlog.txt 2>&1
```