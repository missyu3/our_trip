# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  el_a = document.getElementById("sortable_list_A")
  if el_a != null
    sortable = Sortable.create(el_a, {
    group: 'shared',
    animation: 150,
    onUpdate: (evt) ->
        $.ajax
          url: $("#parent_id").val() + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex, to: evt.newIndex },
    onAdd: (evt) ->
        $.ajax
          url: $("#parent_id").val() + '/add'
          type: 'patch'
          data: { to: evt.newIndex, evt_id: evt.target.getElementsByClassName('item_id')[evt.target.getElementsByClassName('item_id').length - 1].textContent},
    onRemove: (evt) ->
        $.ajax
          url: $("#parent_id").val() + '/remove'
          type: 'delete'
          data: { from: evt.oldIndex },
      })


  el_b = document.getElementById("sortable_list_B")
  if el_b != null
    sortable = Sortable.create(el_b, {
    group: 'shared'
    animation: 150
      })

