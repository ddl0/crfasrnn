#!/bin/bash
#1. Collects all images in examples/input/in<i>.png and examples/style/tar<i>.png
#2. Call ../crfasrnn/python_scripts/crfasrnn_demo to generate segmentation
#3. Put generated segmentation file into examples/segmentation/in<i>.png and examples/segmentation/tar<i>.png
#4. Done.

# Get around of cd not working in bash.

for i in ../../../test/deep-photo-styletransfer/examples/input/*
do
    echo "Calculating segmentation for $i"
    base=`basename "$i"`
    echo "Output file name is $base"
    python crfasrnn_demo.py -i $i -o ../../../test/deep-photo-styletransfer/examples/segmentation/$base 
done

for i in ../../../test/deep-photo-styletransfer/examples/style/*
do
    echo "Calculating segmentation for $i"
    base=`basename "$i"`
    echo "Output file name is $base"
    python crfasrnn_demo.py -i $i -o ../../../test/deep-photo-styletransfer/examples/segmentation/$base 
done
