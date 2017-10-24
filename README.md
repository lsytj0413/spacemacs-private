# lsytj0413的spacemacs私人配置

## 1: 环境

* 操作系统: Ubuntu 16.04 TLS
~~* Emacs版本: Emacs24.5.1~~
* Emacs版本: Emacs25.2.2

使用以下代码安装即可:

```
# sudo apt-get install emacs
# 因为 16.04 官方源中没有 Emacs25, 需要使用 PPA
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs25
```
    
## 2: 使用方法

1. 克隆spacemacs
```
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cd ~/.emacs.d
git checkout --track origin/develop
```

2. 克隆本仓库
```
git clone https://github.com/lsytj0413/spacemacs-private.git ~/.spacemacs.d
```

3. 打开emacs, 等待package下载安装完成即可。

## 3: 配置说明

### 3.1 字体

我的配置使用了**Source Code Pro**字体, 安装方法如下:
    
1. 下载字体

    在Github上面的项目主页上下载: [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/downloads), 或者使用以下代码:
```
wget https://github.com/downloads/adobe-fonts/source-code-pro/SourceCodePro_FontsOnly-1.013.zip
```

2. 解压

```
unzip SourceCodePro_FontsOnly-1.103.zip
```
得到一个目录.

3. 复制.otf文件

```
mkdir ~/.fonts
cd SourceCodePro_FontsOnly-1.103
cp ./OTF/* ~/.fonts/
fc-cache -f -v
```

### 3.2 ycmd

#### 3.2.1 ycmd-layer

我的配置使用了**ycmd-layer**，如果你不想使用则可以关闭。如需使用，则需要进行以下操作:

1. 编译ycmd
```
cd ~/.spacemacs.d
git submodule update --init --recursive
cd ./tools/ycmd
./build --clang-completer
```

2. clang
   
   编译时需要下载**clang for ubuntu16.04**, 比较耗时, 为节省时间可进行以下操作:
```
sudo apt-get install clang
vim cpp/ycm/CMakeLists.txt
```
   将**USE_SYSTEM_LIBCLANG**修改为**ON**即可.
3. 完成
   
   等待编译完成生成了ycm_core.so即可使用.

#### 3.2.2 YCM_Generator

为使用ycmd进行补全，还需要进行以下操作:

ycmd使用**.ycm_extra_conf.py**文件对补全进行相关配置, 我们可以使用**YCM_Generator**库来自动生成该文件.
    
1. clone YCM_Generator
```
git clone https://github.com/rdnetto/YCM-Generator.git
```

2. 生成配置文件
    
    **ycm_generator**支持cmake, make等, 需要你的工作目录有makefile等文件即可.
```
./config_gen.py DIR
```

3. 可能遇到的问题
   * 不支持C++11
     修改生成的**.ycm_extra_conf.py**文件, 在**flags**列表中加入**'-std=c++11'**即可。

### 3.3 liter

我的配置中有一个**liter layer**，包含有自己的一些配置
   
1. google-c-style
      
  我在编辑C++代码时使用的风格，其中将**c-basic-offset**修改为了4.
       
### 3.4 Search ###

使用Spacemacs中的搜索, 例如 ** SPC s a p** 需要安装 **ag**, 命令如下:

```
apt install silversearcher-ag
```

### go-layer ###

如果需要使用 **go-layer**, 需要使用以下命令安装工具包:

```
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
```

如果需要使用 **gometalinter**, 则首先修改 **init.el** 如下:

```
(go :variables go-use-gometalinter t)
```

然后安装工具包:

```
go get -u -v github.com/alecthomas/gometalinter
gometalinter --install --update
```

### python-layer ###

使用 **python-layer** 需要利用以下命令安装一些工具:

```
sudo pip install pylint
sudo pip install autoflake
sudo pip install anaconda-mode
sudo pip install isort
sudo pip install yapf
```

如果使用 **anaconda-mode** 的过程中出现如下错误:

```
Blocking call to accept-process-output with quit inhibited!!
```

则尝试使用以下命令修复:

```
pip install  jedi==0.8.1 json-rpc==1.8.1 service_factory==0.1.2
```

配置 **pylint** 的警告信息:

```
cd ~
pylint --generate-rcfile >.pylintrc
```

在 **disable** 中添加 C0103（或者 invalid-name) 即可关闭提示常量变量名或者模块名的错误.
在 **disable** 中添加 R0903 即可关闭提示Too Few method的错误.


## 4: 使用手册 ##

[使用手册](https://github.com/lsytj0413/spacemacs-private/blob/master/manual.md) 记录了一些常用的快捷键及其他的注意事项.
