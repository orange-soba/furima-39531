function preview() {
  const postForm = document.getElementById('post-form');
  if (!postForm) return null;

  const previewList = document.getElementById('previews');

  const fileField = document.querySelector('input[type="file"][name="item[image]"]');

  fileField.addEventListener('change', function(e) {
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div')
    previewWrapper.setAttribute('class', 'item-img-content');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'item-box-img-preview');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
};

window.addEventListener('turbo:load', preview);