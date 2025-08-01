#!/bin/bash
# Get the current datestamp //
DATESTAMP=$(date +%d_%m_%Y)

# Specify your directory path here //
DIR_PATH="/mnt/c/Users/703375822/Documents/Pre-prod-Backup/$DATESTAMP"

##################################################################################################################################################

# Create a new directory with the datestamp //
mkdir -p "$DIR_PATH/TC_stage_BACKUPS"

# Define your Kubernetes namespaces, pods, and containers //
namespaces=("tc-vn-cc" "tc-vn-corp" "tc-vn-gpaslite" "tc-vn-ibs-adn" "tc-vn-gecars" "tc-vn-capital" "tc-vn-ibs-1" "tc-vn-perceptive" "tc-vn-ibs-2" "tc-vn-scx" "tc-vn-sss")
namespaces2=("dc-portal")
namespaces3=("dive")

# Define the remote directories in the pods where the files are located //
remote_dirs=("/opt/nifi/data_mount/" "/opt/nifi/data_mount/flow")

# Define specific files to copy from remote directories //
TC_files_1=("authorizations.xml" "users.xml")
TC_files_2=("flow.xml.gz")

# Define the local directory where files will be copied //
local_dir="$DIR_PATH/TC_stage_BACKUPS"

# Loop through namespaces
for namespace in "${namespaces[@]}"
do
    # Define the pod for the current namespace //
    pod="${namespace}-stg-thread-connect-0"

    # Define the container for the current namespace //
    container="tc-nifi"

    echo "Copying files from pod $pod (container $container) in namespace $namespace..."

    # Create a directory for the pod if it doesn't exist //
    mkdir -p "$local_dir/$namespace"

    # Use kubectl exec to cat and redirect content to a file //
    for file in "${TC_files_1[@]}"
    do
        kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[0]}/$file" > "$local_dir/$namespace/$file"
        echo "##############################################################################################################"
        echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
        echo "##############################################################################################################"
    done

    for file in "${TC_files_2[@]}"
    do
        kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[1]}/$file" > "$local_dir/$namespace/$file"
        echo "##############################################################################################################"
        echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
        echo "##############################################################################################################"
    done

    echo "Finished copying files from pod $pod (container $container) in namespace $namespace."
    echo "###################################################################################################################"
done

# Loop through namespaces2
for namespace in "${namespaces2[@]}"
do
    # Define the pod for the current namespace //
    pod="tc-dc-portal-stg-thread-connect-0"

    # Define the container for the current namespace //
    container="tc-nifi"

    echo "Copying files from pod $pod (container $container) in namespace $namespace..."

    # Create a directory for the pod if it doesn't exist //
    mkdir -p "$local_dir/$namespace"

    # Use kubectl exec to cat and redirect content to a file //
    for file in "${TC_files_1[@]}"
    do
        kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[0]}/$file" > "$local_dir/$namespace/$file"
        echo "##############################################################################################################"
        echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
        echo "##############################################################################################################"
    done

    for file in "${TC_files_2[@]}"
    do
        kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[1]}/$file" > "$local_dir/$namespace/$file"
        echo "##############################################################################################################"
        echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
        echo "##############################################################################################################"
    done

    echo "Finished copying files from pod $pod (container $container) in namespace $namespace."
    echo "###################################################################################################################"
done

# Loop through namespaces3
for namespace in "${namespaces3[@]}"
do
    # Define the pods for the current namespace //
    pods=("dive-stage-customer-tc-0" "dive-stage-product-tc-0")

    # Define the container for the current namespace //
    container="tc-nifi"

    # Loop through pods
    for pod in "${pods[@]}"
    do
        echo "Copying files from pod $pod (container $container) in namespace $namespace..."

        # Create a directory for the pod if it doesn't exist //
        if [[ "$pod" == "dive-stg-customer-tc-0" ]]; then
            mkdir -p "$local_dir/$namespace/dive-customer"
            local_path="$local_dir/$namespace/dive-customer"
        
        fi

        if [[ "$pod" == "dive-stg-product-tc-0" ]]; then
            mkdir -p "$local_dir/$namespace/dive-product"
            local_path="$local_dir/$namespace/dive-product"

        fi

        # Use kubectl exec to cat and redirect content to a file //
        for file in "${TC_files_1[@]}"
        do
            kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[0]}/$file" > "$local_path/$file"
            echo "##############################################################################################################"
            echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
            echo "##############################################################################################################"
        done

        for file in "${TC_files_2[@]}"
        do
            kubectl exec -n "$namespace" "$pod" -c "$container" -- cat "${remote_dirs[1]}/$file" > "$local_path/$file"
            echo "##############################################################################################################"
            echo "Successfully copied $file from pod $pod (container $container) in namespace $namespace."
            echo "##############################################################################################################"
        done

        echo "Finished copying files from pod $pod (container $container) in namespace $namespace."
        echo "###################################################################################################################"
    done
done

echo "#########################################################################################################################"
echo "All files copied successfully | Script Developed by OSS Vernova team | "
