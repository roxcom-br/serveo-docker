#!/bin/sh

# Define default value for LOCAL_HOST and LOCAL_PORT
LOCAL_HOST="${LOCAL_HOST:-localhost}"
LOCAL_PORT="${LOCAL_PORT:-3000}"

# Building of SSH command
ssh_command="ssh"

# If defined, add SSH port
if [ -n "$SSH_PORT" ]; then
    ssh_command="$ssh_command -p $SSH_PORT"
fi

# Check if SSH Strict Host Key Checking is enabled
if [ -n "$STRICT_CHECKING" && $STRICT_CHECKING == true ]; then
	ssh_command="$ssh_command -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
fi

# Check if exists RSA SSH Key
if [ -e $HOME/.ssh/id_rsa ]; then
	ssh-keygen -l -f $HOME/.ssh/id_rsa
	ssh-add $HOME/.ssh/id_rsa
fi

# Verify if SERVEO_PORT is defined
if [ -n "$SERVEO_PORT" ]; then
    # Verify if SERVEO_DOMAIN is defined too
    if [ -n "$SERVEO_DOMAIN" ]; then
        serveo_args="$SERVEO_DOMAIN:$SERVEO_PORT:$LOCAL_HOST:$LOCAL_PORT"
    else
        serveo_args="$SERVEO_PORT:$LOCAL_HOST:$LOCAL_PORT"
    fi
else
    serveo_args="$LOCAL_HOST:$LOCAL_PORT"
fi

# Build the final command
ssh_command="$ssh_command -R $serveo_args serveo.net"

if [ -n "$serveo_args" ]; then
    echo "Running the following SSH command:"
    echo "$ssh_command"
    # Execute the SSH command
    $ssh_command
else
    echo "ERROR: No reverse redirect variables are defined."
fi

