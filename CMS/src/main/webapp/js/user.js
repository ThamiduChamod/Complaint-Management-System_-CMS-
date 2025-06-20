document.addEventListener('DOMContentLoaded', function () {
    const rows = document.querySelectorAll('.complaint-row');

    rows.forEach(function (row) {
        row.addEventListener('click', function () {
            document.getElementById('id').value = row.dataset.id;
            document.getElementById("complaint").value = this.dataset.complaint;
            document.getElementById("complaintDate").value = this.dataset.date;
            document.getElementById("answer").value = this.dataset.answer;
            document.getElementById("answerDate").value = this.dataset.answerdate;
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const rows = document.querySelectorAll('.pending-row');

    rows.forEach(row => {
        row.addEventListener('click', () => {
            // Fill form fields with data attributes
            document.getElementById('idPending').value = row.dataset.id || '';
            document.getElementById('complaintPending').value = row.dataset.complaint || '';
            document.getElementById('complaintDatePending').value = row.dataset.date || '';
        });
    });
});