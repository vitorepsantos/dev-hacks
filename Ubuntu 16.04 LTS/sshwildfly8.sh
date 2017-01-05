#!/bin/bash

# Fast setup for local development.

# sudo sh sshwildfly8.sh

# Install & Setup wildfly

cd /opt
sudo wget http://download.jboss.org/wildfly/8.2.1.Final/wildfly-8.2.1.Final.zip -P /opt/
sudo unzip /opt/wildfly-8.2.1.Final.zip -d /opt/
sudo ln -s /opt/wildfly-8.2.1.Final /opt/wildfly
sudo useradd --system --shell /bin/false wildfly
sudo rm -f wildfly-8.2.1.Final.zip

sudo cp /opt/wildfly/bin/init.d/wildfly.conf /etc/default/wildfly 

{  <<< ========== WARING: "wildfly.conf" turns into "/etc/default/wildfly" without ".conf"! ========== >>>  }

sudo cp /opt/wildfly/bin/init.d/wildfly-init-debian.sh /etc/init.d/wildfly
sudo chown root:root /etc/init.d/wildfly
sudo chmod +x /etc/init.d/wildfly
sudo update-rc.d wildfly defaults
sudo update-rc.d wildfly enable
sudo mkdir -p /var/log/wildfly
sudo chown -R wildfly:wildfly /opt/wildfly-8.2.1.Final/
sudo chown -R wildfly:wildfly /opt/wildfly
sudo chown -R wildfly:wildfly /var/log/wildfly

sudo nano /etc/default/wildfly

- edit wildfly

sudo usermod -a -G wildfly root
sudo chmod -R 775 /opt

sudo service wildfly start

# service wildfly status

# Setup DB Driver Module

sudo wget https://jdbc.postgresql.org/download/postgresql-9.1-903.jdbc4.jar -P /opt/resources

cd /opt/wildfly/bin
sudo sh jboss-cli.sh 

{  <<< ========== WARING: wildfly service must be "active (running)"! ========== >>>  }

- [disconnected /] connect 

{  <<< ========== Expected: [standalone@localhost:9990 /] ========== >>>  }

- [standalone@localhost:9990 /] module add --name=org.postgres --resources=/opt/resources/postgresql-9.1-903.jdbc4.jar --dependencies=javax.api,javax.transaction.api
- [standalone@localhost:9990 /] /subsystem=datasources/jdbc-driver=postgres:add(driver-name="postgres",driver-module-name="org.postgres",driver-class-name=org.postgresql.Driver)

{  <<< ========== Expected: {"outcome" => "success"} ========== >>>  }

- [standalone@localhost:9990 /] data-source add --jndi-name=java:/<schemaname> --name=PostgrePool --connection-url=jdbc:postgresql://<url>/<dbname> --driver-name=postgres --user-name=<username> --password=<username>
- [standalone@localhost:9990 /] quit

# Setup Wildfly security-realm user

cd /opt/wildfly/bin
sudo sh add-user.sh
- (a): a
- Username : <user-name>
- Password : <password>
- Are you sure you want to use the password entered yes/no? yes
- Re-enter Password : <password>
- What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]: <leave-it-blank>
- Is this new user going to be used for one AS process to connect to another AS process?
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? no

# Setup DB AJP listeners

cd /opt/wildfly/bin
sudo sh jboss-cli.sh

{  <<< ========== WARING: wildfly service must be "active (running)"! ========== >>>  }

- [disconnected /] connect 

{  <<< ========== Expected: [standalone@localhost:9990 /] ========== >>>  }

- [standalone@localhost:9990 /] /subsystem=undertow/server=default-server:read-children-names(child-type=ajp-listener)
- [standalone@localhost:9990 /] /subsystem=undertow/server=default-server/ajp-listener=*:read-resource(recursive=true)
- [standalone@localhost:9990 /] /socket-binding-group=standard-sockets/socket-binding=ajp:add(port=8009)
- [standalone@localhost:9990 /] /subsystem=undertow/server=default-server/ajp-listener=myListener:add(socket-binding=ajp, scheme=http, enabled=true)

- [standalone@localhost:9990 /] quit