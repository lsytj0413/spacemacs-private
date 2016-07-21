# lsytj0413的spacemacs私人配置
## 环境
* 操作系统: Ubuntu 16.04 TLS
* Emacs版本: Emacs24.5.1
使用一下代码安装即可:
    
        sudo apt-get install emacs
    
## 使用方法

1. 克隆spacemacs
        
        git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
        cd ~/.emacs.d
        git checkout --track origin/develop
        
2. 克隆本仓库

        git clont https://github.com/lsytj0413/spacemacs-private.git ~/.spacemacs.d
        ln -s ~/.spacemacs.d/.spacemacs ~/.spacemacs
        
3. 打开emacs即可, 等待package下载安装完成即可。

## 配置说明

1. 字体
我的配置使用了Source Code Pro字体, 安装方法如下:
    1. 下载字体
    在Github上面的项目主页上下载: [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/downloads)

    2. 解压
        
            unzip SourceCodePro_FontsOnly-1.103.zip
    得到一个目录.
    
    3. 复制.otf文件
        
            mkdir ~/.fonts
            cd SourceCodePro_FontsOnly-1.103
            cp ./OTF/* ~/.fonts/
            fc-cache -f -v
    
2. 我的配置使用了**ycmd-layer**，如果你不想使用则可以关闭。如需使用，则需要clone ycmd

        git clone https://github.com/Valloric/ycmd.git ~/ycmd
        cp -r ~/ycmd ~/.spacemacs.d/tools/ycmd

3. 我的配置中有一个**liter layer**，包含有自己的一些配置
   
   1. google-c-style
      
      我在编辑C++代码时使用的风格，其中将c-basic-offset修改为了4.
       
