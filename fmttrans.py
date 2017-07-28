#!/usr/bin/python
#coding:utf-8
"""
    File Name: fmttrans.py
    Author: zgt
    Mail: zhaoguitian@galaxywind.com 
    Created Time: 2017年07月28日 星期五 15时07分32秒
     note: 
         pip install chardet
         依赖于chardet这个库的编码识别功能
"""
import os,sys,io,chardet

def file_trans(filepath, out_enc="UTF8"):
    print 'trans:', filepath
    
    content = open(filepath).read()  
    charinfo = chardet.detect(content)
    print charinfo
    if charinfo['confidence'] < 0.9:
        print "file check confidence too small:", charinfo['confidence']
        return
    in_enc = charinfo.get('encoding','gbk')
    #if in_enc in ('Windows-1252','ISO-8859-1'):
    #    in_enc = 'gb2312'
    if in_enc != out_enc:
        new_content = content.decode(in_enc).encode(out_enc)  
    else:
        new_content = content
	
    new_content = new_content.replace("\r\n","\n")
    open(filepath, 'w').write(new_content)  
    print '\n'


def ext_match(ext_info, ext):
    if len(ext) < 2:
        return False

    ext = ext[1:]
    extlist = ext_info.split(",")
    for e in extlist:
        if e == ext:
            return True

    return False


def file_proc(ext_info,filepath):
    fileinfo = os.path.splitext(filepath)
    if len(fileinfo) != 2:
        return
    if ext_match(ext_info, fileinfo[1]):
        file_trans(filepath)

def dir_proc(ext_info,dir_path,is_recurve=True):
    for root, dirs, files in os.walk(dir_path):
        #print root
        #print files
        for f in files:
            file_proc(ext_info,os.path.join(root, f))

        if is_recurve == False:
            break


if __name__ == "__main__": 
    if len(sys.argv) < 3:
        print ("""usage: 文件格式转换
    将gb2312,ascii转换为utf8格式，并转换结束符号由window<\\r\\n>转换为Uninx格式<\\n>
    \t%s <c,h,txt,py> <dir1>\n
    """ % (sys.argv[0]))

    for idx in range(2,len(sys.argv)):
        dir_proc(sys.argv[1],sys.argv[idx],False)



