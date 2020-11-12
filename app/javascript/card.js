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

    console.log("card event ok");
    console.log(process.env.PAYJP_PUBLIC_KEY);
  });
  // //商品購入ページの住所情報、カード情報取得
};

window.addEventListener("load", card);