<ul class="nav nav-tabs" style="font-size:16px;">
	<li class="active"><a data-toggle="tab" href="#by_severity">by Severity</a></li>
	<li><a data-toggle="tab" href="#by_type">by Type</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade active" id="by_severity">
	<jsp:include page="blood_by_severity.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="by_type">
	<jsp:include page="blood_by_type.jsp" flush="true" />
</div>
</div>
