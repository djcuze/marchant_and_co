$(document).ready(function () {
    console.log('jQuery loaded')
});

jQuery(function() {
    return $('#invoice_invoice_items_attributes_0_inventory_item_attributes_category_name').autocomplete({
        source: $('#invoice_invoice_items_attributes_0_inventory_item_attributes_category_name').data('autocomplete-source')
    });
});