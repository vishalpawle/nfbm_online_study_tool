# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#vishal_question").attr('disabled', true)
  chk_one = $("#question_options_attributes_0_option_right")
  chk_two = $("#question_options_attributes_1_option_right")
  chk_three = $("#question_options_attributes_2_option_right")
  chk_four = $("#question_options_attributes_3_option_right")
  chk_five = $("#question_options_attributes_4_option_right")
  chk_one.change ->
    if chk_one.is(':checked')
      $("#vishal_question").attr('disabled', false)
      chk_two.attr('disabled', true)
      chk_three.attr('disabled', true)
      chk_four.attr('disabled', true)
      chk_five.attr('disabled', true)
    else
      $('#vishal_question').attr('disabled', true)
      chk_two.attr('disabled', false)
      chk_three.attr('disabled', false)
      chk_four.attr('disabled', false)
      chk_five.attr('disabled', false)
  chk_two.change ->
    if chk_two.is(':checked')
      $('#vishal_question').attr('disabled', false)
      chk_one.attr('disabled', true)
      chk_three.attr('disabled', true)
      chk_four.attr('disabled', true)
      chk_five.attr('disabled', true)
    else
      $('#vishal_question').attr('disabled', true)
      chk_one.attr('disabled', false)
      chk_three.attr('disabled', false)
      chk_four.attr('disabled', false)
      chk_five.attr('disabled', false)
  chk_three.change ->
    if chk_three.is(':checked')
      $('#vishal_question').attr('disabled', false)
      chk_one.attr('disabled', true)
      chk_two.attr('disabled', true)
      chk_four.attr('disabled', true)
      chk_five.attr('disabled', true)
    else
      $('#vishal_question').attr('disabled', true)
      chk_one.attr('disabled', false)
      chk_two.attr('disabled', false)
      chk_four.attr('disabled', false)
      chk_five.attr('disabled', false)
  chk_four.change ->
    if chk_four.is(':checked')
      $('#vishal_question').attr('disabled', false)
      chk_one.attr('disabled', true)
      chk_two.attr('disabled', true)
      chk_three.attr('disabled', true)
      chk_five.attr('disabled', true)
    else
      $('#vishal_question').attr('disabled', true)
      chk_one.attr('disabled', false)
      chk_two.attr('disabled', false)
      chk_three.attr('disabled', false)
      chk_five.attr('disabled', false)
  chk_five.change ->
    if chk_five.is(':checked')
      $('#vishal_question').attr('disabled', false)
      chk_one.attr('disabled', true)
      chk_two.attr('disabled', true)
      chk_three.attr('disabled', true)
      chk_four.attr('disabled', true)
    else
      $('#vishal_question').attr('disabled', true)
      chk_one.attr('disabled', false)
      chk_two.attr('disabled', false)
      chk_three.attr('disabled', false)
      chk_four.attr('disabled', false)

