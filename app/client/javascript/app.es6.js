AccountsValidation = class AccountsValidation {
  static validate(eventObject, error) {
    var formClass = eventObject.target.className;
    formClass = '.' + formClass.replace(/ /g,'.');
    var errMsg = document.querySelectorAll(formClass + ' .error-message')[0];
    [].forEach.call(document.querySelectorAll(formClass + ' .field'), f => {
      f.className = f.className.replace(/ is-error/, '');
    });
    if (error.error == 403) { // email already exists
      if (error.reason == 'User not found' || error.reason == 'Email already exists.')
        document.querySelectorAll(formClass + ' [type=email]')[0].className += ' is-error';
      else
        document.querySelectorAll(formClass + ' [type=password]')[0].className += ' is-error';
      errMsg.innerHTML = error.reason;
    } else if (error.error == 400) { // fields are empty
      var inputFields = document.querySelectorAll(formClass + ' .field');
      [].forEach.call(inputFields, f => {
        if (f.value == '' && f.className.match(/is-error/) == null)
          f.className += ' is-error'
        // else if (f.value != '')
        //   f.className = f.className.replace(/ is-error/, '');
      });
      errMsg.innerHTML = 'Please check that the input fields aren\'t empty';
    }
    errMsg.style.display = 'block';
  }
}
