# Deployment Guide for PSI Technology Landing Page

## Quick Start - Deploy All Services

### Prerequisites
Install tmux if not already installed:
```bash
sudo apt install tmux
```

### Step 1: Start All AI Services
```bash
cd /home/psilab/landing-page
bash start_all_services.sh
```

This will create a tmux session named `psi-services` with 3 windows:
- **F5-TTS Voice Clone API** on port 8000
- **Whisper Transcribe API** on port 8001
- **Lip-Sync API** on port 8002

To view the running services:
```bash
tmux attach -t psi-services
```

Use `Ctrl+B` then `0/1/2` to switch between windows. Press `Ctrl+B` then `D` to detach.

### Step 2: Start Cloudflare Tunnels
```bash
bash start_cloudflare_tunnels.sh
```

This will create a tmux session named `psi-tunnels` with 3 windows for cloudflare tunnels.

To view the tunnels and get the public URLs:
```bash
tmux attach -t psi-tunnels
```

**Important:** In each window, look for the public URL that appears like:
```
https://xxxxx-xxxx-xxxx-xxxx.trycloudflare.com
```

Use `Ctrl+B` then `0/1/2` to switch between tunnel windows and copy all 3 URLs.

### Step 3: Update Public URLs in Landing Page

1. Copy the 3 public URLs from the cloudflare tunnel terminals
2. Edit `update_urls.sh` and paste your URLs:
   ```bash
   F5TTS_URL="https://your-f5tts-url.trycloudflare.com/"
   LIPSYNC_URL="https://your-lipsync-url.trycloudflare.com"
   WHISPER_URL="https://your-whisper-url.trycloudflare.com"
   ```
3. Run the update script:
   ```bash
   bash update_urls.sh
   ```

### Step 4: Deploy Landing Page (Optional)

If you want to deploy the landing page itself:
```bash
# Using Vercel
vercel --prod

# Or just view locally
python3 -m http.server 8080
```

## Manual Service Control

### Start Individual Services

**F5-TTS:**
```bash
cd /home/psilab/F5-TTS-Vietnamese/fast_api
bash scripts/start.sh
```

**Whisper:**
```bash
cd /home/psilab/TRANSCRIBE-AUDIO-TO-TEXT-WHISPER/fast_api
bash start.sh
```

**Lip-Sync:**
```bash
cd /home/psilab/LIP-SYNC-float-fast/fast_api
bash start.sh
```

### Start Individual Cloudflare Tunnels

```bash
# F5-TTS
cloudflared tunnel --url http://localhost:8000

# Whisper
cloudflared tunnel --url http://localhost:8001

# Lip-Sync
cloudflared tunnel --url http://localhost:8002
```

## Tmux Quick Reference

```bash
# View running services
tmux attach -t psi-services

# View cloudflare tunnels
tmux attach -t psi-tunnels

# Switch between windows
Ctrl+B then 0/1/2

# Detach from session (keeps running)
Ctrl+B then D

# Stop all services
tmux kill-session -t psi-services

# Stop all tunnels
tmux kill-session -t psi-tunnels

# List all sessions
tmux ls
```

## Troubleshooting

### Tmux not found
Install tmux:
```bash
sudo apt install tmux
```

### Services won't start
- Check if virtual environments are activated
- Verify ports 8000, 8001, 8002 are not in use:
  ```bash
  lsof -i :8000
  lsof -i :8001
  lsof -i :8002
  ```
- Kill processes on ports if needed:
  ```bash
  kill -9 $(lsof -t -i:8000)
  ```

### Cloudflared not found
Install cloudflared:
```bash
wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb
```

### URLs not updating
- Make sure you edited `update_urls.sh` with correct URLs
- Check the backup file `index.html.backup` to restore if needed

### View tmux session logs
If services are running but you're not sure what's happening:
```bash
# Attach to services session
tmux attach -t psi-services

# Then use Ctrl+B then [ to scroll through output
# Press Q to exit scroll mode
```

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                   PSI Landing Page                       │
│              (psi.technology / Vercel)                   │
└─────────────────────────────────────────────────────────┘
                           │
           ┌───────────────┼───────────────┐
           │               │               │
           ▼               ▼               ▼
    ┌──────────┐    ┌──────────┐    ┌──────────┐
    │Cloudflare│    │Cloudflare│    │Cloudflare│
    │  Tunnel  │    │  Tunnel  │    │  Tunnel  │
    └──────────┘    └──────────┘    └──────────┘
           │               │               │
           ▼               ▼               ▼
    ┌──────────┐    ┌──────────┐    ┌──────────┐
    │ F5-TTS   │    │ Whisper  │    │ Lip-Sync │
    │:8000     │    │:8001     │    │:8002     │
    └──────────┘    └──────────┘    └──────────┘
```

## Port Mapping

| Service | Local Port | Public URL (update after tunnel start) |
|---------|-----------|----------------------------------------|
| F5-TTS Voice Clone | 8000 | https://xxxxx.trycloudflare.com |
| Whisper Transcribe | 8001 | https://xxxxx.trycloudflare.com |
| Lip-Sync | 8002 | https://xxxxx.trycloudflare.com |
