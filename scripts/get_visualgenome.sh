#!/bin/bash
mkdir -p data/VisualGenome
cd data/VisualGenome

# Get VG metadata files 
if [ ! -f "relationships.json" ]; then 
    wget https://homes.cs.washington.edu/~ranjay/visualgenome/data/dataset/relationships.json.zip
    unzip relationships.json.zip
    rm relationships.json.zip
fi;
if [ ! -f "objects.json" ]; then 
    wget https://homes.cs.washington.edu/~ranjay/visualgenome/data/dataset/objects.json.zip
    unzip objects.json.zip
    rm objects.json.zip
fi;

if [ ! -f "relationship_alias.txt" ]; then 
    wget https://homes.cs.washington.edu/~ranjay/visualgenome/data/dataset/relationship_alias.txt
fi;
if [ ! -f "object_alias.txt" ]; then 
    wget https://homes.cs.washington.edu/~ranjay/visualgenome/data/dataset/object_alias.txt
fi;
if [ ! -f "predicate_list.txt" ]; then 
    wget https://raw.githubusercontent.com/danfeiX/scene-graph-TF-release/master/data_tools/VG/predicate_list.txt
fi;
if [ ! -f "object_list.txt" ]; then 
    wget https://raw.githubusercontent.com/danfeiX/scene-graph-TF-release/master/data_tools/VG/object_list.txt
fi;

if [ ! -f "split.npy" ] || [ ! -f "valid.npy"  ]; then 
    wget https://www.dropbox.com/s/1bzhco3fmjvrg9k/vg_splits.zip
    unzip vg_splits.zip
    rm vg_splits.zip
fi;

# Download and unzip images.

if [ ! -d "VG_100K" ]; then 
    wget https://cs.stanford.edu/people/rak248/VG_100K_2/images.zip
    wget https://cs.stanford.edu/people/rak248/VG_100K_2/images2.zip
    unzip images.zip
    unzip images2.zip
    rm images.zip
    rm images2.zip

    # Move images from VG_100K_2 to VG_100K.
    find VG_100K_2/ -name "*.jpg" -exec mv {} VG_100K \;
    rm -r VG_100K_2/
fi

cd ../..
