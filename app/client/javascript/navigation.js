Template.navigation.helpers({
  'username': function(){
    return Meteor.user().emails[0].address;
  }
});

Template.navigation.events({
  'click .logout': function(event) {
    event.preventDefault();
    Meteor.logout();
  }
});