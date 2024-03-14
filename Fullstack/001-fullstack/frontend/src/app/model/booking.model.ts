import { Menu } from "./menu.model";

export interface Booking {

    id: number;
    title: string;
    numTable: number;
    menu: Menu
}