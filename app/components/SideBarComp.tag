<comp-sidebar>
  <div class="SideBarComp">
    <div class="overlay {on: opened}" onclick="{ close }" ref="overlay"></div>
    <div class="sidebar {on: opened}">
      <h1 class="title">{ opts.name }</h1>
      <div class="description">{ opts.descriptionFull || opts.description }</div>
      <hr>
      <virtual if="{ opts.tags.length > 0 }">
      <div class="description">{ opts.tags.join(', ') }</div>
      <hr>
      </virtual>
      <a if="{ opts.link }" href="{ opts.link }" class="btn">Visit Project</a>
    </div>
 </div>

 <script>
   this.on('mount', () => {
    setTimeout(() => {
      this.open();
    }, 100);
   });

   open () {
     document.body.classList.add('no-scroll');
     document.querySelector('main').classList.add('off');
     this.opened = true;
     this.update();
   }

   close () {
     this.refs.overlay.addEventListener('transitionend', () => {
      this.unmount();
     });
     document.querySelector('main').classList.remove('off');
     this.opened = false;
     this.update();
     document.body.classList.remove('no-scroll');
   }
 </script>
</comp-sidebar>