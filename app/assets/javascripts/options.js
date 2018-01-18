$(document).ready(function () {
    var button = $('.settings');
    var options = $('.settings_options');

    button.click(function () {
        options.toggleClass('flex');
    })
});