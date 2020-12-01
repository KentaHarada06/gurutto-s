window.addEventListener('load', function(){

  const modalRoomCreate = document.getElementById("modal-room-create")
  const modalOverlay = document.getElementById("modal-overlay")
  const roomCreateBtn = document.getElementById("room-create-btn")
  const modalCreateBtn = document.getElementById("modal-create-btn")
  const modalRoomCancel = document.getElementById('room-create-cancel');

  roomCreateBtn.addEventListener('click', function() {
    modalRoomCreate.classList.add("active")
    modalOverlay.classList.add("active")
  })

  modalCreateBtn.addEventListener('click', function(e) {
    e.preventDefault();

    const formData = new FormData(document.getElementById("modal-room-create-form"))
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/rooms`, true)
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      document.getElementById("modal-room-create-form").reset();
      if (XHR.status == 422) {
        alert(`入力項目エラー: ルーム作成のフォームは全て入力してください。`);
        return null;
      }
      else if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }

      document.getElementById("modal-room-create-form").reset();
      modalRoomCreate.classList.remove("active")
      modalOverlay.classList.remove("active")

      location.reload();
    }
  })

  modalRoomCancel.addEventListener('click', function() {
    document.getElementById("modal-room-create-form").reset();
    modalRoomCreate.classList.remove("active")
    modalOverlay.classList.remove("active")
  })
  modalOverlay.addEventListener('click', function() {
    document.getElementById("modal-room-create-form").reset();
    modalRoomCreate.classList.remove("active")
    modalOverlay.classList.remove("active")
  })
})