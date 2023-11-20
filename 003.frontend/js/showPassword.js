function showPassword(){
   let passInput =  document.getElementById('pass');
      if (passInput.type === 'password'){

       passInput.type = 'text';

    } else {
       passInput.type = 'password'
   }
}