# Spacemacs 使用手册 #

## 基础 ##

### 获取键绑定 ###

可以使用 *which-key-show-top-level* 函数获取当前模式的键绑定.

## org layer ##

记录一些 org layer 使用过程中的方法及快捷键.

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| <s TAB | 快捷输入代码段 |  |
| <e TAB | 快捷输入示例段 |  |
| ,' | 编辑代码段 |  |
| ,, | 退出编辑代码段 |  |
| SPC m h (1..4, n) | 快捷输入标题, 其中 1..4 为1至4级标题, n 为通过参数输入标题级别, 自定义快捷键 |  |
| M-x org-toggle-link-display | 转换链接显示方式 | 例如将链接形式的转换为普通文本显示, 以便编辑说明或链接地址 |

## 其他 ##

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| SPC b I | 打开IBuffer, 列出所有打开的 Buffer | |
| SPC f j | 进入 Dired | |
| SPC ' | 打开 shell | |

## IBuffer ##

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| d | 标记Buffer为删除 | |
| x | 执行标记 | |
| q | 退出 IBuffer | |

## Dired-mode ##

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| + | 创建目录 | |
| g | 刷新目录 | |
| C | 拷贝文件 | |
| D | 删除文件 | |
| R | 重命名文件 | |
| d | 标记删除 | |
| u | 取消标记 | |
| x | 执行所有标记 | |

## shell layer ##

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| SPC m c | 再打开一个shell, multi-term 模式下生效 | |

## Abbrev-mode ##

| 快捷键 | 说明 | 示例 |
|:--|:--|:--|
| ESC | 输入一个缩写后, 按下该键进行替换 | |
