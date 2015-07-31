<navigation>
  <nav class="clearfix mb2 white bg-black main-nav">
    <div class="right">
      <div if={ isUserLoggedIn() }>
        <a href="#!" class="btn py2 m0">{ getUsername() }</a>
        <a href="#!" class="btn py2 m0 logout" onclick={ onClickLogout }>Logout</a>
      </div>
      <div if={ !isUserLoggedIn() }>
        <div class="main-nav__item">
          <input type="checkbox" id="signIn">
          <label for="signIn" class="btn py2 m0">Sign In</label>
          <div class="modal modal--sign-in sm-col-2 border bg-lighter-gray">
            <login></login>
          </div>
        </div>
        <div class="main-nav__item">
          <input type="checkbox" id="register">
          <label for="register" class="btn py2 m0">Register</label>
          <div class="modal modal--sign-in sm-col-2 border bg-lighter-gray">
            <register></register>
          </div>
        </div>
      </div>
    </div>
    <div class="clearfix sm-hide"></div>
  </nav>

  <script>
    var _this = this;

    Accounts.onLogin(function(){
      Session.set('loggedInUser', Meteor.user().emails[0].address);
      Session.set({
        'selectedPlayerId': '',
        'selectedPlayerName': ''
      });
      _this.update();
    })

    getUsername() {
      return Session.get('loggedInUser');
    }

    isUserLoggedIn() {
      return Meteor.userId() != null;
    }

    onClickLogout(e) {
      e.preventDefault();
      Meteor.logout(function(success){
        riot.update();
      });
    }
  </script>
</navigation>