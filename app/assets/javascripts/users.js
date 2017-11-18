$(function () {
    $("#settings-delete-account-form").submit(function (e) {
        e.preventDefault();
        if (!confirm('Are you sure you want to delete your account?')) {
            window.location.reload()
        }
    });
});