<add-player>
  <form class="add-player" onsubmit={ addPlayer }>
    <fieldset>
      <legend>Add a new player</legend>
      <input type="text" name="playerName" placeholder="Name" class="field">
      <button type="submit" class="btn btn-primary">Add Player</button>
      <button class="btn btn-primary remove" onclick={ removePlayer }>Remove Player</button>
    </fieldset>
  </form>

  <script>
    addPlayer(e) {
      e.preventDefault();
      var playerNameVar = e.target.playerName.value;
      Meteor.call('insertPlayerData', playerNameVar);
    }

    removePlayer(e) {
      e.preventDefault();
      var selectedPlayer = Session.get('selectedPlayerId');
      Session.set({
        'selectedPlayerId': '',
        'selectedPlayerName': ''
      });
      Meteor.call('removePlayerData', selectedPlayer);
    }
  </script>
</add-player>