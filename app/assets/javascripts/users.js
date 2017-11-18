$(function () {
    $("#settings-delete-account-form").submit(function (e) {
        if (!confirm('Are you sure you want to delete your account?')) {
            e.preventDefault();
            window.location.reload()
        }
    });
});