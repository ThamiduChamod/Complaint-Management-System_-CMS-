// function showSection(sectionId) {
//     document.querySelectorAll('.content-section').forEach(section => {
//         section.classList.remove('active');
//     });
//     document.getElementById(sectionId).classList.add('active');
// }
function showSection(id) {
    // Remove active class from all sidebar items and content sections
    document.querySelectorAll('.sidebar-item').forEach(el => el.classList.remove('active'));
    document.querySelectorAll('.content-section').forEach(el => el.classList.remove('active'));

    // Add active class to clicked sidebar and corresponding content
    event.target.classList.add('active');
    document.getElementById(id).classList.add('active');
}

document.addEventListener('DOMContentLoaded', () => {
    const rows = document.querySelectorAll('.table-row');

    rows.forEach(row => {
        row.addEventListener('click', () => {
            document.getElementById('idInput').value = row.dataset.id;
            document.getElementById('emailInput').value = row.dataset.email;
            document.getElementById('complaintInput').value = row.dataset.complaint;
            document.getElementById('dateInput').value = row.dataset.date;
            document.getElementById('answerInput').value = row.dataset.answer;
        });
    });
});


    document.addEventListener('DOMContentLoaded', () => {
    const pendingRows = document.querySelectorAll('.pending-row');

    pendingRows.forEach(row => {
    row.addEventListener('click', () => {
    document.getElementById('pendingIdInput').value = row.dataset.id;
    document.getElementById('pendingEmailInput').value = row.dataset.email;
    document.getElementById('pendingComplaintInput').value = row.dataset.complaint;
    document.getElementById('pendingDateInput').value = row.dataset.date;

    // Optional auto-scroll to form
    document.getElementById('pendingUpdateForm').scrollIntoView({behavior: "smooth"});
});
});
});



