import React from 'react';
export function PageFooter({ columns = [] }) {
  return (
    <footer style={{ borderTop: '1px solid var(--color-ink)', fontFamily: 'var(--font-sans)', background: 'var(--color-paper)', color: 'var(--color-ink)' }}>
      <div style={{ maxWidth: 'var(--page-max)', margin: '0 auto', padding: '48px var(--page-pad) 64px', display: 'grid', gridTemplateColumns: 'repeat(auto-fit,minmax(260px,1fr))', gap: 48, fontSize: 'var(--size-meta)', lineHeight: 1.7 }}>
        {columns.map(c => (
          <div key={c.label}>
            <p style={{ margin: 0, fontWeight: 700, letterSpacing: 'var(--tracking-label-tight)', textTransform: 'uppercase', fontSize: 11 }}>{c.label}</p>
            <div style={{ marginTop: 12 }}>{c.body}</div>
          </div>
        ))}
      </div>
    </footer>
  );
}
