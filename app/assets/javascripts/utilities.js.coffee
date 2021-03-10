
$('.numeric').blur ->
  $(this).parseNumber({format:"#.###,00", locale:"us"});
  $(this).formatNumber({format:"#.###,00", locale:"pt"})

# Decimal Number
$(".decimal-number").keyup (e) ->
  valor = this.value
  if valor.includes(',')
    valor_split = valor.split(',')
    valor = valor_split[0]+valor_split[1]
  if valor.length > 2
    valor_entero = valor.substr(0,valor.length-2)
    valor_decimal = valor.substr(valor.length-2,valor.length)
    this.value = valor_entero+','+valor_decimal
  else
    this.value = valor

$ ->
  $('#customer-autocomplete').autocomplete source: '/search_customers'
  return

$("#customer-autocomplete").autocomplete select: (event, i) ->
  $.ajax
    type: "POST"
    url: "/customers/get_customer" 
    dataType: "JSON"
    data:
      customer: i.item.value
    success: (data) ->
      console.log(data)
      $(".box1").css('display','block')
      $("#customer-id").val(data[0]['id'])
      $("#customer-autocomplete").val(data[0]['code'])
      $("#customer-name").val(data[0]['name'])
      $("#customer-email").val(data[0]['email'])


$("#select-providence-type").on "change", ->
  $.ajax
    type: "POST"
    url: "/providence_operations/get_providence_operations" 
    dataType: "JSON"
    data:
      providence_type_id: $(this).val()
    success: (data) ->
      $(".box1").css("display", "block");
      $("#select-operation").empty()
      if data.length > 0
        $("#select-operation").append('<option value= 0'+'>'+'Select a Operation</option>')
        console.log(data)
        $.each data, (index, operation) ->
          $("#select-operation").append('<option value='+operation.id+'>'+operation.operation_name+'</option>')
      else
        $("#select-operation").append('<option value= 0'+'>'+'The selected provicende type has not operations</option>')
    error: (data) ->
      alert('A provicende type não tem operações')
    
  

