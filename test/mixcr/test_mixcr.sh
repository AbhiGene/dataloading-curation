#!/bin/bash

# This shell script assumes that the iReceptor dataloading-mongo and
# dataloading-curation git repositories are installed next to each other
# in the same parent directory. This can be overridden by setting the 
# the PYTHONPATH and CONFIGPATH environment variables as required.

if [ -z "$PYTHONPATH" ];
then
    export PYTHONPATH=../../../dataloading-mongo/dataload
fi
if [ -z "$CONFIGPATH" ];
then
    export CONFIGPATH=../../../config
fi
if [ -z "$DB_HOST" ];
then
    export DB_HOST=localhost
fi

python $PYTHONPATH/dataloader.py --mapfile=$CONFIGPATH/AIRR-iReceptorMapping.txt --host=$DB_HOST -s -f PRJNA330606_Wang_One_Sample.csv
python $PYTHONPATH/dataloader.py --mapfile=$CONFIGPATH/AIRR-iReceptorMapping.txt --host=$DB_HOST -v -m -f SRR4084215_aa_mixcr_annotation_1000_lines.txt.gz
