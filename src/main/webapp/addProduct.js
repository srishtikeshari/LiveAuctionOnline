// Code to show image file name - rajan
$(document).ready(function () {
	  bsCustomFileInput.init()
	})
	
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      $('#previewImage').attr('src', e.target.result);
      $('#previewImage').removeAttr('hidden');
      $('#previewImageLabel').removeAttr('hidden');
    }
    
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}
// code to change minimun bid date to next day
function todayDate() {
    var today = new Date(); // get the current date
    var dd = today.getDate(); //get the day from today.
    var mm = today.getMonth()+1; //get the month from today +1 because january is 0!
    var yyyy = today.getFullYear(); //get the year from today

    //if day is below 10, add a zero before (ex: 9 -> 09)
    if(dd<10) {
        dd='0'+dd
    }

    //like the day, do the same to month (3->03)
    if(mm<10) {
        mm='0'+mm
    }

    //finally join yyyy mm and dd with a "-" between then
    return yyyy+'-'+mm+'-'+dd;
}
$("#imagefile").change(function() {
  readURL(this);
});
$(document).ready(function(){
    $('#biddingdate').attr('min', todayDate());
    $('#biddingdate').attr('value', todayDate());
});