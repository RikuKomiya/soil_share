// form用（フロント側）のvalidation
var forms = document.getElementsByClassName('needs-validation');
var validation = Array.prototype.filter.call(forms, function(form) {
  form.addEventListener('submit', function(event) {
    if (form.checkValidity() === false) {
      event.preventDefault();
      event.stopPropagation();
    }
    form.classList.add('was-validated');
  }, false);
});

function resetValidity(e) {
  var target = $(`#${e.id}`)
  target.removeClass('is-invalid')
  target.parent().find('.error-message').hide()
}

function CheckPassword(confirm){
  var password = $('#user_password').val();
  var confirmation = $('#user_password_confirmation').val();
  if(password != confirmation){
    confirm.setCustomValidity("error");
  }else{
    confirm.setCustomValidity('');
  }
}