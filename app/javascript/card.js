// クレジットカード決済機能
const card = () => {

  // 外部API PAY.JPの処理を行うための鍵の設定
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // 商品購入ページの住所情報、カード情報取得
  const form = document.getElementById("charge-form");
  // 購入するボタンが押された時の処理
  form.addEventListener("submit", (e) => {

    // Railsのデフォルトの購入時のアクションを停止
    e.preventDefault();

    // カード情報を取得する処理
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    // //カード情報を取得する処理

    // カード情報のトークン化を行う処理
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log("token ok");
        console.log(token);
      }
    });
    // //カード情報のトークン化を行う処理

    console.log("card event ok");
    console.log(process.env.PAYJP_PUBLIC_KEY);
    console.log(card)
  });
  // //商品購入ページの住所情報、カード情報取得
};

window.addEventListener("load", card);