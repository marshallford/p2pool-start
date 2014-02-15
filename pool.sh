# Marshall Ford
# p2pool-start https://github.com/marshallford/p2pool-start
# Bash script for starting up Litecoind and P2Pool

# Starts Litecoind
if pgrep litecoind >/dev/null 2>&1; then
    echo "Litecoin is already running..."
else
    litecoind &
    echo "Started litecoind, waiting 2 minutes before starting up P2Pool..."
    sleep 120
fi
# Starts P2Pool with screen
if ! screen -list | grep -q "ltcp2pool"; then
    screen -d -m -S ltcp2pool ~/p2pool/run_p2pool.py --net litecoin --address YOUR_ADDRESS --give-author 0.0 --fee 5 RPC_USER RPC_PASSWORD
    echo "Started P2Pool with screen, waiting 10 seconds..."
    sleep 10
else
    echo "P2Pool has already been started..."
    sleep 3
fi
screen -r
