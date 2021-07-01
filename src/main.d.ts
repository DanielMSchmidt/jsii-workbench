export interface GreeterProps {
    readonly greetee: string;
}
export declare class Greeter {
    private readonly greetee;
    constructor(props: GreeterProps);
    greet(): string;
}
