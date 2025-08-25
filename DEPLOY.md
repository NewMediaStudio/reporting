# 🚀 Quick Cloud Deployment

## Deploy to Railway (3 minutes, Free)

### Step 1: Go to Railway
1. Visit [railway.app](https://railway.app)
2. Sign in with your GitHub account
3. Click "New Project"

### Step 2: Connect Your Repo
1. Select "Deploy from GitHub repo"
2. Choose your `reporting` repository
3. Click "Deploy Now"

### Step 3: Wait for Deployment
- Railway will automatically detect the Docker setup
- Build time: ~2-3 minutes
- You'll get a public URL like: `https://your-project.railway.app`

### Step 4: Access Your Metabase
- Open the Railway URL in your browser
- Complete the Metabase setup wizard
- Connect to the sample database using:
  - Host: `postgres`
  - Port: `5432`
  - Database: `sample_data`
  - Username: `metabase`
  - Password: `metabase123`

## 🌐 Share with Others

Once deployed, share this URL:
```
https://your-project.railway.app
```

Anyone can visit this link to see your Metabase prototype running live!

## 🔄 Automatic Updates

- Every time you push to GitHub, Railway automatically redeploys
- Your live demo stays up-to-date with your code changes
- No manual deployment needed

## 💰 Cost

- **Free tier**: 500 hours/month
- **Paid plans**: Start at $5/month for more resources

## 🛠️ Alternative: Render

If Railway doesn't work, try [render.com](https://render.com):
1. Connect your GitHub repo
2. Choose "Web Service"
3. Use Docker deployment
4. Get a free public URL
