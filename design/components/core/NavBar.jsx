import React from 'react';
export function NavBar({ brand = 'Ekonomski susreti 2026', brandHref = '#', links = [] }) {
  return (
    <div style={{ borderBottom: '1px solid var(--color-ink)', fontFamily: 'var(--font-sans)', background: 'var(--color-paper)' }}>
      <div style={{ maxWidth: 'var(--page-max)', margin: '0 auto', padding: '20px var(--page-pad)', display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', gap: 24, flexWrap: 'wrap' }}>
        <a href={brandHref} style={{ fontSize: 'var(--size-label)', fontWeight: 700, letterSpacing: 'var(--tracking-label)', textTransform: 'uppercase', textDecoration: 'none', color: 'var(--color-ink)' }}>{brand}</a>
        <div style={{ display: 'flex', gap: 32, fontSize: 'var(--size-label)', fontWeight: 700, letterSpacing: '0.16em', textTransform: 'uppercase' }}>
          {links.map(l => (
            <a key={l.label} href={l.href} style={{ color: 'var(--color-ink)', textDecoration: l.current ? 'underline' : 'none', textUnderlineOffset: 4, textDecorationThickness: 1 }}>{l.label}</a>
          ))}
        </div>
      </div>
    </div>
  );
}
