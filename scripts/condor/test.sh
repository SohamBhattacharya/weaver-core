#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core
MODELDIR="/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/testrun/{auto}"

python weaver/train.py \
--data-train \
QCD_Pt_170to300_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_170to300_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113606/*/*.root \
QCD_Pt_300to470_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_300to470_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113613/*/*.root \
QCD_Pt_470to600_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_470to600_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113620/*/*.root \
QCD_Pt_600to800_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_600to800_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113628/*/*.root \
QCD_Pt_800to1000_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_800to1000_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113636/*/*.root \
QCD_Pt_1000to1400_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1000to1400_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113644/*/*.root \
QCD_Pt_1400to1800_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1400to1800_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113651/*/*.root \
QCD_Pt_1800to2400_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_1800to2400_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113658/*/*.root \
QCD_Pt_2400to3200_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_2400to3200_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113708/*/*.root \
TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-600to800_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115302/*/*.root \
TTJets_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115310/*/*.root \
TTJets_HT-1200to2500_TuneCP5_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-1200to2500_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115317/*/*.root \
TTJets_HT-2500toInf_TuneCP5_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTJets_HT-2500toInf_TuneCP5_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115324/*/*.root \
TTToLL_MLL_500To800_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTToLL_MLL_500To800_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115216/*/*.root \
TTToLL_MLL_800To1200_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTToLL_MLL_800To1200_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115224/*/*.root \
TTToLL_MLL_1200To1800_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTToLL_MLL_1200To1800_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v3/220914_115233/*/*.root \
TTToLL_MLL_1800ToInf_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TTToLL_MLL_1800ToInf_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115240/*/*.root \
TT_Mtt-700to1000_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TT_Mtt-700to1000_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115248/*/*.root \
TT_Mtt-1000toInf_TuneCP5_13TeV-powheg-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/TT_Mtt-1000toInf_TuneCP5_13TeV-powheg-pythia8/DeepNtuplesAK8-v1_RunIISummer19UL18MiniAODv2-106X_v16-v1/220914_115255/*/*.root \
ZprimeToTTJets_M400_W4_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M400_W4_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_114926/*/*.root \
ZprimeToTTJets_M500_W5_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M500_W5_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_114933/*/*.root \
ZprimeToTTJets_M600_W6_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M600_W6_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_114941/*/*.root \
ZprimeToTTJets_M700_W7_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M700_W7_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_114948/*/*.root \
ZprimeToTTJets_M800_W8_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M800_W8_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_114956/*/*.root \
ZprimeToTTJets_M900_W9_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M900_W9_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115003/*/*.root \
ZprimeToTTJets_M1000_W10_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M1000_W10_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115010/*/*.root \
ZprimeToTTJets_M5000_W50_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M5000_W50_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115018/*/*.root \
ZprimeToTTJets_M6000_W60_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M6000_W60_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115027/*/*.root \
ZprimeToTTJets_M7000_W70_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M7000_W70_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115035/*/*.root \
ZprimeToTTJets_M8000_W80_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M8000_W80_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115042/*/*.root \
ZprimeToTTJets_M9000_W90_TuneCP2_13TeV-madgraphMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTTJets_M9000_W90_TuneCP2_13TeV-madgraphMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v2/220914_115050/*/*.root \
ZprimeToTT_M1200_W12_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M1200_W12_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115058/*/*.root \
ZprimeToTT_M1400_W14_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M1400_W14_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115105/*/*.root \
ZprimeToTT_M1600_W16_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M1600_W16_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115113/*/*.root \
ZprimeToTT_M1800_W18_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M1800_W18_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115121/*/*.root \
ZprimeToTT_M2000_W20_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M2000_W20_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115130/*/*.root \
ZprimeToTT_M2500_W25_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M2500_W25_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115138/*/*.root \
ZprimeToTT_M3000_W30_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M3000_W30_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115145/*/*.root \
ZprimeToTT_M3500_W35_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M3500_W35_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115152/*/*.root \
ZprimeToTT_M4000_W40_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M4000_W40_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115200/*/*.root \
ZprimeToTT_M4500_W45_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/ZprimeToTT_M4500_W45_TuneCP2_PSweights_13TeV-madgraph-pythiaMLM-pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_115207/*/*.root \
--data-config data/ak8_points_pf_sv_full.yaml \
--network-config weaver/networks/particle_net_pf_sv.py \
--model-prefix "$MODELDIR/result" \
--gpus 0 \
--batch-size 512 \
--start-lr 5e-3 \
--num-epochs 50 \
--optimizer ranger \
--num-workers 5 \
--tensorboard "tensorboard" \
--log "$MODELDIR/log.log" \
--demo \


#MODELDIR="/nfs/dust/cms/user/sobhatta/work/TopTagPol/weaver-core/output/testrun_{auto}"
#echo $MODELDIR/xxx
#QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8:/pnfs/desy.de/cms/tier2/store/user/sobhatta/TopTagPol/DeepNtuples/v1/QCD_Pt_3200toInf_TuneCP5_13TeV_pythia8/DeepNtuplesAK8-v1_RunIISummer20UL18MiniAODv2-106X_v16-v1/220914_113715/*/*.root \
