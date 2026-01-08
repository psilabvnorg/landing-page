#!/bin/bash
# Start cloudflare tunnels for all services in separate terminals
# cloudflared tunnel --url http://localhost:8000
# cloudflared tunnel --url http://localhost:8001
# cloudflared tunnel --url http://localhost:8002

echo "Starting Cloudflare tunnels in tmux session..."
echo "Make sure cloudflared is installed: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/"
echo ""

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "ERROR: tmux is not installed!"
    echo "Install it with: sudo apt install tmux"
    exit 1
fi

# Check if cloudflared is installed
if ! command -v cloudflared &> /dev/null; then
    echo "ERROR: cloudflared is not installed!"
    echo "Install it with: wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared-linux-amd64.deb"
    exit 1
fi

# Create a new tmux session for tunnels
SESSION_NAME="psi-tunnels"

# Kill existing session if it exists
tmux kill-session -t $SESSION_NAME 2>/dev/null

# Create new session with first tunnel
echo "Starting tunnel for F5-TTS (port 8000)..."
tmux new-session -d -s $SESSION_NAME -n "F5-TTS-Tunnel" "echo 'Cloudflare Tunnel for F5-TTS (port 8000)'; echo ''; cloudflared tunnel --url http://localhost:8000"

sleep 2

# Create windows for other tunnels
echo "Starting tunnel for Whisper (port 8001)..."
tmux new-window -t $SESSION_NAME -n "Whisper-Tunnel" "echo 'Cloudflare Tunnel for Whisper (port 8001)'; echo ''; cloudflared tunnel --url http://localhost:8001"

sleep 2

echo "Starting tunnel for Lip-Sync (port 8002)..."
tmux new-window -t $SESSION_NAME -n "Lip-Sync-Tunnel" "echo 'Cloudflare Tunnel for Lip-Sync (port 8002)'; echo ''; cloudflared tunnel --url http://localhost:8002"

echo ""
echo "✓ Cloudflare tunnels started in tmux session: $SESSION_NAME"
echo ""
echo "To view tunnels and get URLs, run:"
echo "  tmux attach -t $SESSION_NAME"
echo ""
echo "To switch between tunnels: Ctrl+B then 0/1/2"
echo "To detach from tmux: Ctrl+B then D"
echo ""
echo "IMPORTANT: After attaching, copy the public URLs (https://xxxxx.trycloudflare.com)"
echo "Then update them in: /home/psilab/landing-page/update_urls.sh"
echo ""
echo "To stop all tunnels: tmux kill-session -t $SESSION_NAME"
