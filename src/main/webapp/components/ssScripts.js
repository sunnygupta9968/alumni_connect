/**
 * 
 */


const currentTheme = localStorage.getItem('theme');




const body=document.querySelector("body"),
    sidebar=body.querySelector(".sidebar"),
    toggle=body.querySelector(".toggle"),
    searchBtn=body.querySelector(".nav-searchbar"),
    modeSwitch=body.querySelector(".toggle-switch"),
    modeText=body.querySelector(".mode-text"),
    home=body.querySelector(".home")

    toggle.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
        if(!sidebar.classList.contains("close")){
            home.addEventListener("click", ()=>{
                sidebar.classList.add("close");
            })
        }

    })
	
	
	if (currentTheme === 'dark') {
	    body.classList.add('dark');
	}
    modeSwitch.addEventListener("click", ()=>{
        body.classList.toggle("dark");
        if(body.classList.contains("dark")){
            modeText.innerText="Light Mode"
        }else{
            modeText.innerText="Dark Mode"
        }
		
		if (body.classList.contains('dark')) {
		        localStorage.setItem('theme', 'dark');
		    } else {
		        localStorage.setItem('theme', 'light');
		    }
        
    });
  
	
	


	let slider = document.querySelector('.slider .list');
	let items = document.querySelectorAll('.slider .list .item');
	let next = document.getElementById('next');
	let prev = document.getElementById('prev');
	let dots = document.querySelectorAll('.slider .dots li');

	let lengthItems = items.length - 1;
	let active = 0;
	next.onclick = function(){
	active = active + 1 <= lengthItems ? active + 1 : 0;
	reloadSlider();
	}
	prev.onclick = function(){
	active = active - 1 >= 0 ? active - 1 : lengthItems;
	reloadSlider();
	}
	let refreshInterval = setInterval(()=> {next.click()}, 5000);
	function reloadSlider(){
	slider.style.left = -items[active].offsetLeft + 'px';
	// 
	let last_active_dot = document.querySelector('.slider .dots li.active');
	last_active_dot.classList.remove('active');
	dots[active].classList.add('active');

	clearInterval(refreshInterval);
	
	
	refreshInterval = setInterval(()=> {next.click()}, 5000);


	}

	dots.forEach((li, key) => {
	li.addEventListener('click', ()=>{
	active = key;
	reloadSlider();
	})
	})
	window.onresize = function(event) {
	reloadSlider();
	};

/*Profile Pic Change Script*/

	
	


