function toggleImage(){
    let showImage =  document.getElementById('retrete');
       if (showImage.style.display === 'none'){ 
        showImage.style.display = 'block';
    
    } else {
        showImage.style.display = 'none';
    }
 }


 function toggleTheme() {
    const body = document.body;
    const currentTheme = body.getAttribute('data-bs-theme');
    const logo = document.getElementById('toggleTheme'); 
    if (currentTheme === 'dark') {
        body.setAttribute('data-bs-theme', 'light');
        logo.classList.remove('fa-regular', 'fa-sun', 'ms-2', 'rounded-5');
        logo.classList.add('fa-solid', 'fa-moon', 'ms-2', 'rounded-5');
    } else {
        body.setAttribute('data-bs-theme', 'dark');
        logo.classList.remove('fa-solid', 'fa-moon', 'ms-2', 'rounded-5');
        logo.classList.add('fa-regular', 'fa-sun', 'ms-2', 'rounded-5');
    }
}
