/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.JobDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import model.Benefit;
import model.Job;
import model.Level;
import model.Skill;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author acer
 */
public class JobExcelWriter {

    public static final int COLUMN_INDEX_ID = 0;
    public static final int COLUMN_INDEX_JOB_TITLE = 1;
    public static final int COLUMN_INDEX_SALARY_DESCRIPTION = 2;
    public static final int COLUMN_INDEX_SALARY_WORKING_ADDRESS = 3;
    public static final int COLUMN_INDEX_SALARY_FROM = 4;
    public static final int COLUMN_INDEX_SALARY_TO = 5;
    public static final int COLUMN_INDEX_START_DATE = 6;
    public static final int COLUMN_INDEX_END_DATE = 7;
    public static final int COLUMN_INDEX_SKILLS = 8;
    public static final int COLUMN_INDEX_LEVELS = 9;
    public static final int COLUMN_INDEX_BENEFITS = 10;
    public static final int COLUMN_INDEX_STATUS = 11;

    public static Workbook write(ArrayList<Job> jobs) throws IOException {
        // Create Workbook
        Workbook workbook = new XSSFWorkbook();

        // Create sheet
        Sheet sheet = workbook.createSheet("Jobs"); // Create sheet with sheet name

        int rowIndex = 0;

        // Write header
        writeHeader(sheet, rowIndex);

        // Write data
        rowIndex++;
        for (Job job : jobs) {
            // Create row
            Row row = sheet.createRow(rowIndex);
            // Write data on row
            writeJob(job, row);
            rowIndex++;
        }

        // Auto resize column witdth
        int numberOfColumn = sheet.getRow(0).getPhysicalNumberOfCells();
        autosizeColumn(sheet, numberOfColumn);

        return workbook;
    }

    // Write header with format
    private static void writeHeader(Sheet sheet, int rowIndex) {
        // create CellStyle
        CellStyle cellStyle = createStyleForHeader(sheet);

        // Create row
        Row row = sheet.createRow(rowIndex);

        // Create cells
        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("id");

        cell = row.createCell(COLUMN_INDEX_JOB_TITLE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("title");

        cell = row.createCell(COLUMN_INDEX_SALARY_DESCRIPTION);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("description");

        cell = row.createCell(COLUMN_INDEX_SALARY_WORKING_ADDRESS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("working_address");

        cell = row.createCell(COLUMN_INDEX_SALARY_FROM);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("salary_from");

        cell = row.createCell(COLUMN_INDEX_SALARY_TO);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("salary_to");

        cell = row.createCell(COLUMN_INDEX_START_DATE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("start_date");

        cell = row.createCell(COLUMN_INDEX_END_DATE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("end_date");

        cell = row.createCell(COLUMN_INDEX_SKILLS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("skills");

        cell = row.createCell(COLUMN_INDEX_LEVELS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("levels");

        cell = row.createCell(COLUMN_INDEX_BENEFITS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("benefits");

        cell = row.createCell(COLUMN_INDEX_STATUS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("status");
    }

    // Write data
    private static void writeJob(Job job, Row row) {
        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellValue(job.getJobId());

        cell = row.createCell(COLUMN_INDEX_JOB_TITLE);
        cell.setCellValue(job.getJobTitle());

        cell = row.createCell(COLUMN_INDEX_SALARY_DESCRIPTION);
        cell.setCellValue(job.getDescription());

        cell = row.createCell(COLUMN_INDEX_SALARY_WORKING_ADDRESS);
        cell.setCellValue(job.getWorkAddress());

        cell = row.createCell(COLUMN_INDEX_SALARY_FROM);
        cell.setCellValue(job.getFormatedSalary(job.getSalaryFrom()));

        cell = row.createCell(COLUMN_INDEX_SALARY_TO);
        cell.setCellValue(job.getFormatedSalary(job.getSalaryTo()));

        cell = row.createCell(COLUMN_INDEX_START_DATE);
        cell.setCellValue(job.getFormatedDate(job.getStartDate()));

        cell = row.createCell(COLUMN_INDEX_END_DATE);
        cell.setCellValue(job.getEndDate());

        cell = row.createCell(COLUMN_INDEX_SKILLS);
        cell.setCellValue(String.join(", ", joinSkillNames(job.getSkill())));

        cell = row.createCell(COLUMN_INDEX_LEVELS);
        cell.setCellValue(String.join(", ", joinLevelNames(job.getLevel())));

        cell = row.createCell(COLUMN_INDEX_BENEFITS);
        cell.setCellValue(String.join(", ", joinBenefitNames(job.getBenefit())));

        cell = row.createCell(COLUMN_INDEX_STATUS);
        cell.setCellValue(job.getStatus() ? "open" : "closed");
    }

    // Create CellStyle for header
    private static CellStyle createStyleForHeader(Sheet sheet) {
        // Create font
        Font font = sheet.getWorkbook().createFont();
        font.setFontName("Times New Roman");
        font.setBold(true);
        font.setFontHeightInPoints((short) 14); // font size
        font.setColor(IndexedColors.WHITE.getIndex()); // text color

        // Create CellStyle
        CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
        cellStyle.setFont(font);
        cellStyle.setFillForegroundColor(IndexedColors.BLUE.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        return cellStyle;
    }

    // Auto resize column width
    private static void autosizeColumn(Sheet sheet, int lastColumn) {
        for (int columnIndex = 0; columnIndex < lastColumn; columnIndex++) {
            sheet.autoSizeColumn(columnIndex);
        }
    }

    private static String[] joinLevelNames(ArrayList<Level> levels) {
        String[] levelNames = new String[levels.size()];
        for (int i = 0; i < levelNames.length; ++i) {
            levelNames[i] = levels.get(i).getLevelName();
        }
        return levelNames;
    }

    private static String[] joinSkillNames(ArrayList<Skill> skills) {
        String[] levelNames = new String[skills.size()];
        for (int i = 0; i < levelNames.length; ++i) {
            levelNames[i] = skills.get(i).getSkillName();
        }
        return levelNames;
    }

    private static String[] joinBenefitNames(ArrayList<Benefit> benefits) {
        String[] levelNames = new String[benefits.size()];
        for (int i = 0; i < levelNames.length; ++i) {
            levelNames[i] = benefits.get(i).getBenefitName();
        }
        return levelNames;
    }

    public static void main(String[] args) {
        try {
            JobDAO jobService = new JobDAO();
            var jobs = jobService.list();
            JobExcelWriter.write(jobs);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
