$(function() {
    $('.record__row__time').click(function() {
        $('.create').show();
        $('.create__field__date').text($(this).children('#date').val());
    });

    $('.create__field__close').click(function() {
        $('.create').hide();
    });
});