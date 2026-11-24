/* Živi grafikoni u prezentaciji.

   Statične slike ostaju u stranici i u PDF-u. U pregledniku ih ovaj sloj
   zamjenjuje istim prikazom iz istih provjerenih podataka, uz pokazivač,
   dodavanje serija i izvoz. Ako se skripta ne učita, slajd izgleda kao prije.

   Pravila prikaza
   - Početni prikaz odgovara slici. Serija koja pripada slajdu ostaje u tinti.
   - Boju dobivaju samo dodane serije. Tri su boje, narančasta za inflaciju,
     plava za ponderirani udio i tirkizna za učestalost. Skup je provjeren za
     sve parove i za poremećaje raspoznavanja boja. Ostale serije ostaju sive,
     a vrsta linije i oznaka uz kraj linije nose isto značenje kao boja.
   - Jedna ljestvica po panelu. Serije u istoj jedinici dijele os.
   - Serije u različitim jedinicama prikazuju se kao indeks, prva polovica
     2021. = 100, što je ista referenca kao kod institucionalnog jaza.
   - Inflacija se ne indeksira. Kad se ne može smjestiti na zajedničku os u
     postocima, dobiva vlastiti poravnati panel.
   - Crvena ostaje samo na elementima koji se mogu kliknuti. */
(function () {
  'use strict';

  var E = window.echarts;
  if (!E) return;
  var D = window.ES_MONTHLY, ANNUAL = window.ES_ANNUAL, ORIGINAL = window.ES_ORIGINAL;

  /* Slike koje sloj oživljava. Ključ je naziv SVG datoteke. */
  var FIGURES = {
    'monthly-inflation':    { kind: 'monthly', bars: ['hicp'] },
    'monthly-share':        { kind: 'monthly', bars: ['udio'] },
    'monthly-frequency':    { kind: 'monthly', bars: ['ucest'] },
    'monthly-reach':        { kind: 'monthly', bars: ['doseg'] },
    'monthly-counts-share': { kind: 'monthly', bars: ['objave', 'udio'], natH: 380, left: 0.07, top: 0.10, bottom: 0.14, gap: 0.197, yearsEach: true,
                              labels: { objave: 'Broj relevantnih institucionalnih objava', udio: 'Ponderirani udio (%)' } },
    'annual-share':         { kind: 'annual' },
    'expectations':         { kind: 'coef' }
  };

  var INK = '#000000', INK2 = '#555555', INK3 = '#8a8a8a';
  var BAR = '#333333', BAR_SOFT = '#c9c9c9', GRID = '#e3e3e3', YEARLINE = '#dedede';
  var ORANGE = '#eb6834', BLUE = '#2a78d6', AQUA = '#1baf7a';
  var FONT = 'Roboto, sans-serif';
  var MONTHS = ['siječanj', 'veljača', 'ožujak', 'travanj', 'svibanj', 'lipanj',
    'srpanj', 'kolovoz', 'rujan', 'listopad', 'studeni', 'prosinac'];
  var REDUCED = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ------------------------------------------------------------------ */
  /* Pomoćne funkcije                                                    */
  /* ------------------------------------------------------------------ */
  function num(v, dec) {
    var t = Math.abs(v).toFixed(dec).split('.');
    t[0] = t[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    return (v < 0 ? '−' : '') + t[0] + (t[1] ? ',' + t[1] : '');
  }
  var measurer = null;
  function textWidth(t, font) {
    if (!measurer) measurer = document.createElement('canvas').getContext('2d');
    measurer.font = font; return measurer.measureText(t).width;
  }
  function niceStep(vmax) {
    var raw = vmax / 3.2, p = Math.pow(10, Math.floor(Math.log(raw) / Math.LN10)), f = raw / p;
    return (f <= 1.2 ? 1 : f <= 2.4 ? 2 : f <= 6 ? 5 : 10) * p;
  }
  function el(tag, cls, text) {
    var n = document.createElement(tag);
    if (cls) n.className = cls;
    if (text != null) n.textContent = text;
    return n;
  }
  var SVGNS = 'http://www.w3.org/2000/svg';
  function svgEl(tag, attrs) {
    var n = document.createElementNS(SVGNS, tag);
    Object.keys(attrs).forEach(function (k) { n.setAttribute(k, attrs[k]); });
    return n;
  }
  /* Mali crtež uz naziv serije. Oblik i boja jednaki su onima na grafikonu. */
  function glyph(spec) {
    var svg = svgEl('svg', { 'class': 'lc-key', viewBox: '0 0 24 10', 'aria-hidden': 'true' });
    svg.style.color = spec.color || INK;
    if (spec.shape === 'bars') {
      [[3, 5, 5], [10, 1, 9], [17, 4, 6]].forEach(function (b) {
        svg.appendChild(svgEl('rect', { x: b[0], y: b[1], width: 4.5, height: b[2], fill: 'currentColor' }));
      });
    } else if (spec.shape === 'dot') {
      svg.appendChild(svgEl('line', { x1: 12, x2: 12, y1: 0.5, y2: 9.5, stroke: 'currentColor', 'stroke-width': 1.2 }));
      svg.appendChild(svgEl('circle', { cx: 12, cy: 5, r: 3, fill: spec.hollow ? '#ffffff' : 'currentColor', stroke: 'currentColor', 'stroke-width': 1.2 }));
    } else {
      var line = svgEl('line', { x1: 1, x2: 23, y1: 5, y2: 5, stroke: 'currentColor', 'stroke-width': Math.min(spec.w || 2, 2.4) });
      if (spec.dash) line.setAttribute('stroke-dasharray', spec.dash.map(function (x) { return x * 0.72; }).join(' '));
      if (spec.cap) line.setAttribute('stroke-linecap', spec.cap);
      svg.appendChild(line);
    }
    return svg;
  }
  function save(name, blob) {
    var a = document.createElement('a'), url = URL.createObjectURL(blob);
    a.href = url; a.download = name; document.body.appendChild(a); a.click(); a.remove();
    setTimeout(function () { URL.revokeObjectURL(url); }, 4000);
  }
  function text(sel, root) { var n = root.querySelector(sel); return n ? n.textContent.replace(/\s+/g, ' ').trim() : ''; }
  /* Nakon klika mišem gumb otpušta fokus. Inače bi razmaknica za sljedeći slajd
     ujedno ponovno pritisnula gumb. Fokus s tipkovnice ostaje netaknut. */
  function release(ev) { if (ev && ev.detail > 0 && ev.currentTarget && ev.currentTarget.blur) ev.currentTarget.blur(); }
  function baseOption(extra) {
    return {
      backgroundColor: 'transparent',
      animation: !REDUCED && !(extra && extra.still),
      animationDuration: 650, animationDurationUpdate: 480, animationEasing: 'cubicOut', animationEasingUpdate: 'cubicInOut',
      textStyle: { fontFamily: FONT }, tooltip: { show: false }
    };
  }
  var SOURCE_LINE = 'Palić i Sikić, Ekonomski susreti 2026.';
  function exportTitles(opt, section, sub, note) {
    opt.backgroundColor = '#ffffff';
    opt.title = [
      { text: text('h2', section), subtext: sub, left: 44, top: 30, itemGap: 10,
        textStyle: { fontFamily: FONT, fontWeight: 300, fontSize: 34, color: INK },
        subtextStyle: { fontFamily: FONT, fontSize: 15, color: INK2 } },
      { text: SOURCE_LINE + ' ' + note + '\nlusiki.github.io/Ekonomski-susreti', left: 44, bottom: 22,
        textStyle: { fontFamily: FONT, fontWeight: 400, fontSize: 13, lineHeight: 19, color: INK2 } }
    ];
    return opt;
  }

  /* ------------------------------------------------------------------ */
  /* Zajednički kostur živog grafikona                                   */
  /* ------------------------------------------------------------------ */
  var charts = [];

  function Live() {}
  Live.prototype.setup = function (img, cfg) {
    this.img = img; this.cfg = cfg; this.fig = img.parentNode; this.section = img.closest('section');
    this.chart = null;
    this.fig.classList.add('lc-host');
    this.host = el('div', 'lc-chart'); this.host.setAttribute('role', 'img');
    this.plot = el('div', 'lc-plot');
    this.tip = el('div', 'lc-tip'); this.tip.hidden = true;
    this.host.appendChild(this.plot); this.host.appendChild(this.tip);
    this.fig.appendChild(this.host);
    this.buildTools();
    var self = this;
    this.section.addEventListener('pointerenter', function () { lastTouched = self; });
    charts.push(this);
  };

  /* Traka nad naslovom. Prvo ono što slajd već prikazuje, zatim serije koje se
     mogu dodati, pa ljestvica i izvoz. */
  Live.prototype.buildTools = function () {
    var self = this, t = this.tools(), bar = el('div', 'lc-tools');
    bar.setAttribute('role', 'toolbar'); bar.setAttribute('aria-label', 'Serije na grafikonu');
    this.resetBtn = el('button', 'lc-chip lc-reset'); this.resetBtn.type = 'button';
    this.resetBtn.setAttribute('aria-label', 'Vrati izvorni prikaz'); this.resetBtn.title = 'Vrati izvorni prikaz (tipka 0)';
    var icon = svgEl('svg', { viewBox: '0 0 12 12', 'aria-hidden': 'true' });
    icon.appendChild(svgEl('path', { d: 'M2.2 6a3.8 3.8 0 1 0 1.2-2.8', fill: 'none', stroke: 'currentColor', 'stroke-width': 1.2 }));
    icon.appendChild(svgEl('path', { d: 'M1.2 1.6v2.6h2.6', fill: 'none', stroke: 'currentColor', 'stroke-width': 1.2 }));
    this.resetBtn.appendChild(icon); this.resetBtn.hidden = true;
    this.resetBtn.addEventListener('click', function (ev) { release(ev); self.reset(); });
    bar.appendChild(this.resetBtn);

    t.own.forEach(function (o) {
      var own = el('span', 'lc-own'); own.appendChild(glyph(o.glyph)); own.appendChild(el('span', null, o.text));
      own.title = o.title; bar.appendChild(own);
    });
    this.chips = {}; this.chipKeys = [];
    t.chips.forEach(function (c, i) {
      var b = el('button', 'lc-chip'); b.type = 'button';
      b.appendChild(glyph(c.glyph)); b.appendChild(el('span', null, c.text));
      b.setAttribute('aria-pressed', 'false'); b.title = c.title + ' (tipka ' + (i + 1) + ')';
      b.addEventListener('click', function (ev) { release(ev); self.toggle(c.key); });
      bar.appendChild(b); self.chips[c.key] = b; self.chipKeys.push(c.key);
    });
    this.indexBtn = null;
    if (t.index) {
      bar.appendChild(el('span', 'lc-sep'));
      this.indexBtn = el('button', 'lc-chip lc-plain', 'Indeks'); this.indexBtn.type = 'button';
      this.indexBtn.setAttribute('aria-pressed', 'false');
      this.indexBtn.addEventListener('click', function (ev) { release(ev); self.toggleIndex(); });
      bar.appendChild(this.indexBtn);
    }
    if (t.own.length || t.chips.length) bar.appendChild(el('span', 'lc-sep'));
    ['png', 'svg', 'csv'].forEach(function (f) {
      var b = el('button', 'lc-chip lc-plain lc-dl', f.toUpperCase()); b.type = 'button';
      b.title = 'Preuzmi trenutačni prikaz, ' + f.toUpperCase();
      b.addEventListener('click', function (ev) { release(ev); self.download(f); });
      bar.appendChild(b);
    });
    this.toolbar = bar;
    this.section.appendChild(bar);
  };

  /* Slika se u okvir uklapa bez izobličenja, pa grafikon zauzima isti dio okvira. */
  Live.prototype.measure = function () {
    var img = this.img, nw = this.natW, nh = this.natH;
    var bw = img.offsetWidth, bh = img.offsetHeight || Math.round(bw * nh / nw);
    var s = Math.min(bw / nw, bh / nh);
    this.W = bw; this.H = bh;
    this.box = { x: (bw - nw * s) / 2, y: (bh - nh * s) / 2, W: nw * s, H: nh * s };
    this.host.style.left = img.offsetLeft + 'px'; this.host.style.top = img.offsetTop + 'px';
    this.host.style.width = bw + 'px'; this.host.style.height = bh + 'px';
  };

  Live.prototype.tryInit = function () {
    if (this.chart || !this.fig.offsetWidth) return;
    try {
      this.measure();
      this.chart = E.init(this.plot, null, { renderer: 'svg', width: this.W, height: this.H });
      this.opt = this.option(this.box, { still: true });
      this.chart.setOption(this.opt);
      this.bind();
    } catch (err) {
      if (window.console) console.warn('Živi grafikon nije pokrenut', err);
      if (this.chart) { this.chart.dispose(); this.chart = null; }
      this.host.remove(); this.toolbar.remove(); this.fig.classList.remove('lc-host');
      charts.splice(charts.indexOf(this), 1);
      return;
    }
    var self = this;
    this.chart.getZr().on('globalout', function () { self.hideTip(); });
    this.fig.classList.add('lc-live'); this.section.classList.add('lc-ready');
    this.sync();
  };

  Live.prototype.render = function () {
    if (!this.chart) return;
    this.hideTip();
    this.opt = this.option(this.box);
    this.chart.setOption(this.opt, { replaceMerge: ['grid', 'xAxis', 'yAxis', 'series'] });
    this.sync();
  };

  Live.prototype.placeTip = function (x, y) {
    this.tip.style.transform = 'translate(' + Math.round(x) + 'px,' + Math.round(y) + 'px)';
  };
  Live.prototype.hideTip = function () { this.tip.hidden = true; this.tipSide = null; };
  Live.prototype.toggleIndex = function () {};

  Live.prototype.download = function (format) {
    var self = this;
    if (format === 'csv') return save(this.fileName('csv'), new Blob([this.csv()], { type: 'text/csv;charset=utf-8' }));
    var ex = this.exportSpec(), div = document.createElement('div');
    div.style.cssText = 'position:fixed;left:-99999px;top:0;width:' + ex.W + 'px;height:' + ex.H + 'px';
    document.body.appendChild(div);
    var c = E.init(div, null, { renderer: format === 'svg' ? 'svg' : 'canvas', width: ex.W, height: ex.H, devicePixelRatio: 2 });
    c.setOption(ex.opt);
    setTimeout(function () {
      try {
        if (format === 'svg') save(self.fileName('svg'), new Blob([c.renderToSVGString()], { type: 'image/svg+xml' }));
        else c.getDom().querySelector('canvas').toBlob(function (b) { if (b) save(self.fileName('png'), b); });
      } finally { setTimeout(function () { c.dispose(); div.remove(); }, 500); }
    }, 60);
  };

  /* ================================================================== */
  /* Mjesečni grafikoni, slajdovi 7, 8, 10, 11 i 12                      */
  /* ================================================================== */
  var S = {
    hicp:   { key: 'hicp_pct',           mult: 1,   unit: 'pct',   name: 'Inflacija',              chip: 'Inflacija',  dec: 1, max: 15,   step: 5,    w: 2.4, dash: null, color: ORANGE },
    udio:   { key: 'weighted_share',     mult: 100, unit: 'pct',   name: 'Ponderirani udio',       chip: 'Udio',       dec: 1, max: 18,   step: 5,    w: 2.4, dash: null, color: BLUE },
    ucest:  { key: 'relative_frequency', mult: 100, unit: 'pct',   name: 'Relativna učestalost',   chip: 'Učestalost', dec: 1, max: 30,   step: 10,   w: 2.4, dash: [7, 4], color: AQUA },
    doseg:  { key: 'relative_reach',     mult: 1,   unit: 'ratio', name: 'Relativni doseg',        chip: 'Doseg',      dec: 2, max: 1.15, step: 0.3,  w: 2.2, dash: [0.1, 4.4], cap: 'round', color: INK },
    objave: { key: 'relevant_posts',     mult: 1,   unit: 'count', name: 'Institucionalne objave', chip: 'Objave',     dec: 0, max: 2200, step: 1000, w: 1.7, dash: [11, 3, 2, 3], color: INK2 },
    sve:    { key: 'inflation_posts',    mult: 1,   unit: 'count', name: 'Sve objave o inflaciji', chip: 'Sve objave', dec: 0,                         w: 1.5, dash: [3, 3], color: INK3 }
  };
  var ORDER = ['hicp', 'udio', 'ucest', 'doseg', 'objave', 'sve'];
  var UNIT_LABEL = { pct: '%', ratio: 'Omjer', count: 'Broj objava', index: 'Indeks, prva polovica 2021. = 100' };
  var ROWS = D && D.monthly ? D.monthly : [], N = ROWS.length;
  var YEARS = [], YEAR_STARTS = {};

  if (N) {
    ORDER.forEach(function (k) {
      var s = S[k], base = 0, n = 0;
      s.v = ROWS.map(function (r) { return r[s.key] * s.mult; });
      ROWS.forEach(function (r, i) { if (r.month >= '2021-01' && r.month <= '2021-06') { base += s.v[i]; n += 1; } });
      s.base = base / n;
      s.ix = s.v.map(function (x) { return x / s.base * 100; });
    });
    /* Godine na osi x izvode se iz podataka, pa nepotpuna godina sama dobiva zvjezdicu. */
    (function () {
      var cur = null;
      ROWS.forEach(function (r, i) {
        var y = r.month.slice(0, 4);
        if (!cur || cur.y !== y) { cur = { y: y, a: i, b: i }; YEARS.push(cur); if (i > 0) YEAR_STARTS[i] = true; }
        cur.b = i;
      });
      YEARS.forEach(function (y) { y.c = (y.a + y.b) / 2; y.label = y.y + '.' + (y.b - y.a + 1 < 12 ? '*' : ''); });
    })();
  }

  function withUnit(k, v) { return num(v, S[k].dec) + (S[k].unit === 'pct' ? ' %' : ''); }
  function monthName(i) { var m = ROWS[i].month; return MONTHS[+m.slice(5) - 1] + ' ' + m.slice(0, 4) + '.'; }
  function tickText(unit, v) { return unit === 'ratio' ? num(v, 1) : num(v, 0); }
  function unitFont(u) { return '400 ' + (18 * u) + 'px ' + FONT; }
  function keysOf(p) { return (p.bars ? [p.bars] : []).concat(p.area ? [p.area] : [], p.lines); }
  function vals(k, p) { return p.unit === 'index' ? S[k].ix : S[k].v; }
  function lineGlyph(k) { return { shape: 'line', color: S[k].color, w: S[k].w, dash: S[k].dash, cap: S[k].cap }; }

  /* Iz stanja u raspored panela. */
  function plan(st, cfg) {
    var bars = cfg.bars, P = [];
    var on = function (k) { return !!st.on[k]; };
    if (bars.length > 1) {
      /* Slajd s dva zadana panela. Dodana serija ulazi u panel svoje jedinice. */
      bars.forEach(function (b) {
        P.push({ unit: S[b].unit, bars: b, label: cfg.labels && cfg.labels[b],
          lines: ORDER.filter(function (k) { return bars.indexOf(k) < 0 && on(k) && S[k].unit === S[b].unit; }) });
      });
      return { panels: P, index: false, forced: false, canIndex: false };
    }
    var primary = bars[0];
    var att = ORDER.filter(function (k) { return k !== 'hicp' && (k === primary || on(k)); });
    var units = [];
    att.forEach(function (k) { if (units.indexOf(S[k].unit) < 0) units.push(S[k].unit); });
    var forced = units.length > 1, index = att.length > 0 && (forced || !!st.index);
    var unit = index ? 'index' : units[0];
    if (primary !== 'hicp') {
      var main = { unit: unit, bars: primary, lines: att.filter(function (k) { return k !== primary; }) };
      if (on('hicp')) {
        if (unit === 'pct') main.lines.unshift('hicp');
        else P.push({ strip: true, unit: 'pct', area: 'hicp', lines: [], label: 'Inflacija, %' });
      }
      P.push(main);
    } else if (!att.length || unit === 'pct') {
      P.push({ unit: 'pct', bars: 'hicp', lines: att });
    } else {
      P.push({ unit: 'pct', bars: 'hicp', lines: [], weight: 0.42, label: 'Inflacija, %' });
      P.push({ unit: unit, bars: null, lines: att, weight: 0.58 });
    }
    return { panels: P, index: index, forced: forced, canIndex: att.length > 0 };
  }

  function scaleOf(p, u) {
    if (p.strip) return { max: 15, step: 10, ticks: [0, 10] };
    var vmax = 0;
    keysOf(p).forEach(function (k) { vmax = Math.max(vmax, Math.max.apply(null, vals(k, p))); });
    var own = p.bars || (p.lines.length === 1 ? p.lines[0] : null), s = own && S[own], step, max;
    if (p.unit !== 'index' && s && s.max && vmax <= s.max) { step = s.step; max = s.max; }
    else {
      step = (p.unit === 'index' && vmax <= 520) ? 100 : niceStep(vmax); max = Math.max(vmax * 1.07, step * 1.2);
      /* U niskom panelu oznake se prorjeđuju da ne stoje jedna na drugoj. */
      while (max / step > 2.2 && p.h / (max / step) < 32 * u) step *= 2;
    }
    var ticks = [];
    for (var t = 0; t <= max + 1e-9; t += step) ticks.push(+t.toFixed(6));
    return { max: max, step: step, ticks: ticks };
  }

  /* Raspored je izveden iz matplotlib skripte, pa se stupci poklapaju sa slikom. */
  function monthlyOption(st, cfg, box, extra) {
    var pl = plan(st, cfg), P = pl.panels, n = P.length, u = box.W / 1136;
    var L = cfg.left || 0.065, T = cfg.top || 0.09, B = cfg.bottom || 0.15, G = cfg.gap || 0.115;
    /* Desni rub prima oznake serija, pa je širok koliko i najdulja među njima. */
    var widest = 0, labelFont = '400 ' + (16 * u) + 'px ' + FONT;
    P.forEach(function (p) { if (p.lines.length) keysOf(p).forEach(function (k) { widest = Math.max(widest, textWidth(S[k].name, labelFont)); }); });
    var gutter = widest ? widest + 30 * u : 0.01 * box.W;
    var axL = box.x + L * box.W, axR = box.x + box.W - gutter;
    var unitW = (axR - axL) / (N + 1), half = unitW / 2;
    var gap = G * box.H, free = box.H * (1 - T - B) - (n - 1) * gap, wsum = 0, y = box.y + T * box.H;
    P.forEach(function (p) { if (p.strip) free -= 0.19 * box.H; else wsum += (p.weight || 1); });
    P.forEach(function (p) { p.top = y; p.h = p.strip ? 0.19 * box.H : free * (p.weight || 1) / wsum; y += p.h + gap; });

    var tickFont = { color: INK, fontFamily: FONT, fontSize: 19.4 * u };
    var months = ROWS.map(function (row) { return row.month; });
    var yearSplit = { show: true, showMinLine: false, showMaxLine: false, interval: function (i) { return !!YEAR_STARTS[i]; }, lineStyle: { color: YEARLINE, width: 1 } };
    var pointer = { show: true, triggerTooltip: false, snap: true, type: 'shadow', shadowStyle: { color: 'rgba(0,0,0,0.07)' }, label: { show: false }, z: 0 };
    var grids = [], xCat = [], xYear = [], yAxes = [], series = [], graphic = [], linked = [];

    P.forEach(function (p, i) {
      var sc = scaleOf(p, u), gid = 'g' + i, xid = 'x' + i, yid = 'y' + i, soft = p.lines.length > 0;
      var onTop = Math.abs(sc.ticks[sc.ticks.length - 1] - sc.max) < 1e-9;
      p.max = sc.max; linked.push(xid);
      grids.push({ id: gid, left: axL + half, top: p.top, width: axR - axL - unitW, height: p.h, outerBoundsMode: 'none', containLabel: false });
      xCat.push({ id: xid, gridId: gid, type: 'category', data: months, boundaryGap: true,
        axisLine: { show: true, lineStyle: { color: '#bdbdbd', width: 1 } }, axisTick: { show: false },
        axisLabel: { show: false }, splitLine: yearSplit, axisPointer: pointer });
      if (i === n - 1 || cfg.yearsEach) {
        xYear.push({ id: 'yr' + i, gridId: gid, type: 'value', min: -0.5, max: N - 0.5, position: 'bottom',
          axisLine: { show: false }, axisTick: { show: false }, splitLine: { show: false }, axisPointer: { show: false },
          axisLabel: Object.assign({ margin: 18 * u, customValues: YEARS.map(function (yy) { return yy.c; }),
            formatter: function (v) { for (var j = 0; j < YEARS.length; j++) if (Math.abs(YEARS[j].c - v) < 0.01) return YEARS[j].label; return ''; } }, tickFont) });
      }
      yAxes.push({ id: yid, gridId: gid, type: 'value', min: 0, max: sc.max, interval: sc.step, offset: half,
        axisLine: { show: false }, axisTick: { show: false },
        splitLine: { show: true, showMaxLine: onTop, lineStyle: { color: GRID, width: 1 } },
        axisLabel: Object.assign({ margin: 13.9 * u, showMaxLabel: true, rich: { n: { padding: [6 * u, 0, 0, 0] } },
          customValues: sc.ticks, formatter: function (v) { return '{n|' + tickText(p.unit, v) + '}'; } }, tickFont),
        axisPointer: { show: false } });

      /* Referentna razina indeksa. Izvan indeksa popis je prazan, da se crta ne zadrži. */
      var first = true;
      var baseline = function () {
        var show = p.unit === 'index' && first; first = false;
        return { silent: true, symbol: 'none', animation: false, label: { show: false },
          lineStyle: { color: INK3, width: 1, type: 'solid' }, data: show ? [{ yAxis: 100 }] : [] };
      };
      if (p.bars) {
        series.push({ id: 'bars-' + p.bars, name: p.bars, type: 'bar', xAxisId: xid, yAxisId: yid, data: vals(p.bars, p),
          barWidth: '78%', z: 2, itemStyle: { color: soft ? BAR_SOFT : BAR },
          emphasis: { itemStyle: { color: soft ? INK3 : INK } }, markLine: baseline() });
      }
      if (p.area) {
        var a = S[p.area];
        series.push({ id: p.area + '-strip', name: p.area, type: 'line', xAxisId: xid, yAxisId: yid, data: a.v, z: 4,
          showSymbol: false, symbol: 'circle', symbolSize: 9 * u,
          itemStyle: { color: a.color, borderColor: '#ffffff', borderWidth: 2 * u },
          lineStyle: { color: a.color, width: 2 * u, join: 'round' }, areaStyle: { color: a.color, opacity: 0.14 },
          emphasis: { scale: false, lineStyle: { width: 2 * u }, areaStyle: { color: a.color, opacity: 0.14 } } });
      }
      p.lines.forEach(function (k) {
        var s = S[k], data = vals(k, p);
        series.push({ id: k + '-halo', type: 'line', xAxisId: xid, yAxisId: yid, data: data, silent: true, z: 3,
          showSymbol: false, symbol: 'none', tooltip: { show: false }, emphasis: { disabled: true },
          lineStyle: { color: '#ffffff', width: (s.w + 3.2) * u, cap: 'round', join: 'round' } });
        series.push({ id: k, name: k, type: 'line', xAxisId: xid, yAxisId: yid, data: data, z: 4,
          showSymbol: false, symbol: 'circle', symbolSize: 9 * u,
          itemStyle: { color: s.color, borderColor: '#ffffff', borderWidth: 2 * u },
          lineStyle: { color: s.color, width: s.w * u, type: s.dash ? s.dash.map(function (x) { return x * u; }) : 'solid', cap: s.cap || 'butt', join: 'round' },
          emphasis: { scale: false, lineStyle: { width: s.w * u } }, markLine: baseline(),
          endLabel: { show: true, formatter: s.name, color: INK, fontFamily: FONT, fontSize: 16 * u, distance: 10 * u, padding: [3 * u, 0, 3 * u, 0] },
          labelLayout: { moveOverlap: 'shiftY' } });
      });
      if (p.bars && soft) {
        /* Nevidljiva linija nosi oznaku stupaca uz desni rub, da i oni budu imenovani. */
        series.push({ id: 'label-' + p.bars, type: 'line', xAxisId: xid, yAxisId: yid, data: vals(p.bars, p), silent: true, z: 1, animation: false,
          showSymbol: false, symbol: 'none', tooltip: { show: false }, emphasis: { disabled: true }, lineStyle: { opacity: 0, width: 0 },
          endLabel: { show: true, formatter: S[p.bars].name, color: INK2, fontFamily: FONT, fontSize: 16 * u, distance: 10 * u, padding: [3 * u, 0, 3 * u, 0] },
          labelLayout: { moveOverlap: 'shiftY' } });
      }
      p.label = p.label || UNIT_LABEL[p.unit];
      p.labelEnd = axL + textWidth(p.label, unitFont(u));
    });
    [0, 1].forEach(function (i) {
      var p = P[i];
      graphic.push({ type: 'text', id: 'unit' + i, silent: true, z: 1, invisible: !p,
        left: axL, top: p ? p.top - 0.035 * p.h - 15.5 * u : 0,
        style: { text: p ? p.label : '', fill: INK2, font: unitFont(u) } });
    });

    var anchor = 0;
    P.forEach(function (p, i) { if (p.h > P[anchor].h) anchor = i; });
    var opt = baseOption(extra);
    opt.grid = grids; opt.xAxis = xCat.concat(xYear); opt.yAxis = yAxes; opt.series = series; opt.graphic = graphic;
    opt.axisPointer = { link: n > 1 ? [{ xAxisId: linked }] : [], triggerOn: 'mousemove|click' };
    opt._plan = pl; opt._geo = { axL: axL, unitW: unitW, u: u, anchor: anchor };
    return opt;
  }

  function Monthly(img, cfg) {
    this.natW = 1136; this.natH = cfg.natH || 365;
    this.st = { on: {}, index: false };
    this.setup(img, cfg);
  }
  Monthly.prototype = Object.create(Live.prototype);

  Monthly.prototype.addable = function () {
    var bars = this.cfg.bars;
    return ORDER.filter(function (k) {
      if (bars.indexOf(k) >= 0) return false;
      return bars.length === 1 || bars.some(function (b) { return S[b].unit === S[k].unit; });
    });
  };
  Monthly.prototype.tools = function () {
    return {
      own: this.cfg.bars.map(function (b) { return { glyph: { shape: 'bars', color: INK }, text: S[b].chip, title: S[b].name + ', stupci' }; }),
      chips: this.addable().map(function (k) { return { key: k, glyph: lineGlyph(k), text: S[k].chip, title: S[k].name }; }),
      index: this.cfg.bars.length === 1
    };
  };
  Monthly.prototype.option = function (box, extra) { return monthlyOption(this.st, this.cfg, box, extra); };
  Monthly.prototype.bind = function () {
    var self = this;
    this.chart.on('updateAxisPointer', function (ev) {
      var info = null, n = self.opt._plan.panels.length;
      (ev.axesInfo || []).forEach(function (a) { if (!info && a.axisDim === 'x' && a.axisIndex < n && a.value != null) info = a; });
      if (info) self.showTip(info.value); else self.hideTip();
    });
  };
  Monthly.prototype.visible = function () {
    var out = [];
    this.opt._plan.panels.forEach(function (p) { keysOf(p).forEach(function (k) { out.push({ key: k, panel: p }); }); });
    return out;
  };
  Monthly.prototype.sync = function () {
    var pl = this.opt._plan, self = this, st = this.st;
    Object.keys(this.chips).forEach(function (k) { self.chips[k].setAttribute('aria-pressed', st.on[k] ? 'true' : 'false'); });
    if (this.indexBtn) {
      this.indexBtn.setAttribute('aria-pressed', pl.index ? 'true' : 'false');
      this.indexBtn.disabled = pl.forced || !pl.canIndex;
      this.indexBtn.title = pl.forced ? 'Serije su u različitim jedinicama, pa se prikazuju kao indeks'
        : !pl.canIndex ? 'Indeks vrijedi za dodane mjere pozornosti' : 'Indeks, prva polovica 2021. = 100 (tipka I)';
    }
    this.resetBtn.hidden = !(st.index || Object.keys(st.on).some(function (k) { return st.on[k]; }));
    this.host.setAttribute('aria-label', 'Mjesečni podaci, siječanj 2021. do kolovoza 2026. Prikazano: ' +
      this.visible().map(function (v) { return S[v.key].name; }).join(', ') + (pl.index ? '. Indeks, prva polovica 2021. = 100.' : '.'));
  };
  Monthly.prototype.toggle = function (k) { if (!this.chips[k]) return; this.st.on[k] = !this.st.on[k]; this.render(); };
  Monthly.prototype.toggleIndex = function () {
    var pl = this.opt._plan;
    if (!this.indexBtn || pl.forced || !pl.canIndex) return;
    this.st.index = !this.st.index; this.render();
  };
  Monthly.prototype.reset = function () { this.st.on = {}; this.st.index = false; this.render(); };

  /* Okvir uz pokazivač. Vrijednosti vode, nazivi slijede. */
  Monthly.prototype.showTip = function (i) {
    if (i < 0 || i >= N) return this.hideTip();
    var g = this.opt._geo, P = this.opt._plan.panels, tip = this.tip, a = P[g.anchor];
    tip.textContent = '';
    tip.appendChild(el('div', 'lc-tip-month', monthName(i)));
    this.visible().forEach(function (v) {
      var k = v.key, row = el('div', 'lc-tip-row');
      row.appendChild(glyph(k === v.panel.bars ? { shape: 'bars', color: INK } : lineGlyph(k)));
      row.appendChild(el('span', 'lc-tip-name', S[k].name));
      var val = el('span', 'lc-tip-val');
      if (v.panel.unit === 'index') {
        val.appendChild(el('b', null, num(S[k].ix[i], 0)));
        val.appendChild(el('i', null, withUnit(k, S[k].v[i])));
      } else val.appendChild(el('b', null, withUnit(k, S[k].v[i])));
      row.appendChild(val); tip.appendChild(row);
    });
    tip.hidden = false;
    /* Okvir staje na onu stranu pokazivača gdje zaklanja niže vrijednosti. */
    var cx = this.chart.convertToPixel({ xAxisId: 'x0' }, i), w = tip.offsetWidth, gap = g.unitW * 0.5 + 12 * g.u;
    var right = cx + gap, left = cx - gap - w, span = Math.ceil((w + gap) / g.unitW);
    var peak = function (from, to) {
      var m = 0;
      keysOf(a).forEach(function (k) {
        var d = vals(k, a);
        for (var j = Math.max(0, from); j <= Math.min(N - 1, to); j++) m = Math.max(m, d[j]);
      });
      return m;
    };
    var fitsR = right + w <= this.W - 2, fitsL = left >= g.axL + 2;
    var pl = peak(i - span, i - 1), pr = peak(i + 1, i + span);
    var x = fitsR && fitsL ? (pl < pr ? left : right) : (fitsR ? right : left);
    if (this.tipSide != null && fitsR && fitsL && Math.abs(pl - pr) < 0.12 * a.max) x = this.tipSide < 0 ? left : right;
    this.tipSide = x === left ? -1 : 1;
    /* Okvir kreće iz praznog retka iznad panela, osim kad bi prekrio oznaku jedinice. */
    this.placeTip(x, (x < a.labelEnd + 10 * g.u) ? a.top + 4 * g.u : a.top - 30 * g.u);
  };

  Monthly.prototype.fileName = function (ext) {
    return 'ekonomski-susreti-' + this.visible().map(function (v) { return v.key; }).join('-') + (this.opt._plan.index ? '-indeks' : '') + '.' + ext;
  };
  Monthly.prototype.exportSpec = function () {
    var W = 1280, bw = 1192, bh = Math.round(bw * this.natH / this.natW) + 47;
    var opt = monthlyOption(this.st, this.cfg, { x: 44, y: 118, W: bw, H: bh }, { still: true });
    var names = [];
    opt._plan.panels.forEach(function (p) { keysOf(p).forEach(function (k) { names.push(S[k].name); }); });
    exportTitles(opt, this.section, names.join(' · ') + ' · siječanj 2021. do kolovoza 2026.',
      'Mjesečni agregati. *2026. ima osam mjeseci.');
    return { opt: opt, W: W, H: 118 + bh + 112 };
  };
  Monthly.prototype.csv = function () {
    var vis = this.visible(), head = ['month'];
    vis.forEach(function (v) {
      var s = S[v.key]; head.push(s.key + (s.mult === 100 ? '_pct' : ''));
      if (v.panel.unit === 'index') head.push(s.key + '_index_2021h1');
    });
    return head.join(',') + '\n' + ROWS.map(function (row, i) {
      var out = [row.month];
      vis.forEach(function (v) {
        var s = S[v.key]; out.push(+s.v[i].toFixed(6));
        if (v.panel.unit === 'index') out.push(+s.ix[i].toFixed(3));
      });
      return out.join(',');
    }).join('\n') + '\n';
  };

  /* ================================================================== */
  /* Godišnji pregled, slajd 9                                           */
  /* ================================================================== */
  function annualOption(box, extra) {
    var rows = ANNUAL.annual, u = box.W / 1136;
    var axL = box.x + 0.055 * box.W, axR = box.x + 0.985 * box.W, band = (axR - axL) / 6.2;
    var top = box.y + 0.14 * box.H, h = box.H * (1 - 0.14 - 0.18);
    var grey = { color: INK2, fontFamily: FONT, fontSize: 20.8 * u };
    var opt = baseOption(extra);
    opt.grid = [{ id: 'g', left: axL + 0.1 * band, top: top, width: 6 * band, height: h, outerBoundsMode: 'none', containLabel: false }];
    opt.xAxis = [{ id: 'x', gridId: 'g', type: 'category', boundaryGap: true,
      data: rows.map(function (r) { return r.year + (r.months < 12 ? '*' : ''); }),
      axisLine: { show: true, lineStyle: { color: '#bdbdbd', width: 1 } }, axisTick: { show: false }, splitLine: { show: false },
      axisLabel: Object.assign({ margin: 19 * u, interval: 0 }, grey),
      axisPointer: { show: true, triggerTooltip: false, type: 'shadow', shadowStyle: { color: 'rgba(0,0,0,0.06)' }, label: { show: false }, z: 0 } }];
    opt.yAxis = [{ id: 'y', gridId: 'g', type: 'value', min: 0, max: 7.15, interval: 2, offset: 0.1 * band,
      axisLine: { show: false }, axisTick: { show: false }, axisPointer: { show: false },
      splitLine: { show: true, showMaxLine: false, lineStyle: { color: '#e5e5e5', width: 1 } },
      axisLabel: Object.assign({ margin: 13.9 * u, showMaxLabel: true, customValues: [0, 2, 4, 6], rich: { n: { padding: [6 * u, 0, 0, 0] } },
        formatter: function (v) { return '{n|' + num(v, 0) + '}'; } }, grey) }];
    opt.series = [{ id: 'bars', type: 'bar', xAxisId: 'x', yAxisId: 'y', barWidth: '55%', z: 2,
      label: { show: true, position: 'top', distance: 10 * u, color: INK, fontFamily: FONT, fontSize: 26.4 * u,
        formatter: function (p) { return num(p.value, 2) + ' %'; } },
      emphasis: { disabled: true },
      data: rows.map(function (r, i) {
        var partial = r.months < 12;
        return { value: r.weighted_share_pct, itemStyle: { color: i === 0 ? INK : partial ? '#ffffff' : INK3, borderColor: INK, borderWidth: 1.1 * u,
          decal: partial ? { symbol: 'rect', color: INK, dashArrayX: [1, 0], dashArrayY: [0.9 * u, 6.2 * u], rotation: -Math.PI / 4 } : { symbol: 'none' } } };
      }) }];
    opt.graphic = [{ type: 'text', id: 'title', silent: true, left: axL, top: top - 48.5 * u,
      style: { text: 'Ponderirani udio u inflacijskom diskursu', fill: INK, font: '400 ' + (25 * u) + 'px ' + FONT } }];
    opt.axisPointer = { triggerOn: 'mousemove|click' };
    opt._geo = { top: top, band: band, u: u, right: axR, y0: box.y };
    return opt;
  }

  function Annual(img, cfg) { this.natW = 1136; this.natH = 365; this.setup(img, cfg); }
  Annual.prototype = Object.create(Live.prototype);
  Annual.prototype.tools = function () { return { own: [], chips: [], index: false }; };
  Annual.prototype.option = function (box, extra) { return annualOption(box, extra); };
  Annual.prototype.bind = function () {
    var self = this;
    this.chart.on('updateAxisPointer', function (ev) {
      var info = (ev.axesInfo || [])[0];
      if (info && info.value != null) self.showTip(info.value); else self.hideTip();
    });
  };
  Annual.prototype.sync = function () {
    this.host.setAttribute('aria-label', this.img.getAttribute('alt') || 'Godišnji ponderirani udio, 2021. do 2026.');
  };
  Annual.prototype.toggle = function () {};
  Annual.prototype.reset = function () {};
  Annual.prototype.showTip = function (i) {
    var r = ANNUAL.annual[i], g = this.opt._geo, tip = this.tip;
    if (!r) return this.hideTip();
    tip.textContent = '';
    tip.appendChild(el('div', 'lc-tip-month', r.year + '.' + (r.months < 12 ? ' siječanj do kolovoza' : '')));
    [['Ponderirani udio', num(r.weighted_share_pct, 2) + ' %'], ['Prosječna inflacija', num(r.mean_hicp_pct, 2) + ' %'],
      ['Relevantne objave', num(r.relevant_posts, 0)], ['Institucionalne objave', num(r.institutional_posts, 0)]].forEach(function (p) {
      var row = el('div', 'lc-tip-row');
      row.appendChild(el('span', 'lc-tip-name', p[0]));
      var val = el('span', 'lc-tip-val'); val.appendChild(el('b', null, p[1])); row.appendChild(val); tip.appendChild(row);
    });
    tip.hidden = false;
    /* Stupci padaju udesno, pa okvir stoji u praznom gornjem desnom kutu i ne prekriva nijednu vrijednost. */
    this.placeTip(g.right - tip.offsetWidth, g.y0);
  };
  Annual.prototype.fileName = function (ext) { return 'ekonomski-susreti-godisnji-udio.' + ext; };
  Annual.prototype.exportSpec = function () {
    var opt = annualOption({ x: 44, y: 110, W: 1192, H: 383 }, { still: true });
    exportTitles(opt, this.section, 'Omjer godišnjih zbrojeva, ne prosjek mjesečnih udjela', 'Tablica 1. *2026. je siječanj do kolovoza.');
    return { opt: opt, W: 1280, H: 610 };
  };
  Annual.prototype.csv = function () {
    return 'year,months,weighted_share_pct,mean_hicp_pct,relevant_posts,institutional_posts\n' + ANNUAL.annual.map(function (r) {
      return [r.year, r.months, r.weighted_share_pct, r.mean_hicp_pct, r.relevant_posts, r.institutional_posts].join(',');
    }).join('\n') + '\n';
  };

  /* ================================================================== */
  /* Očekivanja po horizontima, slajd 17                                 */
  /* ================================================================== */
  var SPEC = {
    lin:  { match: 'lin',  name: 'Linearno mapiranje',   chip: 'Linearno',   color: INK },
    step: { match: 'step', name: 'Stepenasto mapiranje', chip: 'Stepenasto', color: BLUE }
  };
  if (ORIGINAL && ORIGINAL.expectations_table_7a) {
    Object.keys(SPEC).forEach(function (k) {
      /* Procjene su u izvoru izražene za jediničnu promjenu udjela. Dijeljenje sa 100 daje promjenu uz 1 p. b. */
      SPEC[k].rows = ORIGINAL.expectations_table_7a.filter(function (r) { return r.spec.indexOf('(' + SPEC[k].match) >= 0; }).map(function (r) {
        return { h: r.horizon, b: r.beta / 100, lo: (r.beta - 1.96 * r.se) / 100, hi: (r.beta + 1.96 * r.se) / 100, p: r.p, pb: r.p_bonf, n: r.N, sig: r.p_bonf < 0.05 };
      });
    });
  }
  function weeks(h) { return h + (h === 1 ? ' tjedan' : h >= 2 && h <= 4 ? ' tjedna' : ' tjedana'); }

  function coefOption(st, box, extra) {
    var u = box.W / 700, k = 100 / 72 * u, shown = st.step ? ['lin', 'step'] : ['lin'], dodge = st.step ? 0.16 : 0;
    var left = box.x + 0.12 * box.W, top = box.y + 0.21 * box.H, w = 0.86 * box.W, h = box.H * (1 - 0.21 - 0.18);
    var tick = { color: INK, fontFamily: FONT, fontSize: 14 * k };
    var horizons = SPEC.lin.rows.map(function (r) { return r.h; });
    var opt = baseOption(extra);
    opt.grid = [{ id: 'g', left: left, top: top, width: w, height: h, outerBoundsMode: 'none', containLabel: false }];
    opt.xAxis = [{ id: 'x', gridId: 'g', type: 'value', min: -0.5, max: 12.5,
      axisLine: { show: true, lineStyle: { color: '#bbbbbb', width: 1 } }, axisTick: { show: false }, splitLine: { show: false },
      axisLabel: Object.assign({ margin: 10 * k, customValues: horizons, formatter: function (v) { return String(Math.round(v)); } }, tick),
      name: 'Horizont (tjedni)', nameLocation: 'middle', nameGap: 40.5 * k, nameTextStyle: tick }];
    opt.yAxis = [{ id: 'y', gridId: 'g', type: 'value', min: -0.95, max: 0.1, interval: 0.2,
      axisLine: { show: false }, axisTick: { show: false, customValues: [-0.8, -0.6, -0.4, -0.2, 0] },
      splitLine: { show: true, showMinLine: false, showMaxLine: false, lineStyle: { color: GRID, width: 1 } },
      axisLabel: Object.assign({ margin: 7.7 * k, showMinLabel: true, showMaxLabel: true, customValues: [-0.8, -0.6, -0.4, -0.2, 0],
        rich: { n: { padding: [5 * u, 0, 0, 0] } }, formatter: function (v) { return '{n|' + num(v, 1).replace('−', '-') + '}'; } }, tick) }];
    opt.series = [];
    shown.forEach(function (key, j) {
      var sp = SPEC[key], dx = dodge * (j === 0 ? -1 : 1), stroke = { stroke: sp.color, lineWidth: 1.4 * k, fill: null };
      opt.series.push({ id: 'err-' + key, type: 'custom', xAxisId: 'x', yAxisId: 'y', silent: true, z: 2,
        data: sp.rows.map(function (r) { return [r.h + dx, r.lo, r.hi]; }), encode: { x: 0, y: [1, 2] },
        renderItem: function (params, api) {
          var x = api.value(0), a = api.coord([x, api.value(1)]), b = api.coord([x, api.value(2)]), c = 3 * k;
          return { type: 'group', children: [
            { type: 'line', shape: { x1: a[0], y1: a[1], x2: b[0], y2: b[1] }, style: stroke },
            { type: 'line', shape: { x1: a[0] - c, y1: a[1], x2: a[0] + c, y2: a[1] }, style: stroke },
            { type: 'line', shape: { x1: b[0] - c, y1: b[1], x2: b[0] + c, y2: b[1] }, style: stroke }] };
        } });
      opt.series.push({ id: 'pt-' + key, type: 'scatter', xAxisId: 'x', yAxisId: 'y', z: 3, symbol: 'circle', symbolSize: 6.4 * k, silent: true,
        emphasis: { scale: 1.45 },
        markLine: { silent: true, symbol: 'none', animation: false, label: { show: false }, lineStyle: { color: '#777777', width: 1.1 * k, type: 'solid' }, data: j === 0 ? [{ yAxis: 0 }] : [] },
        data: sp.rows.map(function (r) { return { value: [r.h + dx, r.b], itemStyle: { color: r.sig ? sp.color : '#ffffff', borderColor: sp.color, borderWidth: 1.2 * k } }; }) });
    });
    opt.graphic = [
      { type: 'rect', id: 'band', silent: true, z: 0, invisible: true, shape: { x: 0, y: top, width: 10, height: h }, style: { fill: 'rgba(0,0,0,0.06)' } },
      { type: 'text', id: 'title', silent: true, left: left, top: box.y + 0.06 * box.H - 12.7 * k,
        style: { text: 'Bilanca očekivanja uz 1 p. b. veći udio objava', fill: INK, font: '400 ' + (15 * k) + 'px ' + FONT } },
      { type: 'text', id: 'sub', silent: true, left: left, top: box.y + 0.135 * box.H - 9.5 * k,
        style: { text: st.step ? 'Crno linearno, plavo stepenasto mapiranje. Puna točka: p < 0,05 nakon Bonferronijeve korekcije'
          : 'Crna točka: p < 0,05 nakon Bonferronijeve korekcije', fill: INK2, font: '400 ' + (11 * k) + 'px ' + FONT } }
    ];
    opt._geo = { top: top, h: h, u: u, k: k, shown: shown, dodge: dodge, horizons: horizons };
    return opt;
  }

  function Coef(img, cfg) {
    this.natW = 700; this.natH = 430; this.st = { step: false };
    this.caption = img.parentNode.querySelector('figcaption');
    this.captionText = this.caption ? this.caption.textContent : '';
    this.setup(img, cfg);
  }
  Coef.prototype = Object.create(Live.prototype);
  Coef.prototype.tools = function () {
    return { own: [{ glyph: { shape: 'dot', color: INK }, text: SPEC.lin.chip, title: SPEC.lin.name }],
      chips: [{ key: 'step', glyph: { shape: 'dot', color: BLUE }, text: SPEC.step.chip, title: SPEC.step.name }], index: false };
  };
  Coef.prototype.option = function (box, extra) { return coefOption(this.st, box, extra); };
  Coef.prototype.bind = function () {
    var self = this;
    this.chart.getZr().on('mousemove', function (ev) {
      var g = self.opt._geo, v = self.chart.convertFromPixel({ xAxisId: 'x', yAxisId: 'y' }, [ev.offsetX, ev.offsetY]), best = null;
      if (v && ev.offsetY > g.top - 20 * g.u && ev.offsetY < g.top + g.h + 40 * g.u) {
        g.horizons.forEach(function (hz, i) { if (Math.abs(hz - v[0]) <= 0.75 && (best == null || Math.abs(hz - v[0]) < Math.abs(g.horizons[best] - v[0]))) best = i; });
      }
      if (best == null) self.hideTip(); else self.showTip(best);
    });
  };
  Coef.prototype.sync = function () {
    this.chips.step.setAttribute('aria-pressed', this.st.step ? 'true' : 'false');
    this.resetBtn.hidden = !this.st.step;
    if (this.caption) this.caption.textContent = this.st.step ? this.captionText.replace('linearno mapiranje', 'linearno i stepenasto mapiranje') : this.captionText;
    this.host.setAttribute('aria-label', (this.img.getAttribute('alt') || '') + (this.st.step ? ' Dodano je stepenasto mapiranje.' : ''));
  };
  Coef.prototype.toggle = function (k) { if (k !== 'step') return; this.st.step = !this.st.step; this.render(); };
  Coef.prototype.reset = function () { this.st.step = false; this.render(); };
  Coef.prototype.hideTip = function () {
    this.tip.hidden = true;
    if (this.chart && this.hover != null) {
      this.hover = null;
      this.chart.setOption({ graphic: [{ id: 'band', invisible: true }] });
      this.chart.dispatchAction({ type: 'downplay' });
    }
  };
  Coef.prototype.showTip = function (i) {
    if (this.hover === i) return;
    var g = this.opt._geo, tip = this.tip, self = this, hz = g.horizons[i];
    this.hover = i;
    var x0 = this.chart.convertToPixel({ xAxisId: 'x' }, hz - 0.42), x1 = this.chart.convertToPixel({ xAxisId: 'x' }, hz + 0.42);
    this.chart.setOption({ graphic: [{ id: 'band', invisible: false, shape: { x: x0, y: g.top, width: x1 - x0, height: g.h } }] });
    this.chart.dispatchAction({ type: 'downplay' });
    g.shown.forEach(function (key) { self.chart.dispatchAction({ type: 'highlight', seriesId: 'pt-' + key, dataIndex: i }); });
    tip.textContent = '';
    tip.appendChild(el('div', 'lc-tip-month', hz === 0 ? 'Isti tjedan' : 'Horizont ' + weeks(hz)));
    g.shown.forEach(function (key) {
      var sp = SPEC[key], r = sp.rows[i], row = el('div', 'lc-tip-row');
      row.appendChild(glyph({ shape: 'dot', color: sp.color, hollow: !r.sig }));
      row.appendChild(el('span', 'lc-tip-name', sp.name));
      var val = el('span', 'lc-tip-val');
      val.appendChild(el('b', null, num(r.b, 2)));
      val.appendChild(el('i', null, '[' + num(r.lo, 2) + '; ' + num(r.hi, 2) + ']'));
      row.appendChild(val); tip.appendChild(row);
      tip.appendChild(el('div', 'lc-tip-sub', 'p ' + num(r.p, 4) + ' · Bonferroni ' + num(r.pb, 4) + ' · N ' + r.n));
    });
    tip.hidden = false;
    /* Okvir stoji ispod osi, preko naziva osi i bilješke, tako da nijedna procjena nije prekrivena. */
    var w = tip.offsetWidth, x = (x0 + x1) / 2 - w / 2;
    this.placeTip(Math.max(0, Math.min(x, this.W - w)), g.top + g.h + 30 * g.k);
  };
  Coef.prototype.fileName = function (ext) { return 'ekonomski-susreti-ocekivanja' + (this.st.step ? '-linearno-stepenasto' : '-linearno') + '.' + ext; };
  Coef.prototype.exportSpec = function () {
    var opt = coefOption(this.st, { x: 44, y: 104, W: 860, H: 528 }, { still: true });
    exportTitles(opt, this.section, 'Intervali β ± 1,96 SE, tjedni podaci 2021. do 2023.', 'Tablica 7a. Prediktivna veza, bez identificiranog uzročnog učinka.');
    return { opt: opt, W: 960, H: 740 };
  };
  Coef.prototype.csv = function () {
    var out = ['spec,horizon_weeks,beta_per_pp,ci_low,ci_high,p,p_bonferroni,n'];
    this.opt._geo.shown.forEach(function (key) {
      SPEC[key].rows.forEach(function (r) { out.push([key, r.h, +r.b.toFixed(6), +r.lo.toFixed(6), +r.hi.toFixed(6), r.p, r.pb, r.n].join(',')); });
    });
    return out.join('\n') + '\n';
  };

  /* ------------------------------------------------------------------ */
  /* Pokretanje i tipke                                                  */
  /* ------------------------------------------------------------------ */
  /* U prezentaciji tipke vrijede za grafikon na trenutačnom slajdu, a izvan nje
     za onaj nad kojim je pokazivač bio posljednji. */
  var lastTouched = null;
  function current() {
    var R = window.Reveal, slide = R && R.getCurrentSlide && R.getCurrentSlide();
    if (!slide && lastTouched && lastTouched.chart) return lastTouched;
    for (var i = 0; i < charts.length; i++) if (charts[i].chart && (!slide || charts[i].section === slide)) return charts[i];
    return null;
  }
  function initVisible() { charts.slice().forEach(function (c) { c.tryInit(); }); }

  function boot() {
    Array.prototype.forEach.call(document.querySelectorAll('figure > img'), function (img) {
      /* The explicit key survives standalone HTML exports that embed image data. */
      var m = /([^\/]+)\.svg$/.exec(img.getAttribute('src') || '');
      var key = img.getAttribute('data-live-chart') || (m && m[1]), cfg = key && FIGURES[key];
      if (!cfg) return;
      if (cfg.kind === 'monthly' && N) new Monthly(img, cfg);
      else if (cfg.kind === 'annual' && ANNUAL && ANNUAL.annual) new Annual(img, cfg);
      else if (cfg.kind === 'coef' && SPEC.lin.rows && SPEC.lin.rows.length) new Coef(img, cfg);
    });
    if (!charts.length) return;
    var go = function () { initVisible(); };
    (document.fonts && document.fonts.ready ? document.fonts.ready : Promise.resolve()).then(function () {
      go();
      var R = window.Reveal, keys = [];
      [1, 2, 3, 4, 5].forEach(function (n) {
        keys.push([48 + n, String(n), 'Grafikon, dodaj ili ukloni seriju ' + n, function (c) { var k = c.chipKeys[n - 1]; if (k) c.toggle(k); }]);
      });
      keys.push([73, 'I', 'Grafikon, indeks', function (c) { c.toggleIndex(); }]);
      keys.push([48, '0', 'Grafikon, izvorni prikaz', function (c) { c.reset(); }]);
      if (R && R.on) { R.on('ready', go); R.on('slidechanged', go); R.on('slidetransitionend', go); }
      if (R && R.addKeyBinding) {
        keys.forEach(function (k) {
          R.addKeyBinding({ keyCode: k[0], key: k[1], description: k[2] }, function () { var c = current(); if (c) k[3](c); });
        });
      } else {
        /* Izvan prezentacije iste tipke sluša sama stranica. */
        document.addEventListener('keydown', function (ev) {
          if (ev.ctrlKey || ev.metaKey || ev.altKey || /^(INPUT|TEXTAREA|SELECT)$/.test(ev.target.tagName || '')) return;
          var c = current();
          keys.forEach(function (k) { if (c && ev.keyCode === k[0]) k[3](c); });
        });
      }
      setTimeout(go, 600);
    });
  }

  window.ESLiveCharts = { charts: charts, series: S };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot); else boot();
})();
