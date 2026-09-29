const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const qa = path.join(root, 'Art/qa');
fs.mkdirSync(qa, { recursive: true });
const html = fs.readFileSync(path.join(__dirname, 'preview.html'), 'utf8');
(async () => {
  const browser = await chromium.launch({ executablePath: 'C:/Program Files/Google/Chrome/Application/chrome.exe', headless: true });
  const page = await browser.newPage({ viewport: { width: 896, height: 504 }, deviceScaleFactor: 1 });
  await page.goto('file:///' + path.join(__dirname, 'preview.html').replace(/\\/g, '/'));
  await page.evaluate(() => document.fonts.ready);
  await page.evaluate(() => Promise.all([...document.images].map(i => i.decode())));
  await page.screenshot({ path: path.join(root, 'Mod/About/Preview.png') });
  // ModIcon stamp, cutout from its near-black background and composited into a free
  // corner (STYLE_RIMWORLD.md, "Le ModIcon détouré sur la vitrine", 2026-09-29):
  // left corner +15deg, right corner -15deg, same side as the text block. Here the text
  // sits top-left, so the stamp goes bottom-left at +15deg, overhanging the frame so its
  // left and bottom edges are cropped by the canvas (owner's revision over the docs' flush margin).
  // Flood-fill from the border, not a global colour-distance pass: the icon's own dark
  // facial linework can sit at the same near-black distance as the background and must
  // stay opaque; only background actually connected to the edge is cut.
  const iconRaw = await sharp(path.join(root, 'Mod/About/ModIcon.png')).ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const { width: iw, height: ih } = iconRaw.info;
  const iconData = iconRaw.data;
  const bgColor = [iconData[0], iconData[1], iconData[2]];
  const lowT = 40, highT = 90;
  const dist = i4 => Math.hypot(iconData[i4] - bgColor[0], iconData[i4 + 1] - bgColor[1], iconData[i4 + 2] - bgColor[2]);
  const alphaOverride = new Uint8ClampedArray(iw * ih).fill(255);
  const visited = new Uint8Array(iw * ih);
  const queue = [];
  for (let x = 0; x < iw; x++) { queue.push(x); queue.push((ih - 1) * iw + x); }
  for (let y = 0; y < ih; y++) { queue.push(y * iw); queue.push(y * iw + iw - 1); }
  let qi = 0;
  while (qi < queue.length) {
    const p = queue[qi++];
    if (visited[p]) continue;
    visited[p] = 1;
    const d = dist(p * 4);
    if (d > highT) continue;
    alphaOverride[p] = d <= lowT ? 0 : Math.round(255 * (d - lowT) / (highT - lowT));
    const x = p % iw, y = (p - x) / iw;
    if (x > 0) queue.push(p - 1);
    if (x < iw - 1) queue.push(p + 1);
    if (y > 0) queue.push(p - iw);
    if (y < ih - 1) queue.push(p + iw);
  }
  const cut = Buffer.from(iconData);
  for (let p = 0; p < iw * ih; p++) cut[p * 4 + 3] = Math.min(cut[p * 4 + 3], alphaOverride[p]);
  const cutoutPng = await sharp(cut, { raw: { width: iw, height: ih, channels: 4 } }).png().toBuffer();
  // The owner asked for the stamp to overhang the frame, not sit flush inside it: its
  // left and bottom edges are cropped by the canvas, as if it were poking out of the corner.
  const stampSize = 220, stampRotation = 15, overhang = 80;
  const stamp = await sharp(cutoutPng).resize(stampSize, stampSize).rotate(stampRotation, { background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer();
  const stampMeta = await sharp(stamp).metadata();
  const withStamp = await sharp(fs.readFileSync(path.join(root, 'Mod/About/Preview.png')))
    .composite([{ input: stamp, left: -overhang, top: 504 - stampMeta.height + overhang }])
    .png().toBuffer();
  fs.writeFileSync(path.join(root, 'Mod/About/Preview.png'), withStamp);
  await sharp(path.join(root, 'Mod/About/Preview.png')).resize({ width: 268 }).png().toFile(path.join(qa, 'Preview-small.png'));
  const bytes = fs.statSync(path.join(root, 'Mod/About/Preview.png')).size;
  console.log(JSON.stringify({ stampSize, stampRotation, corner: 'bottom-left', bytes }, null, 2));
  await browser.close();
  if (bytes >= 900000) throw Error('Preview.png too large');
})().catch(e => { console.error(e); process.exit(1); });
