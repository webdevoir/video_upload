var tus = require("tus-js-client");

const submitInput = document.getElementById('submit');

//The following is structured with this blog post in mind:
// https://medium.com/statuscode/introducing-webpacker-7136d66cddfb


const upload = {
  initialize() {
    submitInput.addEventListener("click", function(e) {
        // Get the selected file from the input element

        e.preventDefault();
        var file = e.target.files[0]

        // Create a new tus upload
        var upload = new tus.Upload(file, {
            endpoint: "http://localhost:1080/files/",
            retryDelays: [0, 1000, 3000, 5000],
            metadata: {
                filename: file.name,
                filetype: file.type
            },
            onError: function(error) {
                console.log("Failed because: " + error)
            },
            onProgress: function(bytesUploaded, bytesTotal) {
                var percentage = (bytesUploaded / bytesTotal * 100).toFixed(2)
                console.log(bytesUploaded, bytesTotal, percentage + "%")
            },
            onSuccess: function() {
                console.log("Download %s from %s", upload.file.name, upload.url)
            }
        })

        // Start the upload
        upload.start()
    });
  }
}

export default upload;
