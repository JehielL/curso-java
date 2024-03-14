import { Menu } from "./menu.model";
import { Restaurant } from "./restaurant.model";

export interface Booking {

    id: number;
    title: string;
    status: boolean;
    numTable: number;
    createDate: Date;
    menu: Menu,
    restaurant: Restaurant
}