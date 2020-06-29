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
    expensesubtypes = $('#expense_subtype').html();
    $('#expense_expense_type').change(
        function(){
            // console.log("ok")
            autosubtype();
        }
    )

}
);

// 利用jquery的filter实现级联列表效果
function autosubtype(){
    selected_expense_type = $('#expense_expense_type :selected').text();
    // console.log('func1 ok')
    // console.log(selected_expense_type)
    // options = $(subtypes).filter("optgroup[label='#{selected_income_type}']").html();
    options = $(expensesubtypes).filter("optgroup[label='" + selected_expense_type + "']").html();
    options = '<option value="---请选择---">---请选择---</option>\n' + options
    // console.log(options);
    $('#expense_subtype').html(options);
    // select.options[select.options.length] = new Option('Text 1', 'Value1');
    expense_detailtype = $('#expense_detailtype').html();
    // expense_detailtype_nc = expense_detailtype
    // console.log(expense_detailtype)
    $('#expense_subtype').change(
        function(){
            // console.log('now fill leaftypes')
            selected_subtype = $('#expense_subtype :selected').text();
            console.log(selected_subtype)
            // console.log('func1 ok')
            // console.log(selected_expense_type)
            // options = $(subtypes).filter("optgroup[label='#{selected_income_type}']").html();
            // $('#expense_detailtype').html($('#my-custom-class').html());
            expense_detailtype = $('#my-custom-class').html();
            options = $(expense_detailtype).filter("optgroup[label='" + selected_subtype + "']").html();
            // options = '<option value="---请选择---">---请选择---</option>\n' + options
            // console.log(options);
            $('#expense_detailtype').html(options);
        }
    )
};

