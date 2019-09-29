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
        $('.edit__form').attr('action', '/record/' + $(this).siblings('#id').val());
        $('.edit__field__delete_action').attr('href', '/record/' + $(this).siblings('#id').val());

        $.ajax({
            type: 'GET',
            url: ' /record/' + $(this).siblings('#id').val() + '/edit',
            dataType: 'json'
        }).done(function(data) {
            $('.edit__field #start').val(data['start'].substr(0, 10) + ' ' + data['start'].substr(11, 8));
            $('.edit__field #end').val(data['end'].substr(0, 10) + ' ' + data['end'].substr(11, 8));
            $('.edit__field #subject_id').val(data['subject_id']);
            $('.edit__field #comment').val(data['comment']);
        });
    });

    $('.edit__field__close').click(function() {
        $('.edit').hide();
    });
}

function submitComment() {
    $('.record__row__comment__input').on('blur', function() {
        $(this).siblings('.record__row__comment__submit').click();
    });
}

function listDisplay() {
    $('.record_list__year').click(function() {
        if ($(this).siblings().css('display') == 'none') {
            $(this).siblings().show();
        } else {
            $(this).siblings().hide();
        }
    });
}

function getQuestionCreateWindow() {
    $('.question__new').click(function() {
        $('.create').show();
    });

    $('.create__field__close').click(function() {
        $('.create').hide();
    });
}

$(function() {
    getCreateWindow();
    getEditWindow();
    submitComment();
    listDisplay();
    getQuestionCreateWindow();
});
