# 🔍 Metabase Embedding Checklist

## ✅ What You Have
- [x] Metabase running on localhost:3000
- [x] Dashboard created
- [x] Embedding secret key
- [x] Embed code ready

## ❓ What to Check

### 1. **Enable Embedding in Metabase**
1. Go to **Admin → Settings → Embedding**
2. Make sure **"Enable embedding"** is turned ON
3. Verify your **secret key** matches: `474c5c00d2d4c2f92cd50cf6cbff9329576778b2dba430c08f6116ef3f85a092`

### 2. **Enable Embedding for Your Dashboard**
1. Go to your dashboard
2. Click **Settings** (gear icon)
3. Make sure **"Enable embedding"** is checked
4. Note the **Dashboard ID** (should be 1)

### 3. **Check Dashboard Permissions**
1. Dashboard should be **public** or **accessible**
2. No special user restrictions
3. Embedding permissions enabled

### 4. **Test Basic Embed**
Try this URL in your browser:
```
http://localhost:3000/embed/dashboard/1
```

## 🚨 Common Issues
- Embedding not enabled in Admin settings
- Dashboard embedding not enabled
- Wrong dashboard ID
- Secret key mismatch
- Dashboard not public

## 🎯 Next Steps
1. Check Admin → Settings → Embedding
2. Enable embedding for your dashboard
3. Test basic URL first
4. Then generate signed URL
