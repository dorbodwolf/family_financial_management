// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// # $(document).ready ->
// #     subtypes = $('#income_subtype').html()
// #     console.log(subtypes)
// #     $('#income_income_type').change ->
// #         selected_income_type = $('#income_income_type :selected').text()
// #         options = $(subtypes).filter("optgroup[label='#{selected_income_type}']").html()
// #         console.log(options)
// #         if options
// #             $('#income_subtype').html(options)
// #         else
// #             $('#income_subtype').empty()

$(document).on('turbolinks:load',function(){
    // console.log("jquery...");
    subtypes = $('#income_subtype').html();
    $('#income_income_type').change(
        function(){
            jilianliebiao();
        }
    )

}
);

// 利用jquery的filter实现级联列表效果
function jilianliebiao(){
    selected_income_type = $('#income_income_type :selected').text();
    // console.log(selected_income_type)
    // console.log(typeof $(subtypes))
    // options = $(subtypes).filter("optgroup[label='#{selected_income_type}']").html();
    options = $(subtypes).filter("optgroup[label='" + selected_income_type + "']").html();
    // console.log(options);
    $('#income_subtype').html(options);
};

