# lsytj0413的spacemacs私人配置
## 使用方法

1. 克隆spacemacs
        
        git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
        cd ~/.emacs.d
        git checkout --track origin/develop
        
2. 克隆本仓库

        git clont https://github.com/lsytj0413/spacemacs-private.git ~/.spacemacs.d
        ln -s ~/.spacemacs.d/.spacemacs ~/.spacemacs
        
3. 打开emacs即可

## 配置说明
1. 我的配置使用了**ycmd-layer**，如果你不想使用则可以关闭。如需使用，则需要clone ycmd

        git clone https://github.com/Valloric/ycmd.git ~/ycmd
        cp -r ~/ycmd ~/.spacemacs.d/tools/ycmd

2. 我的配置中有一个**liter layer**，包含有自己的一些配置
   
   1. google-c-style
      
      我在编辑C++代码时使用的风格，其中将c-basic-offset修改为了4.
       
