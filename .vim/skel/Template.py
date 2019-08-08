#!/usr/bin/env python
#-*-encoding:utf-8-*-

#-------------------------------------------------
#     Author: <T_AUTHOR> <<T_AUTHOR_EMAIL>>
#     <T_AUTHOR_WEBSITE>
#
#     File: <T_FILENAME>
#     Create Date: <T_CREATE_DATE>
#-------------------------------------------------

import cProfile
#from debuger import *
#import subprocess




if __name__ == '__main__':
    import doctest
    doctest.testmod()
    from sys import argv
    from getopt import getopt
    options, args = getopt(argv[1:], "p:t:h", ["lab-path=", "wait-time=",'help'])

    #for argument,option in options:
        #if argument in ('-p', '--lab-path'):
            #lib_path = option
        #elif argument in ('-t', '--wait-time'):
            #service_name = option
        #elif argument in ('-h', '--help'):
             #help = True
