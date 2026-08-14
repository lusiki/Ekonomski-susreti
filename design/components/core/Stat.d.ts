/** Veliki broj težine 100 s kratkim opisom ispod. */
export interface StatProps {
  /** Hrvatski zapis broja, decimalni zarez i točka za tisućice. */
  value: string;
  caption?: string;
  size?: 'lg' | 'md' | 'sm';
}
export declare function Stat(props: StatProps): JSX.Element;
