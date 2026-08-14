import React from 'react';
const SIZES = { lg: 'var(--size-stat)', md: '64px', sm: 'var(--size-stat-sm)' };
export function Stat({ value, caption, size = 'md' }) {
  return (
    <div style={{ fontFamily: 'var(--font-sans)', color: 'var(--color-ink)' }}>
      <p style={{ margin: 0, fontSize: SIZES[size] || SIZES.md, fontWeight: 100, lineHeight: 1, letterSpacing: '-0.02em' }}>{value}</p>
      {caption ? <p style={{ margin: '10px 0 0', fontSize: 'var(--size-caption)', lineHeight: 1.5, maxWidth: 260 }}>{caption}</p> : null}
    </div>
  );
}
