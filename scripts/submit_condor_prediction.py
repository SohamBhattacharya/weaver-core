#!/usr/bin/env python


import argparse
import datetime
import logging
import numpy
import os
import subprocess

import utils


logging.basicConfig(format = "%(asctime)s %(levelname)s  %(message)s", level = logging.INFO)


def run_cmd_list(l_cmd) :
    
    for cmd in l_cmd :
        
        #print(cmd)
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
        "--modelname",
        help = "Name of the model",
        type = str,
        required = True,
    )
    
    parser.add_argument(
        "--modelstate",
        help = "Model state file",
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
        "--condorconfig",
        help = "Condor configuration (submit file) template. Override the automatic selection (based on the --gpus argument).",
        type = str,
        required = False,
        default = None,
    )
    
    parser.add_argument(
        "--condorscript",
        help = "Script (executable) template",
        type = str,
        required = False,
        default = "scripts/condor/run_prediction_condor_template.sh"
    )
    
    parser.add_argument(
        "--condordir",
        help = "Condor base directory (will create the job directory here)",
        type = str,
        required = False,
        default = "condor_jobs/prediction"
    )
    
    parser.add_argument(
        "--samples",
        help = (
            "Samples. Syntax: "
            "sample1_key%%splitN:sample1_path sample2_key:sample2_path "
            "Optional: split output per splitN input files. "
            "Will skip entries starting with #."
        ),
        type = str,
        nargs = "+",
        required = True,
    )
    
    parser.add_argument(
        "--sampletag",
        help = (
            "Sample tag. For e.g. the ntuple version. See --outpath."
        ),
        type = str,
        required = False,
        default = "",
    )
    
    parser.add_argument(
        "--outpath",
        help = (
            "Directory for the prediction output files. "
            "If not provided, will use: "
            "<model_state_path>/prediction/<state_name>/<sample_tag>/<sample_key>/output.root"
        ),
        type = str,
        required = False,
        default = None,
    )
    
    parser.add_argument(
        "--force",
        help = "Rename output/job directories if they exist and submit a new job.",
        default = False,
        action = "store_true",
    )
    
    parser.add_argument(
        "--gpus",
        help = "Pass an an empty string (--gpus '') to NOT use gpus",
        type = str,
        required = False,
        default = "0",
    )
    
    
    # Parse arguments
    args = parser.parse_args()
    
    args.gpus = args.gpus.strip(" '\"")
    
    if (args.condorconfig is None) :
        
        if (len(args.gpus)) :
            
            args.condorconfig = "configs/condor/condor-cfg-gpu_template.submit"
        
        else :
            
            args.condorconfig = "configs/condor/condor-cfg_template_general.submit"
    
    condorconfig_name = args.condorconfig.split("/")[-1]
    condorscript_name = args.condorscript.split("/")[-1]
    
    args.samples = [_sample for _sample in args.samples if not _sample.startswith("#")]
    
    l_submitted = []
    l_skipped = []
    
    for iSample, sample in enumerate(args.samples) :
        
        l_cmd = []
        
        samplekey = sample.split(":")[0].split("%")[0]
        
        print("\n")
        print("*"*50)
        print(f"[{iSample+1}/{len(args.samples)}] {samplekey}")
        print("*"*50)
        print()
        
        condordir = f"{args.condordir}/{args.modelname}/{samplekey}"
        outpath = args.outpath
        
        if (outpath is None) :
            
            outpath = (
                f"{os.path.dirname(args.modelstate)}/"
                "prediction/"
                f"{os.path.splitext(os.path.basename(args.modelstate))[0]}/"
                f"{args.sampletag}/"
                f"{samplekey}/"
                "output.root"
            )
        
        dirExists = False
        
        for chkdir in [condordir, os.path.dirname(outpath)] :
            
            if (os.path.isdir(chkdir)) :
                
                logging.warning(f"Directory exists: {chkdir}")
                
                if (args.force) :
                    
                    newdir = utils.get_name_withtimestamp(chkdir, tag = "old")
                    logging.warning(f"Selected --force option. Will rename directory to: {newdir}")
                    l_cmd.append(f"mv {chkdir} {newdir}")
                
                else :
                    
                    dirExists = True
        
        if (dirExists) :
            
            logging.warning("Skipping sample.")
            l_skipped.append(samplekey)
            continue
        
        l_cmd.append("mkdir -p %s" %(condordir))
        
        condorconfig = "%s/%s" %(condordir, condorconfig_name)
        condorscript = "%s/%s" %(condordir, condorscript_name)
        
        l_cmd.extend([
            "cp %s %s" %(args.condorconfig, condorconfig),
            "cp %s %s" %(args.condorscript, condorscript),
            "chmod +x %s" %(condorscript),
        ])
        
        run_cmd_list(l_cmd)
        
        condor_log = "%s/job_1.log" %(condordir)
        condor_out = "%s/job_1.out" %(condordir)
        condor_err = "%s/job_1.err" %(condordir)
        
        
        
        d_format = {
            "@cwd@": cwd,
            "@modelname@": args.modelname,
            "@modelstate@": args.modelstate,
            "@networkconfig@": args.networkconfig,
            "@dataconfig@": args.dataconfig,
            "@outpath@": outpath,
            "@sample@": sample,
            "@gpus@": args.gpus,
            
            "@exe@": condorscript,
            "@log@": condor_log,
            "@out@": condor_out,
            "@err@": condor_err,
        }
        
        format_file(condorconfig, d_format)
        format_file(condorscript, d_format)
        
        print("")
        print("Sample string:     %s" %(sample))
        print("Condor directory:  %s" %(condordir))
        print("Submit file:       %s" %(condorconfig))
        print("Script file:       %s" %(condorscript))
        print("Log file:          %s" %(condor_log))
        print("Out file:          %s" %(condor_out))
        print("Err file:          %s" %(condor_err))
        
        
        submit_cmd = f"condor_submit {condorconfig}"
        
        os.system(submit_cmd)
        
        l_submitted.append(samplekey)
    
    
    print("\n")
    print("#"*50)
    print("Summary")
    print("#"*50)
    print("")
    
    
    submitted_str = f"Submitted {len(l_submitted)}/{len(args.samples)} samples."
    logging.info(submitted_str)
    print("")
    print("\n".join(l_submitted))
    print("")
    
    skipped_str = f"Skipped {len(l_skipped)}/{len(args.samples)} samples."
    
    if (len(l_skipped)) :
        
        logging.warning(skipped_str)
        print("")
        print("\n".join(l_skipped))
    
    else :
        
        logging.info(skipped_str)
    
    print("")


if (__name__ == "__main__") :
    
    main()
