import { Booking } from "./booking.model";

export interface Cart{

    id: number;
    userId: number;
    date: string;
    products: Booking[];
}