cd /home/jnapp/deploy
deploy_file="scheduler-server-bin.tar.gz"
if [ -f $deploy_file ]; then
	echo "   "
	echo "deploy file  $deploy_file"
	echo "unzip deploy file  ......"
		tar xvf  $deploy_file
	echo "unzip deploy file  success"
fi

export serverCtl=/home/jnapp/deploy/scheduler-server
echo "   "
echo "###########################"
echo "####  restart scheduler ###"
echo "###########################"
echo "   "
echo "ServerId=scheduler :" `ps -ef|grep 'ServerId=scheduler' |grep -v "grep" |awk '{print $2}'`
ps -ef|grep 'ServerId=scheduler' |grep -v "grep" |awk '{print $2}' |xargs kill -9

cd ${serverCtl}

sh start-scheduler.sh &

echo "   "
echo "###########################"
echo "####  restart OK  #########"
echo "###########################"

DATE=`date +%Y%m%d%H%M%S`
export backup_dir=${HOME}/backup
backup_file="${HOME}/deploy/$deploy_file"
if [ ! -d $backup_dir ]; then
    mkdir -p $backup_dir
fi

if [ -f $backup_file ]; then
	echo "   "	
	echo "backup deploy file  ......"
		mv $backup_file ${backup_dir}/$deploy_file.bak$DATE
	echo "backup deploy file  success"
fi