$(document).ready(function () {
    var training_wheels = $('.training_wheels_button');

    training_wheels.click(function () {
        $('body').toggleClass('training_wheels');
    })
});