$(document).ready(function() {
    function addPhotos() {
        var $photoID = $('.div.card:last').attr('id');
        $photoID = (parseInt($photoID, 10) - 100).toString();

        $.ajax({ url: '/tweets/' + $photoID + '/load_more', success: function(data){
            $(data).hide().appendTo('.div.card').slideDown();
        }, dataType: 'html'});
    };

    $(window).scroll(function() {
        var $winTop = $(window).scrollTop(), $docHeight = $(document).height(), $winHeight = $(window).height();

        if ($winTop == $docHeight - $winHeight) {
            addPhotos();
        }
    });
});
