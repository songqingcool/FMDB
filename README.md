# FMDB
FMDB的简单封装framework静态库

FMDB源代码(https://github.com/ccgus/fmdb) 下载日期 2017年10月12日14:30:28

cocoapods下载sqlite3.h,sqlite3.c文件的方法
</br>
1、安装cocoapods
</br>
2、创建一个xcode工程
</br>
3、xcode工程文件目录下创建Podfile,并编辑内容如下,其中dd为xcode工程名
</br>
   platform:ios,'9.0'
</br>
   target "dd" do
</br>
     pod 'FMDB/SQLCipher'
</br>
   end
</br>
4、xcode工程文件目录下执行命令 pod install,下载可能有点慢
</br>
</br>
clone项目之后直接运行FMDBAgg即可得到编译好的FMDB.framework(真机和模拟器)
</br>
1、iOS9以上.
</br>
2、支持bitcode.
</br>
3、实现了SQLCipher数据库加密.

