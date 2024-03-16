import { Menu } from "./menu.model";
import { Restaurant } from "./restaurant.model";

export interface Booking {

    id: number;
    title: string;
    status: boolean;
    numTable: number;
    createDate: Date;
    imgUrl: String;
    menu: Menu,
    restaurant: Restaurant
}