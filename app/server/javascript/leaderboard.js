Meteor.publish('thePlayers', function(){
  var currentUserId = this.userId;
  return Players.find({createdBy: currentUserId})
});

Meteor.methods({
  'insertPlayerData': function(playerNameVar){
    var currentUserId = Meteor.userId();
    var doesExist = Players.find({createdBy: currentUserId, name: playerNameVar}).fetch();
    if (!doesExist.length && playerNameVar != '')
      Players.insert({
        name: playerNameVar,
        score: 0,
        createdBy: currentUserId
      });
  },
  'removePlayerData': function(selectedPlayer){
    var currentUserId = Meteor.userId();
    Players.remove({_id: selectedPlayer, createdBy: currentUserId});
  },
  'modifyPlayerScore': function(selectedPlayer, scoreValue){
    var currentUserId = Meteor.userId();
    Players.update({_id: selectedPlayer, createdBy: currentUserId}, {$inc: {score: scoreValue}});
  }
});