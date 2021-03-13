#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ->

  
  $('#form-file-user').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "file_user[name]":
        validators:
          notEmpty:
            message: 'Deve carregar um arquivo excell desde seu computador'
          file: 
            extension: 'xlsx',
            message: 'Por favor, selecione um arquivo xlsx'
