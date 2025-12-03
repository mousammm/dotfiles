#!/bin/bash

# change disk to part 
# uncomment sudo mount 

# Get available partitions with size
IFS=$'\n' read -r -d '' -a partitions <<< "$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')"

if [ ${#partitions[@]} -eq 0 ]; then
    echo "No available device to mount!"
    exit 1
fi

# Create an interactive menu for device selection
echo "Available devices:"
PS3="Select a device (1-${#partitions[@]}): "
select partition in "${partitions[@]}"; do
    if [[ -n "$partition" ]]; then
        # $DEVICE
        device=$(echo "$partition" | awk '{print $1}')  # return /dev/sda1
        echo "Selected device: $device"
        
        # $MOUNT_POINT
        echo -e "\nAvailable mount points:"
        
        # Get existing mount points from /mnt
        IFS=$'\n' read -r -d '' -a mount_points <<< "$(find /mnt -maxdepth 1 -type d ! -path /mnt 2>/dev/null)"
        
        if [ ${#mount_points[@]} -eq 0 ]; then
            echo "No mount points found in /mnt"
            read -p "Create new mount point? (y/N): " create_new
            if [[ $create_new =~ ^[Yy]$ ]]; then
                read -p "Enter mount point name (e.g., 'c', 'd'): " mp_name
                mount_point="/mnt/$mp_name"
                sudo mkdir -p "$mount_point"
                echo "Created: $mount_point"
            else
                echo "Exiting."
                exit 1
            fi
        else
            # Display available mount points
            echo "Choose mount point:"
            PS3="Select mount point (1-$((${#mount_points[@]} + 1))): "
            select mount_choice in "${mount_points[@]}" "Create new"; do
                if [[ -n "$mount_choice" ]]; then
                    if [[ "$mount_choice" == "Create new" ]]; then
                        read -p "Enter mount point name (e.g., 'c', 'd'): " mp_name
                        mount_point="/mnt/$mp_name"
                        sudo mkdir -p "$mount_point"
                        echo "Created: $mount_point"
                    else
                        mount_point="$mount_choice"
                        echo "Selected: $mount_point"
                    fi
                    break
                else
                    echo "Invalid selection. Please try again."
                fi
            done
        fi
        
        # Mount the device
        echo -e "\nMounting $device to $mount_point..."
        sudo mount "$device" "$mount_point"
        # echo "$device" "$mount_point"
        
        if [ $? -eq 0 ]; then
            echo "Successfully mounted!"
        else
            echo "Mount failed!"
        fi
        
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
