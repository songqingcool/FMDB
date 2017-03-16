# FMDB
FMDB的简单封装framework静态库

FMDB源代码(https://github.com/ccgus/fmdb) 下载日期 2017年3月16日18:38:28

cocoapods下载sqlite3.h,sqlite3.c文件
1、安装cocoapods
2、创建一个xcode工程
3、xcode工程文件目录下创建Podfile,并编辑内容如下,其中dd为xcode工程名
platform:ios,'8.0'
target "dd" do
pod 'FMDB/SQLCipher','~>2.6.2'
end
4、xcode工程文件目录下执行命令 pod install,下载可能有点慢


clone项目之后直接运行FMDBAgg即可得到编译好的FMDB.framework(真机和模拟器)

1、iOS8以上

2、支持bitcode

3、实现了SQLCipher数据库加密

