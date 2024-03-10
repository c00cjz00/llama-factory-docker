## build image
```
build.sh
```

## push image
```
push.sh.sh
```

## FIX
```
sudo vi /etc/apt/sources.list
deb http://th.archive.ubuntu.com/ubuntu jammy main    #添加该行到文件
sudo apt update
sudo apt install libc6
strings /lib/x86_64-linux-gnu/libc.so.6 |grep GLIBC_
```

## add apt
```
apt install libfontconfig  libaio-dev  libibverbs-dev jq
```
## addpip
```
pip install llmtuner==0.5.3 deepspeed==0.13.1  bitsandbytes==0.42.0 opencc opencc-python-reimplemented
```