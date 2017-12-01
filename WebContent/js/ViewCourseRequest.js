/**
 * 
 */

function allow(a,j) {
	$.post("AllowCourseRequest.jsp",
	        {
	          student_id: a.getAttribute("data-id"),
	          department: a.getAttribute("data-department"),
	          course_year: a.getAttribute("data-year"),
	          course_code: a.getAttribute("data-course-code"),
	        },
	        function(data,status){
	        });
	
	$("#"+j).remove();
}

	

function reject(a,j) {
	$.post("RejectCourseRequest.jsp",
	        {
	          student_id: a.getAttribute("data-id"),
	          department: a.getAttribute("data-department"),
	          course_year: a.getAttribute("data-year"),
	          course_code: a.getAttribute("data-course-code"),
	        },
	        function(data,status){  
	        });
	
	$("#"+j).remove();
}