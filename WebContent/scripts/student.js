$(function() {
	$("#modal_trigger").leanModal( {
		top : 200,
		overlay : 0.6,
		closeButton : ".modal_close"
	});

	$("#create")
			.click(
					function() {
						var studentnumber = $("#studentnumber").val();
						var gender = $("#gender").val();
						var email = $("#email").val();
						var firstname = $("#firstname").val();
						var lastname = $("#lastname").val();
						var birthdate = $("#birthdate").val();
						var disability = $("#disability").val();

						if (studentnumber == "") {
							alert("Please enter student number");
							return false;
						}
						var numberRegex = /^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/;

						if (numberRegex.test(studentnumber)) {
						} else {
							alert("Please enter digits only.");
							$("#studentnumber").val("");
							return false;
						}
						if (gender == "") {
							alert("Please enter gender");
							return false;
						}
						if (birthdate == "") {
							alert("Please enter dateofbirth");
							return false;
						}
						if (disability == "") {
							alert("Please enter disability");
							return false;
						}
						if (firstname == "") {
							alert("Please enter firstname");
							return false;
						}
						if (lastname == "") {
							alert("Please enter lastname");
							return false;
						}
						if (email == "") {
							alert("Please enter email");
							return false;
						} else {
							var pattern = new RegExp(
									/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
							if (pattern.test(email)) {
							} else {
								alert("Please enter valid Email ID.");
								$("#email").val("");
								return false;
							}
						}
					});
	$("#close").click(function() {
		$("#studentnumber").val("");
		$("#gender").val("");
		$("#email").val("");
		$("#firstname").val("");
		$("#lastname").val("");
		$("#birthdate").val("");
		$("#disability").val("");
	});
	for ( var i = 0; i < 700; i++) {
		$("#modal_edit" + i).leanModal( {
			top : 200,
			overlay : 0.6,
			closeButton : ".modal_close"
		});
		$("#modal_edit" + i).click(
				function() {
					$.get("student.do?method=editStudent&objIdEdit="
							+ $("#objIdEdit").val(), function(data) {
						var str = data.split("^");
						$("#objId").val(str[0]);
						$("#studentnumber1").val(str[1]);
						$("#gender1").val(str[2]);
						$("#birthdate1").val(str[3]);
						$("#disability1").val(str[4]);
						$("#firstname1").val(str[5]);
						$("#lastname1").val(str[6]);
						$("#email1").val(str[7]);
					});
				});
	}
});
