 This is an application stack stack tested on Google Cloud Platform‎.

1. Create Docker Swarm with three nodes - one master, and two workers. 

2. Execute "stackdriver.sh" on all three nodes. The script will install a monitoring agent. 
p.s For monitoring I will use  Stackdriver. 

3. On master node execute "devops.sh". The script will: 
- Create "mysql_data" on a local machine
- Create "app" directory (for index.html file).
- Create and execute a docker-stack.yml file. 

4. Yaml file will include: 
- two images: 
       php:7.0-apache
       mysql:latest
- volumes
- networks
- ports
- passwords
- restart policy
- environment 

5. "docker service ls" gives us information about the status of the service. 
p.s. Wait till all replicas show "1/1" (it may take some time).

6. Open the terminal and execute "curl ifconfig.io".  The output will show your external IP address. Copy and go to the web browser. Paste it in URL. Another option is to open the terminal and "curl http:/localhost:80".   

7.  Enjoy! 
