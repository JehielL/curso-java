import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { Menu } from '../model/menu.model';

@Component({
  selector: 'app-menu-form',
  standalone: true,
  imports: [HttpClientModule, RouterLink, ReactiveFormsModule],
  templateUrl: './menu-form.component.html',
  styleUrl: './menu-form.component.css'
})
export class MenuFormComponent implements OnInit {

  menuForm = new FormGroup({
    title: new FormControl('')
  });
  photoFile: File | undefined;
  photoPreview: string | undefined;
  menu: Menu | undefined;

  constructor(private httpClient: HttpClient) {}

  ngOnInit(): void {

  }
  onFileChange(event: Event) {
    let target = event.target as HTMLInputElement; // este target es el input de tipo file donde se carga el archivo

    if(target.files === null || target.files.length == 0){
      return; // no se procesa ningún archivo
    }

    this.photoFile = target.files[0]; // guardar el archivo para enviarlo luego en el save()

    // OPCIONAL: PREVISUALIZAR LA IMAGEN POR PANTALLA
    let reader = new FileReader();
    reader.onload = event => this.photoPreview = reader.result as string;
    reader.readAsDataURL(this.photoFile);
  }

  save() {

    // Crear FormData
    let formData = new FormData();
    // introducir el photoFile
    if(this.photoFile){
      formData.append("photo", this.photoFile);
    }

    // Introducir los datos del menu
      formData.append('title', this.menuForm.get('title')?.value ?? '')

    // http client post para enviar el formData a backend
    console.log(formData);

    this.httpClient.post<Menu>('http://localhost:8080/menus', formData)
    .subscribe(menu => {
      this.photoFile = undefined;
      this.photoPreview = undefined;
      console.log(menu);
      this.menu = menu;

    });
  }

}