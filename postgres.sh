yum -y update
yum -y install wget
PG_PASSWORD=${1-'postgres'}
POSTGRES_VERSION=9.6.5
# POSTGRES_FILE=postgresql-$POSTGRES_VERSION-1-linux-x64-binaries.tar.gz
# POSTGRES_URL=https://get.enterprisedb.com/postgresql/$POSTGRES_FILE
POSTGRES_FILE=postgresql-$POSTGRES_VERSION-1-linux-x64.run
POSTGRES_URL=https://get.enterprisedb.com/postgresql/$POSTGRES_FILE
DIR=/opt
POSTGRES_HOME=$DIR/postgres/$POSTGRES_VERSION
PGDATA=$POSTGRES_HOME/data
cd $DIR
echo "Downloading $POSTGRES_URL"
echo ""
wget $POSTGRES_URL
chmod +x $POSTGRES_FILE
# tar xzf $POSTGRES_FILE
echo "export PGDATA=$PGDATA" >> /etc/profile.d/postgres_envs.sh
echo "export PATH=$PATH:$POSTGRES_HOME/bin" >> /etc/profile.d/postgres_envs.sh
mkdir /var/log/postgresql
CMD="./$POSTGRES_FILE --mode unattended --prefix $POSTGRES_HOME --serverport 5432 --datadir $PGDATA --superpassword $PG_PASSWORD"
$CMD
echo "Now you can start your cluster running this command:"
echo "chown -R postgres:postgres $POSTGRES_HOME"
echo "chown -R postgres:postgres /var/log/postgresql/"
echo "su postgres -c \"pg_ctl start -D $PGDATA -l /var/log/postgresql/postgresql-$POSTGRES_VERSION.log\""
