#!/usr/bin/env python3
# coding=utf-8
'''
Author       : Jay jay.zhangjunjie@outlook.com
Date         : 2023-08-23 22:21:43
LastEditTime : 2023-08-23 22:26:20
LastEditors  : Jay jay.zhangjunjie@outlook.com
Description  : 
'''

import os
import time

print("You need to input a number, Choose a sim version:")

cur_path=os.path.abspath(__file__)
cur_dir = os.path.dirname(cur_path)


def get_all_versions(cur_dir):
    all_files = os.listdir(cur_dir)
    all_version = []
    for f in all_files:
        abs_path_f = cur_dir +"/"+ f
        if os.path.isdir(abs_path_f):
            all_version.append(f)
            # all_version[f] = abs_path_f
    return all_version


def ls_all_version(all_version):

    for i,f in enumerate(all_version):
        print(str(i)+":"+f)


def start_sim(base_dir, sim_path):
    path = base_dir+"/"+sim_path
    # cmd = "echo \"elibot\" | sudo -S " + path+"/run_elisim.sh"
    cmd = path + "/run_elisim.sh"
    print(cmd)
    os.system(cmd)


all_version = get_all_versions(cur_dir)

while True:
    print("--------------------------------------------")
    ls_all_version(all_version)
    version = input()
    try:
        version = int(version)
        if version >= len(all_version):
            print("Input is invalid!!! Please retry input.")
        else:
            break
    except ValueError as e:
            print("Input is invalid!!! Please retry input.")


start_sim(cur_dir,all_version[version])