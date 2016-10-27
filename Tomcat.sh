apt-get update -y 
/usr/bin/apt-get install default-jdk -y 
wget http://mirrors.ibiblio.org/apache/tomcat/tomcat-8/v8.5.6/bin/apache-tomcat-8.5.6.tar.gz
tar xzvf apache-tomcat-8.5.6.tar.gz
mv  apache-tomcat-8.5.6 /opt/tomcat
sed -i '$d' /opt/tomcat/conf/tomcat-users.xml
echo '<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status, admin-gui, admin-script"/>' >> /opt/tomcat/conf/tomcat-users.xml
echo '</tomcat-users>' >> /opt/tomcat/conf/tomcat-users.xml
sed -i -e 's/<Valve/<!--<Valve/' /opt/tomcat/webapps/manager/META-INF/context.xml
sed -i -e 's#/>#/>-->#'  /opt/tomcat/webapps/manager/META-INF/context.xml
sed -i -e 's/<Valve/<!--<Valve/' /opt/tomcat/webapps/host-manager/META-INF/context.xml
sed -i -e 's#/>#/>-->#'   /opt/tomcat/webapps/host-manager/META-INF/context.xml
cd /opt/tomcat/bin
./startup.sh
