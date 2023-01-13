<?php
require("fpdf/fpdf.php");
// check if the form has been submitted
if (isset($_REQUEST['user_id'])) {
    // get the user's unique identifier from the query string
    $user_id = $_REQUEST['user_id'];
    // create a QR code with the user's unique identifier
    $qr_code_url = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=" . urlencode($user_id);
    $pdf = new FPDF();
    $pdf->AddPage();

    // Get the QR code image and add it to the PDF
    $pdf->Image($qr_code_url, 10, 10, 75, 75, 'PNG');

    // Set the headers to force a download
    header("Content-Type: application/pdf");
    header("Content-Disposition: attachment; filename=qr_code_user_" . $user_id . ".pdf");

    // Output the PDF to the user
    $pdf->Output('F', 'qr_code_user_' . $user_id . '.pdf');

    // Display the QR code on the page
    echo "<img src='" . $qr_code . "' alt='QR code for " . $user_id . "'>";
}
?>