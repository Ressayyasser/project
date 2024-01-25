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
    var updateModalClose = document.getElementById("updateModal1");
    updateModalClose.style.display = "none";
});
document.getElementById("cancelUpdate2").addEventListener("click", function (e){
    e.preventDefault();
    var updateModalClose = document.getElementById("updateModal2");
    updateModalClose.style.display = "none";
});
document.getElementById("cancelAdd").addEventListener("click", function (e){
    e.preventDefault();
    var updateModalClose = document.getElementById("addModal");
    updateModalClose.style.display = "none";
});
function updateModal1(id, name){
    var modal = document.getElementById("updateModal1");
    var idInput = document.getElementById("updateModaleIdInput");
    var nameInput = document.getElementById("updateModalNameInput");
    modal.style.display = "block";
    idInput.value = id;
    nameInput.value = name;
}
function updateModal2(id, name){
    var modal = document.getElementById("updateModal2");
    var idInput = document.getElementById("updateModaleIdInput2");
    var nameInput = document.getElementById("updateModalNameInput2");
    modal.style.display = "block";
    idInput.value = id;
    nameInput.value = name;
}
function addModal(id, name){
    var modal = document.getElementById("addModal");
    var idInput = document.getElementById("addModaleIdInput");
    var nameText = document.getElementById("addModalNameText");
    modal.style.display = "block";
    idInput.value = id;
    nameText.textContent = name;
}
function submitDelete(e) {
    var form = document.getElementById(e);
    form.submit();
}
function goBack(){
    var form = document.getElementById("goBack");
    form.submit();
}