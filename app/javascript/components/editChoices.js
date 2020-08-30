const editChoices = () => {
  let editChoiceBtns = document.querySelectorAll(".edit-choice-btn");
  if(!editChoiceBtns) return;
  let choiceEditions = document.querySelectorAll(".choice-edition");
  let choiceOptions = document.querySelectorAll(".choice-options");


  editChoiceBtns.forEach((btn) => {

    btn.addEventListener('click', (event) => {
      let theChoice = btn.dataset.choice;
      choiceEditions.forEach((ed) => {
        if(ed.dataset.choice == theChoice){
          ed.style.display = "block";
        }else{
          ed.style.display = "none";
        }
      });

      choiceOptions.forEach((op) => {
        if(op.dataset.choice == theChoice){
          op.style.display = "none";
        }else{
          op.style.display = "flex";
        }
      });
    });
  });
}

export{editChoices};
