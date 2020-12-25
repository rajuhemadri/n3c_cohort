<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Race</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as amind from enclave_cohort.all_patient_characteristics_by_covid_status where value='American Indian or Alaska Native') as amind
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as asian from enclave_cohort.all_patient_characteristics_by_covid_status where value='Asian') as asian
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as black from enclave_cohort.all_patient_characteristics_by_covid_status where value='Black or African American') as black
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as unknown from enclave_cohort.all_patient_characteristics_by_covid_status where value='Missing/Unknown' and variable='Race') as unknown
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as hawaiian from enclave_cohort.all_patient_characteristics_by_covid_status where value='Native Hawaiian or Other Pacific Islander') as hawaiian
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.all_patient_characteristics_by_covid_status where value='Other' and variable='Race') as other
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as white from enclave_cohort.all_patient_characteristics_by_covid_status where value='White') as white
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">American Indian or Alaska Native</div>
				<div class="panel-body">
					<div id="race_amind"></div>
					<p>Overall: ${row.amind}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Asian</div>
				<div class="panel-body">
					<div id="race_asian"></div>
					<p>Overall: ${row.asian}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Black or African American</div>
				<div class="panel-body">
					<div id="race_black"></div>
					<p>Overall: ${row.black}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="race_missing"></div>
					<p>Overall: ${row.unknown}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Native Hawaiian or Other Pacific Islander</div>
				<div class="panel-body">
					<div id="race_hawaiian"></div>
					<p>Overall: ${row.hawaiian}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="race_other"></div>
					<p>Overall: ${row.other}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">White</div>
				<div class="panel-body">
					<div id="race_white"></div>
					<p>Overall: ${row.white}</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=American+Indian+or+Alaska+Native" />
	<jsp:param name="dom_element" value="#race_amind" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Asian" />
	<jsp:param name="dom_element" value="#race_asian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Black+or+African+American" />
	<jsp:param name="dom_element" value="#race_black" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#race_missing" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Native+Hawaiian+or+Other+Pacific+Islander" />
	<jsp:param name="dom_element" value="#race_hawaiian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Other" />
	<jsp:param name="dom_element" value="#race_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#race_white" />
</jsp:include>
