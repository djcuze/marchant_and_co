jQuery(function () {
    return $('#invoice_invoice_items_attributes_0_inventory_item_attributes_description').autocomplete({
        source: $('#invoice_invoice_items_attributes_0_inventory_item_attributes_description').data('autocomplete-source')
    });
});

jQuery(function () {
    var category_name = $('#invoice_invoice_items_attributes_0_inventory_item_attributes_category_name')
    return category_name.autocomplete({
        source: category_name.data('autocomplete-source')
    });
});
jQuery(document).ready(function ($) {
    $(".clickable-row").click(function () {
        window.location = $(this).data("href");
    });
});