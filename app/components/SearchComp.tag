<comp-search>
  <div class="SearchComp">
    <input type="text" placeholder="Search..." oninput="{ filter }">
  </div>

  <script>
    this.cards = this.parent.cards;
    
    filter (e) {
      let input = e.target
      let value = input.value;
      let filteredCards;

      if(value.length < 1) {
        this.parent.lastchunk = 0;
        this.parent.displayCards = this.parent.cards.slice(0, 16);
        this.parent.isFilterActive = true;
        this.parent.update();
        return;
      }
      
      console.log(this.cards, 1);

      filteredCards = this.cards.filter((card) => {
        card.tags = card.tags || []

        if ((card.name + card.tags.join('')).toLowerCase().indexOf(value.toLowerCase()) > -1) {
          return true;
        } else {
          return false;
        }
      });
      
      this.parent.isFilterActive = false;
      this.parent.displayCards = filteredCards;
      this.parent.update();
      
    }
  </script>
</comp-search>