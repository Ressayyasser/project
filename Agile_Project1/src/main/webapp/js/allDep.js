window.history.replaceState({}, document.title, window.location.pathname);
document.getElementById("openPopUp").addEventListener("click", function (e){
    e.preventDefault();
    var blackWindowOpen = document.getElementById("blackWindow");
    blackWindowOpen.style.display = "block";
});
document.getElementById("cancel").addEventListener("click", function (e){
    e.preventDefault();
    var blackWindowClose = document.getElementById("blackWindow");
    blackWindowClose.style.display = "none";
});
document.getElementById("cancelUpdate").addEventListener("click", function (e){
    e.preventDefault();
    var updateModalClose = document.getElementById("updateModal");
    updateModalClose.style.display = "none";
});
function submitDelete(e) {
    var form = document.getElementById(e);
    form.submit();
}
function updateModal(id, name){
    var modal = document.getElementById("updateModal");
    var idInput = document.getElementById("updateModaleIdInput");
    var nameInput = document.getElementById("updateModalNameInput");
    modal.style.display = "block";
    idInput.value = id;
    nameInput.value = name;
}