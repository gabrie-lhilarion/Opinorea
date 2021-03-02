 window.onload = () => {
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
                        Object.assign(document.getElementById('reply_content').style, {'display': 'block', 'width': '100%', 'border': 'solid 1px #ccc', 'margin-bottom': '12px'  });
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
                        user_id_input.insertAdjacentHTML('afterend', '<div id=\"action-notification\"></div>')
                        }
                  );
            }); // end of link for each
            my_form.addEventListener("ajax:success", (event) => {
                  let notification_div = document.getElementById('action-notification')
                  const [_data, _status, xhr] = event.detail;
                  let opinionId = document.getElementById('opinion_id').value
                  element_to_update = document.getElementById(`opinion_${opinionId}_reply_count`)
                  inintial_replies = parseInt(element_to_update.textContent)
                  element_to_update.textContent = inintial_replies + 1
                  const fade_out_bg = (x, y) => { 

                  }
            });
           
            my_form.addEventListener("ajax:error", (event) => {
                  let notification_div = document.getElementById('action-notification')
                  const error_messages = []
                  const reply_content = document.getElementById('reply_content').value.replace(/ /g, '') 
                  reply_content.length < 1 ? error_messages.push('Reply is too shot or empty') : null
                  reply_content.length > 50 ? error_messages.push('Reply is longer tha 50 character') : null 

                  document.getElementById('reply_content').value = ' '
                  if( error_messages.length > 0 ){ error_messages.forEach(  (x) => { 
                        const each_error = document.createElement('p')
                        each_error.textContent = `1. ${x}`
                        Object.assign(each_error.style, {'color': 'red', 'text-align': 'right'})
                        notification_div.appendChild(each_error);
                        setTimeout(() => {
                              notification_div.querySelectorAll('p').forEach( (x) => { x.remove()} )  
                        }, 3000);
                     }) 
                  }
            });
      
 };