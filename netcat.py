#! /usr/bin/env python
#coding=utf-8

import sys,json
import socket
import getopt
import threading
import subprocess

listen = False
command = False
upload = False
execute = ""
target = ""
upload_destination = ""
port = 0

def client_sender(buffer):
    #print buffer
    #print target,port
    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client.settimeout(0.5)
    try:
        #连接到目标主机
        client.connect((target,port))
        
        if len(buffer):
            client.send(buffer)

        while True:
            #现在等待数据回传
            recv_len = 1
            response = []
            
            while recv_len:
                data = client.recv(4096)
                recv_len = len(data)
                if data.strip() == ">>":
                    continue
                response.append(data.strip())
                #print "########---------",recv_len


    except IOError,e:
        pass
    except Exception,e:    
        print e
        print "[*] Exception! Exiting."
        
        #关闭连接
        client.close()

    response.sort()
    print "\n".join(response)

def usage():
    print "Examples: "
    print "bhpnet.py -t 192.168.0.1 -p 5555 -l -c"
    print "echo 'ABCDEF' | ./bhpnet.py -t 192.168.11.12 -p 135"
    sys.exit(0)

def main():
    global listen
    global port
    global target
    

    if not len(sys.argv[1:]):
        usage()

    #读取明来行选项
    try:
        opts, args = getopt.getopt(sys.argv[1:],"hle:t:p:cu:", ["help","listen","execute","target","port","command","upload"])
    except getopt.GetoptError as err:
        print str(err)
        usage()

    for o,a in opts:
        if o in ("-h","--help"):
            usage()
        elif o in ("-e", "--execute"):
            execute = a
        elif o in ("-t", "--target"):
            target = a
        elif o in ("-p", "--port"):
            port = int(a)
        else:
            assert False,"Unhandled Option"

    #从明来行读取内存数据
    #这里将阻塞，所以不在向标准输入发送数据时发送CTRL-D
    #buffer = sys.stdin.read()

    #发送数据
    client_sender(execute)


main()
