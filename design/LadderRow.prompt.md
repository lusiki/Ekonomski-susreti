/** Redak numeriranog popisa, veliki lagani broj lijevo, meka linija ispod. */
export interface LadderRowProps {
  number: string;
  children: React.ReactNode;
  /** Kratka verzalna oznaka uz desni rub. */
  tag?: string;
}
export declare function LadderRow(props: LadderRowProps): JSX.Element;
