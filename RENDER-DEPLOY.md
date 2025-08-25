# 🚀 Deploy to Render.com (Free, No Credit Card Required)

## Step 1: Go to Render

1. Visit [render.com](https://render.com)
2. **Sign up** with your GitHub account
3. **No credit card required** for free tier

## Step 2: Create New Web Service

1. Click **"New +"** button
2. Select **"Web Service"**
3. Click **"Connect your GitHub repository"**

## Step 3: Connect Your Repository

1. **Select your `reporting` repository**
2. **Choose the `main` branch**
3. Click **"Connect"**

## Step 4: Configure the Service

1. **Name**: `reporting-metabase`
2. **Environment**: `Docker`
3. **Region**: Choose closest to you
4. **Branch**: `main`
5. **Root Directory**: Leave empty (default)
6. **Build Command**: Leave empty (uses Dockerfile)
7. **Start Command**: Leave empty (uses Dockerfile)

## Step 5: Deploy

1. Click **"Create Web Service"**
2. **Wait 3-5 minutes** for build and deployment
3. **Get your public URL** like: `https://reporting-metabase.onrender.com`

## 🌐 What You'll Get

✅ **Free hosting** (no credit card required)
✅ **Public URL** that anyone can access
✅ **Automatic deployments** when you push to GitHub
✅ **No time limits** (unlike Fly.io trial)

## 🔗 After Deployment

1. **Open your Render URL** in browser
2. **Wait for Metabase to initialize** (2-3 minutes)
3. **Complete the setup wizard**
4. **Start building dashboards!**

## 📱 Share with Others

Once deployed, share your Render URL:

```
https://reporting-metabase.onrender.com
```

## 🚨 Troubleshooting

### Build Fails

- Check the build logs in Render dashboard
- Ensure Dockerfile is correct
- Verify repository connection

### App Won't Start

- Check the deployment logs
- Verify health check path is correct
- Wait for full initialization (3-5 minutes)

## 💰 Cost

- **Free tier**: $0/month
- **No credit card required**
- **No time limits**
- **Automatic sleep after inactivity** (wakes up on first request)

## 🎯 Ready to Deploy?

Go to [render.com](https://render.com) and follow these steps. It's the easiest way to get a public URL without any payment requirements!
