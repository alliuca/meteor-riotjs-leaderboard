Template.register.events({
  'submit form': function(event) {
    event.preventDefault();
    var email = event.target.registerEmail.value;
    var password = event.target.registerPassword.value;
    Accounts.createUser({
      email: email,
      password: password
    }, function(error){
      var validation = new AccountsValidation;
      AccountsValidation.validate(event, error);
    });
  }
});