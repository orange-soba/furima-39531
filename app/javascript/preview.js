function preview() {
  const postForm = document.getElementById('post-form');
  if (!postForm) return null;

  const previewList = document.getElementById('previews');

  const fileField = document.querySelector('input[type="file"][name="item[image]"]');

  fileField.addEventListener('change', function(e) {
    
  });
};

window.addEventListener('turbo:load', preview);