(() => {
    
      if(window.location != 'http://localhost:3000/users/sign_up' && window.location != 'http://localhost:3000/users/sign_in') {
            const action_button = document.querySelector('.action-icons'); 
            const mobile_icon_slide_in = document.getElementById('mobile-icon-slide-in');
      
            let toggleMenu = () => { 
              const menuStyle = {};
              screen.width > 600 ? menuStyle.width  = '350px' : menuStyle.width = screen.width 
              menuStyle.height = (screen.height - 160) + 'px'
              mobile_icon_slide_in.classList.toggle('show')
              mobile_icon_slide_in.className == 'show' ? menuStyle.display = 'block' : menuStyle.display = 'none'
              Object.assign(document.getElementById('mobile-icon-slide-in').style, menuStyle); 
            }
           
            let toggle_SlidIn_Menu = (x) => {
                  if(x.target.id == 'fa-menu') {
                      toggleMenu();
                  }
            }
      
            action_button.addEventListener( 'click', toggle_SlidIn_Menu );
      
            let hide_Slidein_Menu = () => {
              if( window.innerWidth >= 600 ){
                   document.getElementById('mobile-icon-slide-in').style.display = 'none' 
                   mobile_icon_slide_in.classList.toggle('show')
                  }
            }
      
            window.addEventListener('resize', hide_Slidein_Menu);
      }
      
      const reply_link = document.querySelectorAll('.reply_now');
      
      const showDetails = (y) => {
            if (document.getElementById('reply_form')) document.getElementById('reply_form').remove()
            const form_element = document.createElement('form')
            form_element.setAttribute('action', `/reply/${y.target.id}`)
            form_element.setAttribute('id', 'reply_form')

            const input = document.createElement('input')
            input.setAttribute('placeholder', ' ..type your reply')
            form_element.appendChild(input)

            const btn = document.createElement('button')
            btn.textContent = 'Submit reply'

            const div = document.createElement('div')
            const mystyles = {'display' : 'flex', 'justify-content' : 'flex-end'}
            Object.assign(div.style, mystyles)
            div.appendChild(btn)

            form_element.appendChild(div)
            y.target.parentElement.appendChild(form_element)
      }

      reply_link.forEach(
             (x) => x.addEventListener('click', showDetails)
      ); 

 })();