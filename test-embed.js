// Test file to generate Metabase signed URL
// Run with: node test-embed.js

const jwt = require("jsonwebtoken");

const METABASE_SITE_URL = "http://localhost:3000";
const METABASE_SECRET_KEY = "474c5c00d2d4c2f92cd50cf6cbff9329576778b2dba430c08f6116ef3f85a092";

const payload = {
  resource: { dashboard: 1 },
  params: {},
  exp: Math.round(Date.now() / 1000) + (10 * 60) // 10 minute expiration
};

const token = jwt.sign(payload, METABASE_SECRET_KEY);

const iframeUrl = METABASE_SITE_URL + "/embed/dashboard/" + token +
  "#bordered=true&titled=true";

console.log("🔗 Generated Metabase Embed URL:");
console.log(iframeUrl);
console.log("\n📝 HTML iframe code:");
console.log(`<iframe src="${iframeUrl}" frameborder="0" width="800" height="600" allowtransparency></iframe>`);
console.log("\n⏰ Token expires in 10 minutes");
console.log(`🕐 Generated at: ${new Date().toLocaleString()}`);
