#! /usr/bin/env python
#coding=utf-8

import sys,json,datetime
import socket
import getopt
import threading
import subprocess


def client_sender(target,port, cmd):
    #print cmd
    #print target,port
    response = []
    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client.settimeout(0.5)
    try:
        #连接到目标主机
        client.connect((target,port))
        
        if len(cmd):
            client.send(cmd)

        #现在等待数据回传
        recv_len = 1
        
        while recv_len:
            data = client.recv(4096)
            #print "########---------",data
            recv_len = len(data)
            if data.strip() == ">>":
                continue
            response.append(data.strip())

    except IOError,e:
        pass
    except Exception,e:    
        print e
        print "[*] Exception! Exiting."
        
        #关闭连接
        client.close()

    return response

def usage():
    print "Examples: "
    print "bhpnet.py -t 192.168.0.1 -p 5555 -l -c"
    print "echo 'ABCDEF' | ./bhpnet.py -t 192.168.11.12 -p 135"
    sys.exit(0)

def main():
    execute = ""
    target = ""
    port = 0
    

    if not len(sys.argv[1:]):
        usage()

    #读取明来行选项
    try:
        opts, args = getopt.getopt(sys.argv[1:],"he:t:p:", ["help","execute","target","port"])
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
            port = a
        else:
            assert False,"Unhandled Option"

    port_lst = port.split(",")
    response_list = []
    for p in port_lst:
        r= client_sender(target,int(p), execute)
        response_list.append(r)

    max_name_len = 0
    max_count_len = 0
    max_time_len = 0
    group= {}
    for r in response_list:
        for line in r:
            lst = line.split(" ")
            display=[]
            for it in lst:
                if it.strip() != "":
                    display.append(it.strip())

            if len(display) < 4:
                continue

            tmplst = display[1].split(":")
            if len(tmplst) != 2:
                continue
            count = tmplst[1]

            tmplst = display[2].split(":")
            if len(tmplst) != 2:
                continue
            timesum = tmplst[1]

            tmplst = display[1].split(":")
            if len(tmplst) != 2:
                continue
            qps = tmplst[1]

            if not group.has_key(display[0]):
                group[display[0] ] = {"count":0,"timesum":0.0,"qps":0.0}

            group[display[0] ] ['count'] += int(count)
            group[display[0] ] ['timesum'] += float(timesum)
            if group[display[0] ] ['timesum'] == 0.0:
                continue
            group[display[0] ] ['qps'] = group[display[0] ] ['count'] / group[display[0] ] ['timesum'] 
            if max_name_len < len(display[0]):
                max_name_len = len(display[0])
            if max_count_len < len("%s" % group[display[0] ] ['count']):
                max_count_len = len("%s" % group[display[0] ] ['count'])
            if max_time_len < len("%s" % group[display[0] ] ['timesum']):
                max_time_len = len("%s" % group[display[0] ] ['timesum'])

    response = []
    for k,v in group.items():
        #print k,v
        padlen = max_name_len - len(k)
        padlen2 = max_count_len - len("%s" % v['count'])
        padlen3 = max_time_len - len("%s" % v['timesum'])
        response.append("%s%s\tcount:%s%s\ttimesum:%s%s\tqps:%0.3f" % (k," "*padlen, 
            v['count']," " *padlen2,
            v['timesum']," " *padlen3, 
            v['qps']))


    response.sort()
    print "#########%s" % datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print "\n".join(response)


main()
