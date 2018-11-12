set -eu -o pipefail

SERVER_IP="198.162.52.128"
#SERVER_IP=localhost
octets=(${SERVER_IP//./ })
        if [ "${#octets[@]}" -ne 4 ]; then
            echo "octets are $octets and length is ${#octets[@]}"
	    echo "$SERVER_IP must be an IP address"
            exit 1
        fi
        for octet in "${octets[@]}"; do
	    if [ "$octet" -lt 0 ] 2>/dev/null || [ "$octet" -gt 255 ] 2>/dev/null; then
		echo "$SERVER_IP must be an IP address"
		exit 1
	    fi
        done

