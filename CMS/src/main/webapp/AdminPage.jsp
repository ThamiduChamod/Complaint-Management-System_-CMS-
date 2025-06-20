<%@ page import="lk.ijse.gdse71.aad.cms.dto.ComplainDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: a
  Date: 6/18/2025
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="css/Admin.css" rel="stylesheet">
</head>
<body>


<div class="container mt-4">
    <!-- Header -->
<%--    <div class="row header align-items-center">--%>
<%--        <div class="col-md-10">--%>
<%--            <h3 class="mb-0">Admin Dashboard - Complaint Management System</h3>--%>
<%--        </div>--%>
<%--        <div class="col-md-2 text-end">--%>
<%--            <form action="logOut" method="post">--%>
<%--                <button class="btn btn-sm btn-danger logout-btn" type="submit">Log Out</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="container mt-4">
        <div class="row align-items-center dashboard-header">
            <div class="col-md-10">
                <h3>Admin Dashboard - Complaint Management System</h3>
            </div>
            <div class="col-md-2 text-end">
                <form action="/logOut" method="post">
                    <button class="logout-btn" type="submit">
                        <i class="bi bi-box-arrow-right logout-icon"></i> Log Out
                    </button>
                </form>
            </div>
        </div>
    </div>


    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 mb-4 mb-md-0">
            <div class="sidebar-item active" onclick="showSection('total')">Total Complaints</div>
            <div class="sidebar-item" onclick="showSection('resolved')">Resolved</div>
            <div class="sidebar-item" onclick="showSection('inprogress')">In Progress</div>
            <div class="sidebar-item" onclick="showSection('pending')">Pending</div>
        </div>

        <!-- Content -->
        <div class="col-md-10">
            <!-- Total Complaints -->
            <div id="total" class="content-section active">
                <h5 class="mb-4">Total Complaints</h5>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>User Email</th>
                        <th>Complaint</th>
                        <th>Complain Date</th>
                        <th>Answer</th>
                        <th>Answer Date</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<ComplainDTO> allComplain = (List<ComplainDTO>) request.getAttribute("AllComplain");
                        int allComplainsCount = 1;
                        if (allComplain != null) {
                            for (ComplainDTO complaint : allComplain) {
                    %>
                    <tr>
                        <td><%= allComplainsCount++ %></td>
                        <td><%= complaint.getU_email() %></td>
                        <td><%= complaint.getComplain() %></td>
                        <td><%= complaint.getComplaint_date() %></td>
                        <td><%= complaint.getAnswer() %></td>
                        <td><%= complaint.getAnswer_date() %></td>
                        <td><%= complaint.getStatus() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center text-muted">No complaints found.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Resolved Complaints -->
            <div id="resolved" class="content-section">
                <h5 class="mb-4">Resolved Complaints</h5>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-success">
                    <tr>
                        <th>#</th>
                        <th>User Email</th>
                        <th>Complaint</th>
                        <th>Complain Date</th>
                        <th>Answer</th>
                        <th>Answer Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<ComplainDTO> resolvedList = (List<ComplainDTO>) request.getAttribute("resolvedList");
                        int resolvedCount = 1;
                        if (resolvedList != null) {
                            for (ComplainDTO complaint : resolvedList) {
                    %>
                    <tr>
                        <td><%= resolvedCount++ %></td>
                        <td><%= complaint.getU_email() %></td>
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
                        <td colspan="6" class="text-center text-muted">No resolved complaints.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- In Progress Complaints -->
            <div id="inprogress" class="content-section">
                <h5 class="mb-4">In Progress Complaints</h5>

                <!-- Update Form -->
                <form id="updateForm" action="/AdminServlet" method="post" class="mb-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="idInput" class="form-label">Complaint Id</label>
                            <input name="id" type="text" id="idInput" class="form-control" readonly />
                        </div>
                        <div class="col-md-6">
                            <label for="emailInput" class="form-label">User Email</label>
                            <input name="email" type="text" id="emailInput" class="form-control" readonly />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <label for="complaintInput" class="form-label">Complaint</label>
                            <input name="complain" type="text" id="complaintInput" class="form-control" readonly />
                        </div>
                        <div class="col-md-6">
                            <label for="dateInput" class="form-label">Complaint Date</label>
                            <input name="complaint_date" type="text" id="dateInput" class="form-control" readonly />
                        </div>
                    </div>

                    <div class="row g-3 mt-3 align-items-center">
                        <div class="col-md-6">
                            <label for="answerInput" class="form-label">Answer</label>
                            <input name="answer" type="text" id="answerInput" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="statusSelect" class="form-label">Status</label>
                            <select name="status" id="statusSelect" class="form-select" aria-label="Select Status">
                                <option value="PROGRESS" selected>PROGRESS</option>
                                <option value="RESOLVED">RESOLVED</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>

                <!-- Table -->
                <table class="table table-bordered table-striped table-hover" id="inProgressTable">
                    <thead class="table-success">
                    <tr>
                        <th>#</th>
                        <th>Complaint Id</th>
                        <th>User Email</th>
                        <th>Complaint</th>
                        <th>Complaint Date</th>
                        <th>Answer</th>
                        <th>Answer Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<ComplainDTO> inProgressList = (List<ComplainDTO>) request.getAttribute("InProgress");
                        int count = 1;
                        if (inProgressList != null && !inProgressList.isEmpty()) {
                            for (ComplainDTO complaint : inProgressList) {
                    %>
                    <tr class="table-row"
                        data-id="<%= complaint.getId() %>"
                        data-email="<%= complaint.getU_email() %>"
                        data-complaint="<%= complaint.getComplain() %>"
                        data-date="<%= complaint.getComplaint_date() %>"
                        data-answer="<%= complaint.getAnswer() %>">
                        <td><%= count++ %></td>
                        <td><%= complaint.getId() %></td>
                        <td><%= complaint.getU_email() %></td>
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
                        <td colspan="7" class="text-center text-muted">No complaints in progress.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Pending Complaints -->
            <div id="pending" class="content-section">
                <h5 class="mb-4">Pending Complaints</h5>

                <!-- Update Form -->
                <form id="pendingUpdateForm" action="/AdminServlet" method="post" class="mb-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="pendingIdInput" class="form-label">Complaint Id</label>
                            <input name="id" type="text" id="pendingIdInput" class="form-control" readonly />
                        </div>
                        <div class="col-md-6">
                            <label for="pendingEmailInput" class="form-label">User Email</label>
                            <input name="email" type="text" id="pendingEmailInput" class="form-control" readonly />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <label for="pendingComplaintInput" class="form-label">Complaint</label>
                            <input name="complain" type="text" id="pendingComplaintInput" class="form-control" readonly />
                        </div>
                        <div class="col-md-6">
                            <label for="pendingDateInput" class="form-label">Complaint Date</label>
                            <input name="complaint_date" type="text" id="pendingDateInput" class="form-control" readonly />
                        </div>
                    </div>

                    <div class="row g-3 mt-3 align-items-center">
                        <div class="col-md-6">
                            <label for="pendingAnswerInput" class="form-label">Answer</label>
                            <input name="answer" type="text" id="pendingAnswerInput" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="pendingStatusSelect" class="form-label">Status</label>
                            <select name="status" id="pendingStatusSelect" class="form-select" aria-label="Select Status">
                                <option selected value="PROGRESS">PROGRESS</option>
                                <option value="RESOLVED">RESOLVED</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-4">
                        <button type="submit" class="btn btn-warning">Update</button>
                    </div>
                </form>

                <!-- Table -->
                <table class="table table-bordered table-striped table-hover" id="pendingTable">
                    <thead class="table-success">
                    <tr>
                        <th>#</th>
                        <th>Id</th>
                        <th>User Email</th>
                        <th>Complaint</th>
                        <th>Complaint Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<ComplainDTO> pendingList = (List<ComplainDTO>) request.getAttribute("Pending");
                        int pendingCount = 1;
                        if (pendingList != null && !pendingList.isEmpty()) {
                            for (ComplainDTO complaint : pendingList) {
                    %>
                    <tr class="pending-row"
                        data-id="<%= complaint.getId() %>"
                        data-email="<%= complaint.getU_email() %>"
                        data-complaint="<%= complaint.getComplain() %>"
                        data-date="<%= complaint.getComplaint_date() %>">
                        <td><%= pendingCount++ %></td>
                        <td><%= complaint.getId() %></td>
                        <td><%= complaint.getU_email() %></td>
                        <td><%= complaint.getComplain() %></td>
                        <td><%= complaint.getComplaint_date() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center text-muted">No complaints pending.</td>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="js/Adming.js"></script>
</body>
</html>
