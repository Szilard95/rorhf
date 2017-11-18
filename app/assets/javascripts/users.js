$(function () {
    function confimation(e) {
        if (!confirm('Are you sure?')) {
            e.preventDefault();
            window.location.reload()
        }
    }

    $("#settings-delete-account-form").submit(function (e) {
        confimation(e);
    });

    $(".confirmation-required").click(function (e) {
        confimation(e);
    })
});