/**
 * @experimental
 */
export interface GreeterProps {
    /**
     * @experimental
     */
    readonly greetee: string;
}
/**
 * @experimental
 */
export declare class Greeter {
    private readonly greetee;
    /**
     * @experimental
     */
    constructor(props: GreeterProps);
    /**
     * @experimental
     */
    greet(): string;
}
