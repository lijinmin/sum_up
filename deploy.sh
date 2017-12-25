# 打开 boot2docker 到私有注册库的 SSH 连接
boot2docker ssh "ssh -o 'StrictHostKeyChecking no' -i /Users/username/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@your-registry.com &" &
# 在推送前先确认该 SSH 通道是开放的。
echo Waiting 5 seconds before pushing image.
echo 5...  
sleep 1  
echo 4...  
sleep 1  
echo 3...  
sleep 1  
echo 2...  
sleep 1  
echo 1...  
sleep 1
# Push image onto remote registry / repo
echo Starting push!  
docker push localhost:5000/username/weixin_cor 