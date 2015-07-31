<register>
  <form class="sm-col-12 accounts accounts--register" onsubmit={ doRegister }>
    <label for="registerEmail" class="black">Username</label>
    <input type="email" name="registerEmail" placeholder="username@example.com" class="block col-12 mb1 field">
    <label for="registerPassword" class="black">Password</label>
    <input type="password" name="registerPassword" class="block col-12 mb1 field"><br>
    <button class="btn btn-primary">Register</button>
    <p class="error-message"></p>
  </form>

  <script>
    doRegister(e) {
      e.preventDefault();
      var email = e.target.registerEmail.value;
      var password = e.target.registerPassword.value;
      Accounts.createUser({
        email: email,
        password: password
      }, function(success){
        riot.update();
      }, function(error){
        var validation = new AccountsValidation;
        AccountsValidation.validate(e, error);
      });
    }
  </script>
</register>