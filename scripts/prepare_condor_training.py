#!/usr/bin/env python


import argparse
import datetime
import numpy
import os
import subprocess


def run_cmd_list(l_cmd) :
    
    for cmd in l_cmd :
        
        retval = os.system(cmd)
        
        if (retval) :
            
            exit(retval)


def format_file(filename, d) :
    
    l_cmd = []
    
    for key in d :
        
        val = d[key]
        
        l_cmd.append("sed -i \"s#{find}#{repl}#g\" {filename}".format(
            find = key,
            repl = val,
            filename = filename,
        ))
    
    run_cmd_list(l_cmd)


def main() :
    
    cwd = os.getcwd()
    #cwd = "%s/src" %(subprocess.check_output(["echo", "$CMSSW_BASE"]).strip())
    #proxy = subprocess.check_output(["voms-proxy-info", "--path"]).strip()
    
    
    # Argument parser
    parser = argparse.ArgumentParser(formatter_class = argparse.ArgumentDefaultsHelpFormatter)
    
    parser.add_argument(
        "--name",
        help = "Will use <datetime>_<name> as the model name",
        type = str,
        required = True,
    )
    
    parser.add_argument(
        "--networkconfig",
        help = "Network config",
        type = str,
        required = True,
    )
    
    parser.add_argument(
        "--dataconfig",
        help = "Data config",
        type = str,
        required = True,
    )
    
    parser.add_argument(
        "--condordir",
        help = "Condor base directory (will create the job directory here)",
        type = str,
        required = False,
        default = "condor_jobs/training"
    )
    
    parser.add_argument(
        "--condorconfig",
        help = "Configuration template",
        type = str,
        required = False,
        default = "configs/condor/condor-cfg-gpu_template_cudacapability7_highmem.submit"
    )
    
    parser.add_argument(
        "--condorscript",
        help = "Script (executable) template",
        type = str,
        required = False,
        default = "scripts/condor/run_training_condor_template.sh"
    )
    
    # Parse arguments
    args = parser.parse_args()
    
    l_cmd = []
    
    networkconfig_name = args.networkconfig.split("/")[-1]
    dataconfig_name = args.dataconfig.split("/")[-1]
    
    condorconfig_name = args.condorconfig.split("/")[-1]
    condorscript_name = args.condorscript.split("/")[-1]
    
    args.name = args.name.strip()
    
    if (not len(args.name)) :
        
        print("Error: \"tag\" cannot be empty string")
        exit(1)
    
    out_tag = "%s_%s" %(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S"), args.name)
    dirname = "%s" %(out_tag)
    
    condordir = "%s/%s" %(args.condordir, dirname)
    l_cmd.append("mkdir -p %s" %(condordir))
    
    networkconfig = "%s/%s" %(condordir, networkconfig_name)
    dataconfig = "%s/%s" %(condordir, dataconfig_name)
    condorconfig = "%s/%s" %(condordir, condorconfig_name)
    condorscript = "%s/%s" %(condordir, condorscript_name)
    
    
    l_cmd.extend([
        "cp %s %s" %(args.networkconfig, networkconfig),
        "cp %s %s" %(args.dataconfig, dataconfig),
        "cp %s %s" %(args.condorconfig, condorconfig),
        "cp %s %s" %(args.condorscript, condorscript),
        
        "chmod +x %s" %(condorscript),
    ])
    
    run_cmd_list(l_cmd)
    
    condor_log = "%s/job.log" %(condordir)
    condor_out = "%s/job.out" %(condordir)
    condor_err = "%s/job.err" %(condordir)
    
    d_format = {
        "@cwd@": cwd,
        "@auto@": dirname,
        "@networkconfig@": networkconfig,
        "@dataconfig@": dataconfig,
        
        "@exe@": condorscript,
        "@log@": condor_log,
        "@out@": condor_out,
        "@err@": condor_err,
    }
    
    format_file(condorconfig, d_format)
    format_file(condorscript, d_format)
    
    
    print("")
    print("Created directory: %s" %(condordir))
    
    print("Log file:          %s" %(condor_log))
    print("Out file:          %s" %(condor_out))
    print("Err file:          %s" %(condor_err))
    
    print("***** VERIFY THE FOLLOWING FILES ARE OKAY BEFORE SUBMITTING *****")
    print("Network config:    %s" %(networkconfig))
    print("Data config:       %s" %(dataconfig))
    print("Submit file:       %s" %(condorconfig))
    print("Script file:       %s" %(condorscript))
    
    print("")


if (__name__ == "__main__") :
    
    main()
