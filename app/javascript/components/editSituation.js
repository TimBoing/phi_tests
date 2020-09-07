const editSituation = () => {
  const editSituationBtn = document.querySelector(".edit-situation-btn");
  if(!editSituationBtn) return;
  const editSituationContainer = document.querySelector(".situation-edition")
  const cancelSituationEditionBtn = document.querySelector(".cancel-situation-edition")

  editSituationBtn.addEventListener('click', (event) => {
    editSituationContainer.style.display = "block";
    editSituationBtn.style.display = "none";
  });

  cancelSituationEditionBtn.addEventListener('click', (event) => {
    editSituationContainer.style.display = "none";
    editSituationBtn.style.display = "block";
  });
}

export{editSituation};
