#! /bin/sh
  
# 下文中的 cd 后面的地址都是我服务器的地址，根据自己情况进行修改

dir=`pwd`
echo "pwd: $dir"

if [ ! -d "testcicd/" ]; then
    cd /app/simpleProject
    echo "开始克隆代码"
    git clone git@github.com:wangzhongyi1/testcicd.git
    echo "克隆代码结束"
    cd /app/simpleProject/testcicd/project1
    yarn
    yarn build
    cp -r /app/simpleProject/testcicd/project1/dist/* -t /usr/local/nginx/html
else
    echo "文件夹已存在"
    cd /app/simpleProject/testcicd
    echo "开始拉取代码"
    git pull origin main
    echo "拉取代码结束"
    cd /app/simpleProject/testcicd/project1/project1
    yarn
    yarn build
    cp -r /app/simpleProject/testcicd/project1/dist/* -t /usr/local/nginx/html
fi