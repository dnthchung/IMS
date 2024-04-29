/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.offer;

import dao.OfferDAO;
import dto.OfferExportDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author tranh
 */
@WebServlet(name = "ExportOfferController", urlPatterns = {"/export-offer"})
public class ExportOfferController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("offer-list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        OfferDAO offerDAO = new OfferDAO();

        String dateFrom = request.getParameter("fromDate");
        String dateTo = request.getParameter("toDate");
        String outputFormat = "yyyy-MM-dd";
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat outputDateFormat = new SimpleDateFormat(outputFormat);

        try {
            Date dateFromFormated = inputDateFormat.parse(dateFrom);
            Date dateToFormated = inputDateFormat.parse(dateTo);

            if (dateToFormated.after(dateFromFormated)) {
                dateFrom = outputDateFormat.format(dateFromFormated);
                dateTo = outputDateFormat.format(dateToFormated);

                List<OfferExportDTO> offers = offerDAO.getAllOffersInDateRange(dateFrom, dateTo);
                if (offers.isEmpty()) {
                    response.sendRedirect("offer-list?isEmptyExport=true");
                } else {
                    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    response.setHeader("Content-Disposition", "attachment; filename=Offerlist-" + dateFrom + "_" + dateTo + ".xlsx");
                    writeObjectsToExcel(offers, "Offerlist-" + dateFrom + "_" + dateTo + ".xlsx", response);
                }
            } else {
                response.sendRedirect("offer-list?isInvalidDate=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("offer-list?isInvalidDate=true");
        }

    }

    private void writeObjectsToExcel(List<OfferExportDTO> offers, String fileName, HttpServletResponse response) {
        // Tạo một workbook mới
        try (Workbook workbook = new XSSFWorkbook()) {
            // Tạo một trang trong workbook
            Sheet sheet = workbook.createSheet("Offers");

            // Tạo hàng dữ liệu đầu tiên là tiêu đề
            Row headerRow = sheet.createRow(0);
            String[] columns = {"No",
                "Offer ID",
                "Candidate ID",
                "Candidate Name",
                "Candidate Email",
                "Candidate CV",
                "Contract Type",
                "Position",
                "Level",
                "Department",
                "Approver Account",
                "Recruiter Account",
                "Contract From",
                "Contract To",
                "Offer Due Date",
                "Basic Salary",
                "Offer Status",
                "Note",
                "Created On",
                "Last Modified",
                "Modified By"
            };
            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
            }

            // Ghi dữ liệu của mỗi đối tượng vào các hàng
            int rowNum = 1;
            int count = 1;
            for (OfferExportDTO offer : offers) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(count);
                row.createCell(1).setCellValue(offer.getOfferId());
                row.createCell(2).setCellValue(offer.getCandidateId());
                row.createCell(3).setCellValue(offer.getCandidateName());
                row.createCell(4).setCellValue(offer.getCandidateEmail());
                row.createCell(5).setCellValue(offer.getCandidateCV());
                row.createCell(6).setCellValue(offer.getContractType());
                row.createCell(7).setCellValue(offer.getPosition());
                row.createCell(8).setCellValue(offer.getLevel());
                row.createCell(9).setCellValue(offer.getDepartment());
                row.createCell(10).setCellValue(offer.getApproverAccount());
                row.createCell(11).setCellValue(offer.getRecruiterAccount());
                row.createCell(12).setCellValue(offer.getContractFrom());
                row.createCell(13).setCellValue(offer.getContractTo());
                row.createCell(14).setCellValue(offer.getOfferDueDate());
                row.createCell(15).setCellValue(offer.getBasicSalary());
                row.createCell(16).setCellValue(offer.getOfferStatus());
                row.createCell(17).setCellValue(offer.getNote());
                row.createCell(18).setCellValue(offer.getCreatedOn());
                row.createCell(19).setCellValue(offer.getLastModified());
                row.createCell(20).setCellValue(offer.getModifiedBy());
                count++;
            }

            // Ghi workbook vào tệp
            try (OutputStream outputStream = response.getOutputStream()) {
                workbook.write(outputStream);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
