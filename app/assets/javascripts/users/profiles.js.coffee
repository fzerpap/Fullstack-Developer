#= require jasny/jasny-bootstrap.min
#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ->
   $('#form_edit_user').bootstrapValidator
     feedbackIcons:
       valid: 'fa fa-check ',
       invalid: 'fa fa-times',
       validating: 'fa fa-refresh'
     live: 'submitted'
     fields:
       "user[name]":
         validators:
           notEmpty:
             message: "Nome do Usuário es Obrigatorio"
       "user[username]":
         validators:
           notEmpty:
             message: "Login es Obrigatorio"
       "user[email]":
         validators:
           notEmpty:
             message: "Email es Obrigatorio"