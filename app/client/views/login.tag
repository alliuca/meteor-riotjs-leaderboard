<login>
  <form class="sm-col-12 accounts accounts--login" onsubmit={ doLogin }>
    <label for="loginEmail" class="black">Username</label>
    <input type="email" id="loginEmail" name="loginEmail" placeholder="username@example.com" class="block col-12 mb1 field">
    <label for="loginPassword" class="black">Password</label>
    <input type="password" id="loginPassword" name="loginPassword" class="block col-12 mb1 field">
    <button class="btn btn-primary">Login</button>
    <p class="error-message"></p>
  </form>

  <script>
    doLogin(e) {
      e.preventDefault();
      var email = e.target.loginEmail.value;
      var password = e.target.loginPassword.value;
      var _this = this;
      Meteor.loginWithPassword(email, password, function(success){
        riot.update();
      }, function(error){
        var validation = new AccountsValidation;
        AccountsValidation.validate(e, error);
      });
    }
  </script>
</login>