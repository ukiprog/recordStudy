function getCreateWindow() {
    $('.record__row__time').click(function() {
        if ($('.edit').css('display') == 'none') {
            $('.create').show();
            $('.create__field__date').text($(this).children('#date').val());
        }
    });

    $('.create__field__close').click(function() {
        $('.create').hide();
    });
}

function getEditWindow() {
    $('.record__row__time__elem').click(function() {
        $('.create').hide();
        $('.edit').show();
        $('.edit__field__date').text($(this).siblings('#date').val());
        $('.new_record').attr('action', '/record/' + $(this).siblings('#id').val());
    });

    $('.edit__field__close').click(function() {
        $('.edit').hide();
    });
}

$(function() {
    getCreateWindow();
    getEditWindow();
});