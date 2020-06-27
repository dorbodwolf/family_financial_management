// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// // or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // compiled file. JavaScript code in this file should be added after the last require_* statement.
// //
// // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// // about supported directives.
// //
// //= require jquery
// //= require jquery_ujs
// //= require turbolinks
// //= require_tree .
// //= require bootstrap-sprockets
// //= require charts.min

// $(document).on('turbolinks:load',function(){
//         subtypes = $('#income_subtype').html();
//         console.log(subtypes);
//         $('#income_income_type').change(
//             function(){
//                 fun1();
//             }
//         )
  
//     }
// );

// function fun1(){
//     selected_income_type = $('#income_income_type :selected').text();
//     options = $(subtypes).filter("optgroup[label='#{selected_income_type}']").html();
//     $('#income_subtype').html(options);
//  };

// $(document).on('turbolinks:load', function() {
//     console.log("It works on each visit!")
//   })