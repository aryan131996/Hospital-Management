<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Doctor"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>
<%@ include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-paint">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3" role="alert">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification </label><input
									type="text" required name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist </label><select required
									name="specialist" class="form-control">
									<option>----select----</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option>
										<%=s.getSpecialistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email </label><input type="text"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No </label><input type="text"
									required name="mobno" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password </label><input
									type="password" required name="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>