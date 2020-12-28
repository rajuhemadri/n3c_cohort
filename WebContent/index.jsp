<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>
<style type="text/css">
table.dataTable thead .sorting_asc {
	background-image: none !important;
}
</style>
<body>

	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Cohort Exploration
		</h2>
		<div style="text-align: center;">
			This is an initial configuration of an exploration tool for the N3C
			cohort data.<br> You are encouraged to submit suggestions for
			enhancements/additions to <a href="https://n3c-help.atlassian.net/jira/software/c/projects/N3CINTA/issues/N3CINTA-4">this
				tracking issue.</a>
		</div>
		<p>&nbsp;</p>
		<ul class="nav nav-tabs" style="font-size: 16px;">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#characteristics">Characteristics</a></li>
			<li><a data-toggle="tab" href="#blood">Blood</a></li>
			<li><a data-toggle="tab" href="#charlson">Charlson</a></li>
			<li><a data-toggle="tab" href="#medications">Medications</a></li>
			<li><a data-toggle="tab" href="#labs">Labs</a></li>
			<li><a data-toggle="tab" href="#severity">Severity</a></li>
			<li><a data-toggle="tab" href="#tables">Tables</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<jsp:include page="graphs/home.jsp" flush="true" />
			</div>
			
			<div class="tab-pane fade" id="tables">

				<div id="target_table"></div>
				<script type="text/javascript">
					function testing(mode) {
						d3.html("<util:applicationRoot/>/tables/" + mode + ".jsp", function(fragment) {
							d3.select("#target_table").node().append(fragment);
						});
					}
				</script>

				<form action="index.jsp">
					<label for="table">Choose a table:</label>
					<select name="mode" id="mode" onchange="testing(mode.value)">
						<option value="characteristics"	<c:if test="${empty param.mode ||  param.mode == 'characteristics' }">selected</c:if>>Characteristics</option>
						<option value="blood" <c:if test="${param.mode == 'blood' }">selected</c:if>>Blood</option>
						<option value="charlson" <c:if test="${param.mode == 'charlson' }">selected</c:if>>Charlson</option>
						<option value="filled" <c:if test="${param.mode == 'filled' }">selected</c:if>>Filled</option>
						<option value="meds" <c:if test="${param.mode == 'meds' }">selected</c:if>>Medications</option>
						<option value="models" <c:if test="${param.mode == 'models' }">selected</c:if>>Models</option>
						<option value="peak" <c:if test="${param.mode == 'peak' }">selected</c:if>>Peaks</option>
						<option value="severity" <c:if test="${param.mode == 'severity' }">selected</c:if>>Severity</option>
					</select>
				</form>
				<jsp:include page="tables/characteristics.jsp" flush="true" />
				<div id="table" style="overflow: scroll;">&nbsp;</div>
				<div id="op_table" style="overflow: scroll;">&nbsp;</div>
			</div>

			<div class="tab-pane fade" id="blood">
				<jsp:include page="graphs/blood.jsp" flush="true" />
			</div>
			<div class="tab-pane fade" id="characteristics">
				<jsp:include page="graphs/characteristics.jsp" flush="true" />
			</div>
			<div class="tab-pane fade" id="charlson">
				<jsp:include page="graphs/charlson.jsp" flush="true" />
			</div>
			<div class="tab-pane fade" id="medications">
				<jsp:include page="graphs/medications.jsp" flush="true" />
			</div>
			<div class="tab-pane fade" id="labs">
				<jsp:include page="graphs/labs.jsp" flush="true" />
			</div>
			<div class="tab-pane fade" id="severity">
				<jsp:include page="graphs/severity.jsp" flush="true" />
			</div>
		</div>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
