import { Menu } from "./menu.model";

export interface Restaurant{

    id: number,
    title: string,
    img: string,    
    isOpen: boolean,
    openingTime: Date,
    menu: Menu


}