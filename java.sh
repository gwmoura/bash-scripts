yum -y update
yum -y install wget
UPDATE_VERSION=144
JDK_VERSION=8u$UPDATE_VERSION
BUILD=01
FILE_NAME=jdk-$JDK_VERSION-linux-x64.tar.gz
JAVA_PATH=jdk1.8.0_$UPDATE_VERSION
DIR=/opt
cd $DIR
JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-b$BUILD/090f390dda5b47b9b721c7dfaa008135/$FILE_NAME
echo "Downloading $JAVA_URL"
echo ""
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JAVA_URL"
tar xzf $FILE_NAME
touch /etc/profile.d/java_envs.sh
chmod +x /etc/profile.d/java_envs.sh
JAVA_HOME=/opt/$JAVA_PATH
JRE_HOME=$JAVA_HOME/jre
echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile.d/java_envs.sh
echo "export JRE_HOME=$JRE_HOME" >> /etc/profile.d/java_envs.sh
echo "export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" >> /etc/profile.d/java_envs.sh
