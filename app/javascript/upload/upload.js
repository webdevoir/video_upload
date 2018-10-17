import Uppy from 'uppy';
import AwsS3Multipart from '@uppy/aws-s3-multipart';

const upload = {
  initialize() {
    function fileUpload(fileInput) {
      console.log(window);
      fileInput.style.display = 'none'; // uppy will add its own file input
      const imagePreview = document.querySelector(".upload-preview");

      var uppy = window.Uppy.Core({
          id: fileInput.id,
        })
        .use(window.Uppy.FileInput, {
          target: fileInput.parentNode,
        })
        .use(window.Uppy.Informer, {
          target: fileInput.parentNode,
        })
        .use(window.Uppy.ProgressBar, {
          target: imagePreview.parentNode,
        });

      uppy.use(window.Uppy.AwsS3Multipart, {
        serverUrl: "http://localhost:3000/",
      });

      uppy.on('upload-success', function (file, data, uploadURL) {
        // show image preview
        imagePreview.src = URL.createObjectURL(file.data)
        // construct uploaded file data in the format that Shrine expects
        var uploadedFileData = JSON.stringify({
          id: uploadURL.match(/\/cache\/([^\?]+)/)[1], // extract key without prefix
          storage: 'cache',
          metadata: {
            size:      file.size,
            filename:  file.name,
            mime_type: file.type,
          }
      });

     // set hidden field value to the uploaded file data so that it's submitted with the form as the attachment
     var hiddenInput = fileInput.parentNode.querySelector('.upload-hidden')
     hiddenInput.value = uploadedFileData
   })

      return uppy;
    }

    document.querySelectorAll("#file-input").forEach( fileInput => {
      fileUpload(fileInput)
    });

    //Move the submit button to the end of the form
    const submitButton = document.getElementById('submit');
    const uploadForm   = document.querySelector('.upload-form');
    uploadForm.append(submitButton);
  }
}

export default upload;
