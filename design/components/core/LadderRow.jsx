import React from 'react';
export function LadderRow({ number, children, tag }) {
  return (
    <div style={{ display: 'grid', gridTemplateColumns: '96px 1fr auto', gap: 24, alignItems: 'baseline', padding: '20px 0', borderBottom: '1px solid var(--color-hairline-soft)', fontFamily: 'var(--font-sans)', color: 'var(--color-ink)' }}>
      <p style={{ margin: 0, fontSize: 48, fontWeight: 100, lineHeight: 1 }}>{number}</p>
      <p style={{ margin: 0, fontSize: 16, lineHeight: 1.6 }}>{children}</p>
      <p style={{ margin: 0, fontSize: 11, fontWeight: 700, letterSpacing: 'var(--tracking-label-tight)', textTransform: 'uppercase', whiteSpace: 'nowrap' }}>{tag || ''}</p>
    </div>
  );
}
