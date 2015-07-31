<leaderboard>
  <div if={ isUserLoggedIn() }>
    <table class="table-light border rounded">
      <tbody>
          <tr each={ items } class="player { bg-blue: parent.isSelectedPlayer(_id) }" onclick={ parent.onSelectPlayer }>
            <td>{name}</td>
            <td class="leaderboard-table-score">{score}</td>
          </tr>
      </tbody>
    </table>

    <score-controls selected_item={ selected }></score-controls>

    <br><br>
    <add-player></add-player>
  </div>
  <div if={ !isUserLoggedIn() }>
    <p>Welcome to the Leaderboard app, please sign in to play.</p>
  </div>

  <script>
    Meteor.subscribe('thePlayers');
  
    this.players = opts.players;
    this.selected = Session.get('selectedPlayerName');

    observe = RiotMeteor.Observe.bind(this);
    observe (this.players, 'items');

    isSelectedPlayer(id) {
      var playerId = id;
      var selectedPlayer = Session.get('selectedPlayerId');
      return playerId == selectedPlayer;
    }

    isUserLoggedIn() {
      return Meteor.userId() != null;
    }

    onSelectPlayer(e) {
      var playerId = e.item._id;
      var playerName = e.item.name;
      Session.set({
        'selectedPlayerId': playerId,
        'selectedPlayerName': playerName
      });
      this.selected = Session.get('selectedPlayerName');
    }
  </script>
</leaderboard>