# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  exam_entrance = $('#exam_type_of_exam_entrance_exam')
  exam_final = $('#exam_type_of_exam_final_exam_for_this_level')
  exam_entrance.change ->
    if exam_entrance.is(':checked')
      alert("If you select this category of the exam, and student could pass this exam, then he / she will be entitle for level pramotion")
  exam_final.change ->
    if exam_final.is(':checked')
      alert("If you select this category of the exam, and student could pass this exam, then he / she will be entitle for level pramotion")
