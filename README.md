## Build image
```
build.sh
```

## Push image
```
push.sh.sh
```

## RUN image from Docker
```
docker run -d c00cjz00/c00cjz00_cuda11.8_pytorch:2.1.2-cuda11.8-cudnn8-devel-llama_factory_v1
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