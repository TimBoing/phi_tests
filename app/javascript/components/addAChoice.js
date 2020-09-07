const addAChoice = () => {
  const addChoiceBtn = document.querySelector(".add-new-choice-container");
  if(!addChoiceBtn) return;
  const addChoiceForm = document.getElementById("add-choice-form");

  addChoiceBtn.addEventListener("click", (event) => {
    addChoiceForm.style.display = "block";
    addChoiceBtn.style.display = "none";
  });

}

export{addAChoice};
