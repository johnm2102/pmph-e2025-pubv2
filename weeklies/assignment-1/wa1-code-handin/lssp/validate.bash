#!/bin/bash 

# Validates all 3 predicates 

module load futhark
module load cuda 

#Parse command-line arguments 
NOCUDA=false 
for arg in "$@"; do 
    case $arg in 
        -nocuda=True)
        NOCUDA=true 
        shift # Remove this arg from processing  
        ;;
    esac 
done 

#to check if cuda is available or not 
if [ "$NOCUDA" = false ] && command -v nvdia-smi &> /dev/null; then 
    BACKENDS=("cuda" "c")
else 
    BACKENDS=("c")
fi 

for BACKEND in "${BACKENDS[@]}"; do 
    echo "Using backend: $BACKEND"

    echo "Validating lssp-zeros.fut"
    futhark test --backend=$BACKEND lssp-zeros.fut 
    echo "Validating lssp-same.fut"
    futhark test --backend=$BACKEND lssp-same.fut
    echo "Validating lssp-sorted.fut"
    futhark test --backend=$BACKEND lssp-sorted.fut
done 