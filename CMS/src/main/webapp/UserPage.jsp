        <%@ page import="lk.ijse.gdse71.aad.cms.dto.ComplainDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: a
  Date: 6/18/2025
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    ComplainDTO resolved = (ComplainDTO) session.getAttribute("tableRow");--%>
<%--%>--%>
<%

    int totalResolved = (int) request.getAttribute("totalResolved");
    int totalInProgress = (int) request.getAttribute("totalInProgress");
    int totalPending = (int) request.getAttribute("totalPending");

%>



<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="css/User.css">
</head>
<body>
<div class="container text-center">
<%--    <div class="row">--%>
<%--        <div class="card text-bg-dark mb-3" data-bs-toggle="modal" data-bs-target="#mainCardModal" style="cursor: pointer;">--%>
<%--&lt;%&ndash;            <img src="..." class="card-img" alt="...">&ndash;%&gt;--%>
<%--            <div class="card-img-overlay">--%>
<%--                <h5 class="card-title">Card title</h5>--%>
<%--                <p class="card-text">Main content card clicked</p>--%>
<%--                <p class="card-text"><small>Last updated 3 mins ago</small></p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="container mt-4">
        <div class="row align-items-center dashboard-header " id="d-header">
            <div class="col-md-10">
                <h3>User Dashboard - Complaint Management System</h3>
            </div>
            <div class="col-md-2 text-end">
                <form action="/logOut" method="post">
                    <button class="logout-btn" type="submit" id="logout-btn">
                        <i class="bi bi-box-arrow-right logout-icon"></i> Log Out
                    </button>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm">
            <div class="card border-secondary mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#newComplainModal">
                <div class="card-body text-secondary">
                    <h5 class="card-title">+</h5>
                    <p class="card-text">New Complain</p>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card border-success mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#resolvedModal">
                <div class="card-body text-success">
                    <h5 class="card-title"><%=totalResolved%></h5>
                    <p class="card-text">Resolved</p>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card border-primary mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#progressModal">
                <div class="card-body text-primary">
                    <h5 class="card-title"><%=totalInProgress%></h5>
                    <p class="card-text">In Progress</p>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card border-warning mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#pendingModal">
                <div class="card-body">
                    <h5 class="card-title"><%=totalPending%></h5>
                    <p class="card-text">Pending</p>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- New Complain Modal -->
<div class="modal fade" id="newComplainModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content p-4 shadow-lg rounded-4">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold text-primary">New Complaint</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">

                <form class="styled-form" action="/UserPageServlet" method="post">
                    <div class="mb-3 text-start">
                        <label for="complain" class="form-label fw-semibold">Your Complaint</label>
                        <input type="text" class="form-control custom-input" id="complain" name="complain" placeholder="Enter your complaint">
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn custom-btn">Send</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<!-- Resolved Modal -->
<div class="modal fade" id="resolvedModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content shadow rounded-3">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Resolved Complaints</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Complaint Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-success">
                        <tr>
                            <th>#</th>
                            <th>Complaint</th>
                            <th>Complaint Date</th>
                            <th>Answer</th>
                            <th>Answered Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<ComplainDTO> resolvedList = (List<ComplainDTO>) request.getAttribute("resolvedList");
                            int i = 1;
                            if (resolvedList != null) {
                                for (ComplainDTO complaint : resolvedList) {
                        %>
                        <tr>
                            <td><%=i++%></td>
                            <td><%=complaint.getComplain()%></td>
                            <td><%=complaint.getComplaint_date()%></td>
                            <td><%=complaint.getAnswer()%></td>
                            <td><%=complaint.getAnswer_date()%></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No complaints resolved.</td>
                        </tr>
                        <%
                            }
                        %>

                        <!-- More rows can be added dynamically using JSTL or JS -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- In Progress Modal -->
<div class="modal fade" id="progressModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content shadow rounded-3">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">In Progress Complaints</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Modal or separate form -->
                <!-- Smaller, clean form -->
                <form action="updateUser" method="post" id="complaintForm"
                      class="p-3 rounded shadow-sm bg-white" style="font-size: 0.9rem;">

                    <div class="row g-2">
                        <div class="col-md-6">
                            <label for="id" class="form-label mb-1">Id</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="id" name="id" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="complaint" class="form-label mb-1">Complaint</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="complaint" name="complaint" >
                        </div>
                        <div class="col-md-6">
                            <label for="complaintDate" class="form-label mb-1">Complaint Date</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="complaintDate" name="complaintDate" readonly>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end gap-2 mt-3">
                        <button type="submit" formaction="updateUser" class="btn btn-sm btn-success">
                            <i class="bi bi-pencil-square me-1"></i> Update
                        </button>
                        <button formmethod="get" type="submit" formaction="updateUser" class="btn btn-sm btn-danger">
                            <i class="bi bi-pencil-square me-1"></i> Delete
                        </button>
                    </div>
                </form>




                <!-- Complaint Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-primary">
                        <tr>
                            <th>#</th>
                            <th>Id</th>
                            <th>Complaint</th>
                            <th>Complaint Date</th>
                            <th>Answer</th>
                            <th>Answered Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<ComplainDTO> inProgressList = (List<ComplainDTO>) request.getAttribute("InProgress");
                            int count = 1;
                            if (inProgressList != null && !inProgressList.isEmpty()) {
                                for (ComplainDTO complaint : inProgressList) {
                        %>
                        <tr class="complaint-row"
                            data-id="<%= complaint.getId() %>"
                            data-complaint="<%= complaint.getComplain() %>"
                            data-date="<%= complaint.getComplaint_date() %>"
                            data-answer="<%= complaint.getAnswer() %>"
                            data-answerdate="<%= complaint.getAnswer_date() %>">

                        <td><%= count++ %></td>
                            <td><%= complaint.getId()%></td>
                            <td><%= complaint.getComplain() %></td>
                            <td><%= complaint.getComplaint_date() %></td>
                            <td><%= complaint.getAnswer() %></td>
                            <td><%= complaint.getAnswer_date() %></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No complaints in progress.</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Pending Modal -->
<div class="modal fade" id="pendingModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content shadow rounded-3">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title">Pending Complaints</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Form Section -->
                <form action="updateUser" method="post" id="complaintFormPending"
                      class="p-3 rounded shadow-sm bg-white" style=" font-size: 0.9rem;">
                    <div class="row g-2">
                        <div class="col-md-6">
                            <label for="idPending" class="form-label mb-1">ID</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="idPending" name="id" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="complaintDatePending" class="form-label mb-1">Complaint Date</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="complaintDatePending" name="complaintDate" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="complaintPending" class="form-label mb-1">Complaint</label>
                            <input type="text" class="form-control form-control-sm rounded-2" id="complaintPending" name="complaint" >
                        </div>
                    </div>

                    <div class="d-flex justify-content-end gap-2 mt-3">
                        <button type="submit" formaction="updateUser" class="btn btn-sm btn-success">
                            <i class="bi bi-pencil-square me-1"></i> Update
                        </button>
                        <button formmethod="get" type="submit" formaction="updateUser" class="btn btn-sm btn-danger">
                            <i class="bi bi-pencil-square me-1"></i> Delete
                        </button>

                    </div>
                </form>
                <!-- Complaint Table -->
                <div class="table-responsive mb-4">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-warning">
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>Complaint</th>
                            <th>Complaint Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<ComplainDTO> pendingList = (List<ComplainDTO>) request.getAttribute("Pending");
                            int pendingCount = 1;
                            if (pendingList != null) {
                                for (ComplainDTO complaint : pendingList) {
                        %>
                        <tr class="pending-row"
                            data-id="<%= complaint.getId() %>"
                            data-complaint="<%= complaint.getComplain() %>"
                            data-date="<%= complaint.getComplaint_date() %>">
                            <td><%= pendingCount++ %></td>
                            <td><%= complaint.getId() %></td>
                            <td><%= complaint.getComplain() %></td>
                            <td><%= complaint.getComplaint_date() %></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="3" class="text-center">No complaints in pending.</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>



            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/user.js"></script>
</body>
</html>
