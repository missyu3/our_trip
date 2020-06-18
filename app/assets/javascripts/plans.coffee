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
          url: "schedules" + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex, to: evt.newIndex },
    onAdd: (evt) ->
        $.ajax
          url: "schedules" + '/add'
          type: 'patch'
          data: { to: evt.newIndex, evt_id: evt.target.getElementsByClassName('item_id')[evt.newIndex].textContent},
    onRemove: (evt) ->
        $.ajax
          url: "schedules" + '/remove'
          type: 'delete'
          data: { from: evt.oldIndex },
      })


  el_b = document.getElementById("sortable_list_B")
  if el_b != null
    sortable = Sortable.create(el_b, {
    group: 'shared'
    animation: 150
      })

