const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_donation[number]"),
      cvc: formData.get("order_donation[cvc]"),
      exp_month: formData.get("order_donation[exp_month]"),
      exp_year: `20${formData.get("order_donation[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      console.log(response)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='order_donation[token]' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log("OK")
      }else{
        console.log("NG")
      }

      document.getElementById("card-number").removeAttribute("class", "input-default");
      document.getElementById("card-cvc").removeAttribute("class","input-default");
      document.getElementById("card-exp-month").removeAttribute("class", "input-expiration-date");
      document.getElementById("card-exp-year").removeAttribute("class","input-expiration-date");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);