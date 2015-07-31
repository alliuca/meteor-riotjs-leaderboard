Template.body.rendered = function () {
  riot.mount('navigation');
  riot.mount('leaderboard', {
    players: Players.find({}, {sort: {score: -1, name: 1}})
  });
};