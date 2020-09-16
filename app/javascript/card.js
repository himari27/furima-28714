const pay = () => {
  Payjp.setPublicKey("pk_test_7f40a4f9efda19bfed64c68a");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("order_purchase[number]"),
      cvc: formData.get("order_purchase[cvc]"),
      exp_month: formData.get("order_purchase[exp_month]"),
      exp_year: `20${formData.get("order_purchase[exp_year]")}`,
    };

    // console.log(card)

    Payjp.createToken(card, (status, response) => {
      // console.log(status)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='order_purchase[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
 
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);