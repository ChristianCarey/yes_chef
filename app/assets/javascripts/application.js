// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require turbolinks
//= require highcharts
//= require chartkick
//= require bootstrap
//= require_tree .
function highlightAllOnMouseover(className){
  $(className).mouseover(function() {
    $(className).addClass("hovering");
  }).mouseleave(function() {
    $(className).removeClass("hovering");
  });
}
// highlightAllOnMouseover(".thing1");
// highlightAllOnMouseover(".thing2");

$(document).on('turbolinks:load', function(){
  var validFile = true;
  $('.syncronousUpload').find("input:file").each(function(i, elem) {
    var fileInput    = $(elem);
    var form         = $(fileInput.parents('form:first'));
    var submitButton = $(document).find('input[type="submit"]');
    var imgPreview   = $("<img src='#' alt='your image' />")
    var fileList     = $("<div class='file-list'></div>");
    var errorDiv     = $('#upload-errors');
    var max_size     = 2 * 1024 * 1024;

    fileInput.after(fileList);
    fileInput.fileupload({
      fileInput:       fileInput,
      url:             form.data('url'),
      type:            'POST',
      autoUpload:       false,
      formData:         form.data('form-data'),
      paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
      dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
      replaceFileInput: false,

      add: function (e, data) {
        validFile = true;
        var uploadFile = data.files[0];
        if (!(/\.(png)|(jpe?g)|(gif)$/i).test(uploadFile.name)) {
          errorDiv.removeClass("hidden");
          errorDiv.append("<p>Only web safe images allowed.</p><p>Valid formats are png, jpg/jpeg, and gif</p>");
          validFile = false;
        }
        if (uploadFile.size > (1024 * 1024)) { // 2mb
          errorDiv.removeClass("hidden");
          errorDiv.append("<p>File too large.</p><p>Max Image size is 1MB</p>");
          validFile = false;
        }

        if(validFile){
          fileName = "<p>"+uploadFile.name+"</p>"
          fileList.append(fileName);
          var reader = new FileReader();
          reader.onload = function (e) {
            $(imgPreview).attr('src', e.target.result);
          }
          reader.readAsDataURL(uploadFile);
          fileList.append(imgPreview);
        }else{
          fileInput.replaceWith( fileInput = fileInput.clone( true ) );
          $('.image-upload-description').each(function(){
            $(this).replaceWith( $(this) = $(this).clone( true ) );
          })
          form.off().submit();
        }
      },
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progressBar.css('width', progress + '%')
      },
      start: function (e) {
        submitButton.prop('disabled', true);

        progressBar.
          css('background', 'green').
          css('display', 'block').
          css('width', '0%').
          text("Loading...");
      },
      done: function(e, data) {
        submitButton.prop('disabled', false);
        progressBar.text("Uploading done");

        // extract key and generate URL from response
        var key   = $(data.jqXHR.responseXML).find("Key").text();
        var url   = 'https://' + form.data('host') + '/' + key;

        // create hidden field
        var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
        form.append(input);
        form.off().submit();
      },
      fail: function(e, data) {
        submitButton.prop('disabled', false);

        progressBar.
          css("background", "red").
          text("Failed");
      }
    });
  });
});
