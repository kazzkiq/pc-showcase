<comp-cards>
  <div class="CardsComp" ref="comp">
    <comp-search ref="search"></comp-search>
    <div class="container">
      <div class="cards-list">
        <div class="card" each="{ displayCards }">
          <div class="image">
            <img if="{ imageUrl }" src="{ imageUrl }" alt="{ name }">
          </div>
          <div class="title">{ name }</div>
          <div class="description">{ description }</div>
          <hr>
          <div class="action-buttons">
            <div class="btn">
              Visit Project
            </div>
            <div class="btn outline" onclick="{ actionDetails }">
              See Details
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.cards = [];
    this.displayCards = [];
    this.isFilterActive = true;

    this.on('mount', () => {
      this.fetchCardsData();
      window.onscroll = this.onscroll
    });

    createCardObj () {
      return {
        name: null,
        description: null,
        descriptionFull: null,
        imageUrl: null,
        link: null,
        tags: []
      }
    }

    /*
     * Infinite Scroll function
     * 
     * If you change anything bellow, remember to chance CSS to
     * reflect same height and items per line.
     */
     onscroll(e) {
       console.log(this.isFilterActive);
      if(!this.isFilterActive) {
        return;
      }

      this.cardsCompTop = this.refs.comp.getBoundingClientRect().top;
      var itemheight  = 300 - (300 / 5);  // Height of item (keep 20% smaller for scroll to happen)
      var chunksize   = 4;    // Number of rows to render (each row defaults to 4 items)
      var itemsPerRow = 4;    // Number of items per chunk row
      var chunk       = Math.floor(window.scrollY / (chunksize * itemheight * 0.95));

      // Hit end of the current chunk, then load more items
      if(chunk > (this.lastchunk || 0)) {
        this.displayCards  = this.cards.slice(0, (chunksize * itemsPerRow) * (chunk + 1))
        this.lastchunk  = chunk
        this.update();
      } else {
        e.preventUpdate = true
      }
    }


    /*
     * Modify your JSON AJAX URL and object here
     */
    fetchCardsData () {
      const API_PATH = '/sample.json';
      ajax().get(API_PATH).then((res, xhr) => {
        
        res.forEach((current) => {
          let card = this.createCardObj();

          // This is where you bind your objects fetched from JSON
          card.name = current.name;
          card.description = current.description;
          card.descriptionFull = current.descriptionFull;
          card.imageUrl = current.imageUrl;
          card.link = current.link;
          card.tags = current.tags || [];

          this.cards.push(card);
        });

        this.displayCards = this.cards.slice(0, 16);

        this.update();
      });
    }

    /*
     * Modify your details action here
     */
    actionDetails (e) {
      const item = e.item;
      
      let comp = document.createElement('COMP-SIDEBAR');
      document.body.append(comp);
      riot.mount(comp, item);
    }
  </script>
</comp-cards>