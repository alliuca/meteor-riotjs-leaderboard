Template.leaderboard.helpers({
  'player': function(){
    var currentUserId = Meteor.userId();
    return Players.find({}, {sort: {score: -1, name: 1}})
  },
  'selectedClass': function(){
    var playerId = this._id;
    var selectedPlayer = Session.get('selectedPlayer');
    if (playerId == selectedPlayer)
      return 'bg-blue'
  },
  'showSelectedPlayer': function(){
    var selectedPlayer = Session.get('selectedPlayer');
    return Players.findOne(selectedPlayer)
  }
});

Template.leaderboard.events({
  'click .player': function(){
    var playerId = this._id;
    Session.set('selectedPlayer', playerId);
  },
  'click .increment': function(){
    var selectedPlayer = Session.get('selectedPlayer');
    Meteor.call('modifyPlayerScore', selectedPlayer, 5);
  },
  'click .decrement': function(){
    var selectedPlayer = Session.get('selectedPlayer');
    Meteor.call('modifyPlayerScore', selectedPlayer, -5);
  },
  'click .remove': function(e){
    e.preventDefault();
    var selectedPlayer = Session.get('selectedPlayer');
    Meteor.call('removePlayerData', selectedPlayer);
  }
});

Template.addPlayerForm.events({
  'submit form': function(e){
    e.preventDefault();
    var playerNameVar = e.target.playerName.value;
    Meteor.call('insertPlayerData', playerNameVar);
  }
});

Meteor.subscribe('thePlayers');