#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ->

  $('#form-user').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "user[full_name]":
        validators:
          notEmpty:
            message: 'Deve inserir seu nome completo'
      "user[password]":
        validators:
          notEmpty:
            message: 'Deve inserir una senha'
          regexp:
            regexp: /^(.{8,})$/
            message: 'Senha mínima é de 8 carácteres'
      "user[password_confirmation]":
        validators:
          notEmpty:
            message: 'Deve inserir un valor'
          identical:
            field: "user[password]"
            message: 'As senhas não coinciden'
      "user[email]":
        validators:
          notEmpty:
            message: 'Deve inserir o email.'
          emailAddress:
            message: 'Deve inserir um email válido'
      "email_confirmation":
        validators:
          identical:
            field: 'user[email]'
            message: 'Os correos deven ser identicos'
      "user[role]":
        validators:
          notEmpty:
            message: 'Deve selecionar um role'


  $('#form_edit_useDelete').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "user[name]":
        validators:
          notEmpty:
            message: 'Debe inserir un nombre'
      "user[email]":
        validators:
          notEmpty:
            message: 'Debe inserir el correo eléctronico del usuario.'
      "user[cellphone]":
        validators:
          notEmpty:
            message: 'Debe inserir un número telefónico.'
      "user[mall_id]":
        validators:
          notEmpty:
            message: 'Debe seleccionar un mall.'
      "user[role_id]":
        validators:
          notEmpty:
            message: 'Debe seleccionar un rol.'

  $('#edit-password-profile').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "user[current_password]":
        validators:
          notEmpty:
            message: 'A senha atual é obrigatoria'
      "user[password]":
        validators:
          notEmpty:
            message: 'A nova senha é obrigatoria'
          regexp:
            regexp: /^(.{8,})$/
            message: 'A senha mínima é de 8 carácteres'
      "user[password_confirmation]":
        validators:
          identical:
            field: "user[password]"
            message: 'As senhas nao coinciden'