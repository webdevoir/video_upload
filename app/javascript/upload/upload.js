import Uppy from 'uppy';

const upload = {
  initialize() {
    function fileUpload(fileInput) {
      fileInput.style.display = 'none'; // uppy will add its own file input

      var uppy = Uppy.Core({
          id: fileInput.id,
        })
        .use(Uppy.FileInput, {
          target: fileInput.parentNode,
        })
        .use(Uppy.Informer, {
          target: fileInput.parentNode,
        })
        .use(Uppy.ProgressBar, {
          target: imagePreview.parentNode,
        });

      uppy.use(Uppy.Tus, {
        endpoint: '/files',
        chunkSize: 5*1024*1024, // required unless tus-ruby-server is running on Goliath
      });

      uppy.on('upload-success', function (file, data) {
        // construct uploaded file data from the tus URL
        var uploadedFileData = JSON.stringify({
          id: data.url,
          storage: "cache",
          metadata: {
            filename:  file.name,
            size:      file.size,
            mime_type: file.type,
          }
        });

        // set hidden field value to the uploaded file data so that it's submitted with the form as the attachment
        var hiddenInput = fileInput.parentNode.querySelector('.upload-hidden');
        hiddenInput.value = uploadedFileData;
      })

      return uppy;
    }

    document.querySelectorAll("#file-input").forEach( fileInput => {
      fileUpload(fileInput)
    });
  }
}

export default upload;
