import React from 'react';
export function SectionLabel({ children, soft = false }) {
  return (
    <p style={{ margin: 0, borderTop: '1px solid ' + (soft ? 'var(--color-hairline-soft)' : 'var(--color-ink)'), paddingTop: 14, fontSize: 'var(--size-label)', fontWeight: 700, letterSpacing: 'var(--tracking-label)', textTransform: 'uppercase', fontFamily: 'var(--font-sans)', color: 'var(--color-ink)' }}>{children}</p>
  );
}
