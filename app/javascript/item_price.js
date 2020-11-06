//商品購入画面で金額が入力されたとき、販売手数料、販売利益を表示する処理
function itemPrice() {

  // 金額の入力情報の要素の取得
  const priceInput = document.getElementById("item-price");

  // 金額の情報が入力されたときにイベントが発火する
  priceInput.addEventListener("input", () => {

    // 入力された金額を取得
    const inputValue = priceInput.value;
    // 販売手数料の要素の取得
    const addTaxDom = document.getElementById("add-tax-price");
    // 販売利益の要素の取得
    const addProfitDom = document.getElementById("profit");

    // 販売手数料の表示処理(手数料10%)
    addTaxDom.innerHTML = Math.floor( (inputValue / 100) * 10 )
    // 販売利益の表示処理(金額 - 手数料)
    addProfitDom.innerHTML = Math.ceil( inputValue - ( (inputValue / 100) * 10 ) )

  })
}

// 画面が読み込まれたときに処理を実行する
window.addEventListener('load', itemPrice)