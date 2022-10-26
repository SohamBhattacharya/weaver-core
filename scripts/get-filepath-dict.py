#!/usr/bin/env python3


import argparse
import subprocess



def main() :
    
    parser = argparse.ArgumentParser(formatter_class = argparse.ArgumentDefaultsHelpFormatter)
    
    parser.add_argument(
        "--path",
        help = "Path",
        type = str,
        required = True,
    )
    
    parser.add_argument(
        "--mindepth",
        help = "Minimum depth to search in <path>",
        type = int,
        default = 3,
        required = False,
    )
    
    parser.add_argument(
        "--maxdepth",
        help = "Maximum depth to search in <path>",
        type = int,
        default = 3,
        required = False,
    )
    
    parser.add_argument(
        "--keydepth",
        help = "Will use the directory name at <keydepth> level (counting from 1) as the key: /level-1/level-2/.../level-keydepth/.../",
        type = int,
        required = True,
        #default = None,
    )
    
    parser.add_argument(
        "--suffix",
        help = "Will append this to the paths",
        type = str,
        required = False,
        default = "/*/*.root",
    )
    
    
    args = parser.parse_args()
    
    args.path = args.path.strip()
    
    if (args.path[-1] != "/") :
        args.path = f"{args.path}/"
    
    cmd = f"find {args.path} -mindepth {args.mindepth} -maxdepth {args.maxdepth} | sort -V"
    
    print("Running command:")
    print(cmd)
    
    #cmd_output = subprocess.check_output(cmd.split())
    cmd_output = subprocess.check_output(cmd, shell = True)
    
    l_path = cmd_output.split()
    l_path = [_path.decode('ascii') for _path in l_path]
    #print(l_path)
    
    d_path = {}
    l_keyed_path = []
    
    for path in l_path:
        
        #print(path.split("/"))
        keydepth = args.keydepth-1
        
        if (path[0] == "/") :
            
            keydepth += 1
        
        key = path.split("/")[keydepth]
        
        l_keyed_path.append(f"{key}:{path}{args.suffix}")
    
    print("\n".join(l_keyed_path)+"\n")


if (__name__ == "__main__") :
    
    main()
