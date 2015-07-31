<score-controls>
  <div if={ isPlayerSelected() }>
    <br><br>
    <button class="btn btn-primary mb1 bg-green increment" onclick={ increment }>Give {opts.selected_item} 5 Points</button>
    <button class="btn btn-primary mb1 bg-red decrement" onclick={ decrement }>Take 5 Points from {opts.selected_item}</button>
  </div>

  <script>
    isPlayerSelected() {
      var selectedPlayer = Session.get('selectedPlayerId');
      if (selectedPlayer)
        return true;
      return false;
    }

    increment() {
      var selectedPlayer = Session.get('selectedPlayerId');
      Meteor.call('modifyPlayerScore', selectedPlayer, 5);
    }

    decrement() {
      var selectedPlayer = Session.get('selectedPlayerId');
      Meteor.call('modifyPlayerScore', selectedPlayer, -5);
    }
  </script>
</score-controls>