yum -y update
yum -y install wget
WILDFLY_VERSION=10.1.0.Final
WILDFLY_FILE=wildfly-$WILDFLY_VERSION.tar.gz
DIR=/opt
cd $DIR
WILDFLY_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION/$WILDFLY_FILE
echo "Downloading $WILDFLY_URL"
echo ""
wget $WILDFLY_URL
tar xzf $WILDFLY_FILE
ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly
echo "export LAUNCH_JBOSS_IN_BACKGROUND=true" >> /etc/profile.d/wildfly_envs.sh
exec bash
