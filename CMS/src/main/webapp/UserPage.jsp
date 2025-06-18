<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 6/18/2025
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="css/User.css">
</head>
<body>
<div class="container text-center">
    <div class="row">
        <div class="card text-bg-dark mb-3" data-bs-toggle="modal" data-bs-target="#mainCardModal" style="cursor: pointer;">
            <img src="..." class="card-img" alt="...">
            <div class="card-img-overlay">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Main content card clicked</p>
                <p class="card-text"><small>Last updated 3 mins ago</small></p>
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
                    <h5 class="card-title">0</h5>
                    <p class="card-text">Resolved</p>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card border-primary mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#progressModal">
                <div class="card-body text-primary">
                    <h5 class="card-title">0</h5>
                    <p class="card-text">In Progress</p>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card border-warning mb-3" style="max-width: 18rem; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#pendingModal">
                <div class="card-body">
                    <h5 class="card-title">0</h5>
                    <p class="card-text">Pending</p>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Main Card Modal -->
<%--<div class="modal fade" id="mainCardModal" tabindex="-1">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">Main Card Details</h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                This is the content of the main background card.--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- New Complain Modal -->
<div class="modal fade" id="newComplainModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content p-4 shadow-lg rounded-4">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold text-primary">New Complaint</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">

                <form class="styled-form">
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
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Resolved Complaints</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                Total Resolved Complaints: 0
            </div>
        </div>
    </div>
</div>

<!-- In Progress Modal -->
<div class="modal fade" id="progressModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">In Progress</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                You have 0 complaints in progress.
            </div>
        </div>
    </div>
</div>

<!-- Pending Modal -->
<div class="modal fade" id="pendingModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Pending Complaints</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                You have 0 pending complaints.
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>

</body>
</html>
