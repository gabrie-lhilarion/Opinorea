(() => {

      const display_notice = () => {
      if(document.getElementById('my_notice'))
            {
                  const notice = document.getElementById('my_notice');
                  const left_margin = screen.width * 0.1 + 'px';
                  notice.style.marginLeft = left_margin; 
            }
      }

      if(document.getElementById('my_notice')) {
            setTimeout(() => {
                  document.getElementById('my_notice').remove()
            }, 5000);
      }

      display_notice();
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
            window.addEventListener('resize', display_notice);
      }
      
      const reply_link = document.querySelectorAll('.reply_now');
      const close = document.querySelectorAll('.close, .close_2');

      close.forEach( function (x) {
            x.addEventListener('click', function () { document.getElementById('myModal').style.display = 'none' } );
      })
      
      const my_form = document.getElementById('ajx_form');
      reply_link.forEach( function (x) {
            x.addEventListener('click',  function () {
                  if(document.getElementById('user_id')) { document.getElementById('user_id').remove() }
                  if(document.getElementById('opinion_id')) { document.getElementById('opinion_id').remove() }
                  const user_id = x.id.split(',')[1]
                  // I am using comment id as a point of reference
                  const opinion_id = x.id.split(',')[0] 
                  const fullname = document.getElementById(`opinion_${opinion_id}_fullname`).textContent
                  const comment = document.getElementById(`opinion_${opinion_id}_comment`).textContent
                  document.getElementById('modal-title').textContent = `Reply to ${fullname}`
                  document.getElementById('myModal').style.display = 'block' 
                  const cloned_view = `<div class=\"cloned\">
                                          <div id=\"person-image\"> image </div> 
                                          <div> ${comment} </div> 
                                     </div>`
                  document.getElementById('clone_wrap').innerHTML = cloned_view
                  Object.assign(document.getElementById('reply_content').style, {'display': 'block', 'width': '100%', 'border': 'solid 1px #ccc' });
                  Object.assign(document.querySelector('.cloned').style, {'display': 'flex' });
                  Object.assign(document.getElementById('person-image').style, {'width': '45px', 'height': '45px', 'background-color':'#ccc', 'margin-right': '20px' });                   
                  
                  const opinion_id_input = document.createElement('input');
                  opinion_id_input.setAttribute('type', 'hidden');
                  opinion_id_input.value = opinion_id;
                  opinion_id_input.id = 'opinion_id';
                  opinion_id_input.setAttribute('name', 'opinion');
                  my_form.appendChild(opinion_id_input);

                  const user_id_input = document.createElement('input');
                  user_id_input.setAttribute('type', 'hidden');
                  user_id_input.value = user_id;
                  user_id_input.id = 'user_id';
                  user_id_input.setAttribute('name', 'user');
                  my_form.appendChild(user_id_input);
                  }
            );
      }); // link for each
     const send_reply_btn = document.getElementById('send-reply');
     send_reply_btn.addEventListener('click', function (){ my_form.submit()});
//      let my_form_data = {};
//      send_reply_btn.addEventListener('click', function (){
//             my_form.querySelectorAll('input').forEach( function (x){
//                         let y = x.name; 
//                         my_form_data[y] = x.value 
//                         alert(y)
//                   } );
//             alert(JSON.stringify(my_form_data)); 
//       });
 })();