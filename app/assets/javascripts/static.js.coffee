#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ->

  $('#form-sign-up').bootstrapValidator
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
