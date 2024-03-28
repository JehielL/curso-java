import { FoodType } from "./food-type.enum";

export interface Menu {

    id: number;
    title: string;
    description: string;
    imgMenu: string;
    active: boolean; 
    alergys: boolean;
    typeOfFood: FoodType;
   
}