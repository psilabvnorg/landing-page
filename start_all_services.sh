#!/bin/bash
# Start all AI services in separate terminals

echo "Starting all AI services in tmux session..."
echo ""

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "ERROR: tmux is not installed!"
    echo "Install it with: sudo apt install tmux"
    exit 1
fi

# Create a new tmux session
SESSION_NAME="psi-services"

# Kill existing session if it exists
tmux kill-session -t $SESSION_NAME 2>/dev/null

# Create new session with first service
tmux new-session -d -s $SESSION_NAME -n "F5-TTS" "cd /home/psilab/F5-TTS-Vietnamese/fast_api && bash scripts/start.sh"

# Create windows for other services
tmux new-window -t $SESSION_NAME -n "Whisper" "cd /home/psilab/TRANSCRIBE-AUDIO-TO-TEXT-WHISPER/fast_api && bash start.sh"
tmux new-window -t $SESSION_NAME -n "Lip-Sync" "cd /home/psilab/LIP-SYNC-float-fast/fast_api && bash start.sh"

echo "✓ All services started in tmux session: $SESSION_NAME"
echo ""
echo "Services running on:"
echo "  - F5-TTS Voice Clone: http://localhost:8000"
echo "  - Whisper Transcribe: http://localhost:8001"
echo "  - Lip-Sync: http://localhost:8002"
echo ""
echo "To view services, run:"
echo "  tmux attach -t $SESSION_NAME"
echo ""
echo "To switch between windows: Ctrl+B then 0/1/2"
echo "To detach from tmux: Ctrl+B then D"
echo "To stop all services: tmux kill-session -t $SESSION_NAME"
