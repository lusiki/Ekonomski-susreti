// Run build-presentation-print.py first. Requires Playwright and Chromium.
const { chromium } = require('playwright');
const { resolve } = require('node:path');
const { pathToFileURL } = require('node:url');

(async () => {
  const root = resolve(__dirname, '..');
  const browser = await chromium.launch({
    headless: true,
    ...(process.env.CHROME_PATH ? { executablePath: process.env.CHROME_PATH } : {}),
  });
  try {
    const page = await browser.newPage();
    await page.goto(pathToFileURL(resolve(root, 'docs/slides/print.html')).href);
    await page.evaluate(() => document.fonts.ready);
    await page.locator('img').evaluateAll(images => Promise.all(images.map(image => image.decode())));
    await page.emulateMedia({ media: 'print' });
    const collisions = await page.locator('.page').evaluateAll(slides => slides.flatMap((slide, index) => {
      const footer = slide.querySelector('footer').getBoundingClientRect();
      return Array.from(slide.querySelectorAll('.slide-content h1, .slide-content h2, .slide-content h3, .slide-content p, .slide-content li, .slide-content table, .slide-content figure, .project-link'))
        .filter(element => element.getBoundingClientRect().bottom > footer.top - 14)
        .map(element => ({ slide: index + 1, text: element.textContent.slice(0, 80) }));
    }));
    if (collisions.length) throw new Error(`Content overlaps footer: ${JSON.stringify(collisions)}`);
    await page.pdf({
      path: resolve(root, 'docs/downloads/Ekonomski-susreti.pdf'),
      preferCSSPageSize: true,
      printBackground: true,
      displayHeaderFooter: false,
      tagged: true,
      outline: true,
    });
    console.log('Exported Ekonomski-susreti.pdf with embedded local fonts.');
  } finally {
    await browser.close();
  }
})().catch(error => { console.error(error); process.exitCode = 1; });
