/** Vršna traka s markom u verzalu i navigacijom, ispod nje jaka linija. */
export interface NavBarProps {
  brand?: string;
  brandHref?: string;
  links?: { label: string; href: string; current?: boolean }[];
}
export declare function NavBar(props: NavBarProps): JSX.Element;
