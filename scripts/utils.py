import numpy
import os
import psutil
import subprocess


def replace_in_list(l, find, repl) :
    
    return [s.replace(find, repl) for s in l]


def replace_in_dict(d, find, repl) :
    
    for key in d :
        
        if (isinstance(d[key], str)) :
            
            d[key] = d[key].replace(find, repl)
        
        elif (isinstance(d[key], list)) :
            
            d[key] = replace_in_list(d[key], find, repl)
        
        elif (isinstance(d[key], dict)) :
            
            replace_in_dict(d[key], find, repl)
    
    #return d


def run_cmd_list(l_cmd) :
    
    for cmd in l_cmd :
        
        retval = os.system(cmd)
        
        if (retval) :
            
            exit()


def getMemoryMB(process = -1) :
    
    if (process < 0) :
        
        process = psutil.Process(os.getpid())
    
    mem = process.memory_info().rss / 1024.0**2
    
    return mem


def get_fileAndTreeNames(in_list) :
    
    fileAndTreeNames = []
    
    for fName in in_list :
        
        if (".root" in fName) :
            
            fileAndTreeNames.append(fName)
        
        elif (".txt" in fName) :
            
            sourceFile, treeName = fName.strip().split(":")
            
            rootFileNames = numpy.loadtxt(sourceFile, dtype = str, delimiter = "*"*100)
            
            for rootFileName in rootFileNames :
                
                fileAndTreeNames.append("%s:%s" %(rootFileName, treeName))
        
        else :
            
            print("Error. Invalid syntax for fileAndTreeNames: %s" %(fName))
            exit(1)
    
    return fileAndTreeNames


def format_file(filename, d, execute = False) :
    
    l_cmd = []
    
    for key in d :
        
        val = d[key]
        
        l_cmd.append("sed -i \"s#{find}#{repl}#g\" {filename}".format(
            find = key,
            repl = val,
            filename = filename,
        ))
    
    if (execute) :
        
        run_cmd_list(l_cmd)
    
    else :
        
        return l_cmd


def get_name_withtimestamp(dirname, tag = "") :
    
    if (os.path.exists(dirname)) :
        
        timestamp = subprocess.check_output(["date", "+%Y-%m-%d_%H-%M-%S", "-r", dirname]).strip()
        timestamp = str(timestamp.decode("UTF-8")) # Convert from bytes to string
        
        tag = tag.strip()
        tag = f"_{tag}" if len(tag) else ""
        
        dirname_new = f"{dirname}{tag}_{timestamp}"
        
        return dirname_new
    
    return None

