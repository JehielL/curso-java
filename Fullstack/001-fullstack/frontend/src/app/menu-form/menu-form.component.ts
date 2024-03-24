import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-menu-form',
  standalone: true,
  imports: [ReactiveFormsModule, HttpClientModule, RouterLink],
  templateUrl: './menu-form.component.html',
  styleUrl: './menu-form.component.css'
})  
export class MenuFormComponent implements OnInit{

  menuForm = new FormGroup({
    
    
    title: new FormControl<string>(''),
    category: new FormControl<string>(''),
    imgMenu: new FormControl<string>(''),
    active: new FormControl<boolean>(true)
    

  });

  constructor(private httpClient: HttpClient){}

  photoFile: File | undefined;
  photoPreview: String | undefined;
 

  onFileChange(event: Event) {
    
    

    let target = event.target as HTMLInputElement;
    console.log(target.files);

    if(target.files == null || target.files.length == 0) {

      return;

    }

    this.photoFile = target.files[0];

    //previsualizar imagen
    let reader = new FileReader();
      reader.onload = event => this.photoPreview = reader.result as string;
      reader.readAsDataURL(this.photoFile);

    }

    ngOnInit(): void {  
    
    }


   

    save(){

      
    }


    

}

