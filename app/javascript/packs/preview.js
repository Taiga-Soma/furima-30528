if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('item-box-img')

     // 選択した画像を表示する関数
     const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div')
     imageElement.setAttribute('class', "image-element")
     let imageElementNum = document.querySelectorAll('.image-element').length


     // 表示する画像を生成
     const blobImage = document.createElement('img')
     blobImage.setAttribute('src', blob)

     const inputHTML = document.createElement('input')
     inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
     inputHTML.setAttribute('name', 'message[images][]')
     inputHTML.setAttribute('type', 'file')

     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage)
     imageElement.appendChild(inputHTML)
     ImageList.appendChild(imageElement)

     inputHTML.addEventListener('change', (e) => {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    })
   };

    document.getElementById('item-image').addEventListener('change', function(e){
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)

      // プレビューの画像サイズを指定
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('height', 200);

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
   });
  });
}